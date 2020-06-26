module crossbar (
	input clk,
	input reset,
	
	/* Masters */
	input master_0_req,				// transaction request
	output master_0_ack,
	input master_0_cmd,				// 0 - read, 1 - write (master -> slave)
	output master_0_resp,
	input [31:0] master_0_addr,
	input [31:0] master_0_wdata,
	output [31:0] master_0_rdata,
	
	input master_1_req,				// transaction request
	output master_1_ack,
	input master_1_cmd,				// 0 - read, 1 - write (master -> slave)
	output master_1_resp,
	input [31:0] master_1_addr,
	input [31:0] master_1_wdata,
	output [31:0] master_1_rdata,
	
	/* Slaves */
	output reg slave_0_req,
	input slave_0_ack,
	output slave_0_cmd,
	input slave_0_resp,
	input [31:0] slave_0_rdata,
	output [31:0] slave_0_wdata,
	output [31:0] slave_0_addr,
	
	output reg slave_1_req,
	input slave_1_ack,
	output slave_1_cmd,
	input slave_1_resp,
	input [31:0] slave_1_rdata,
	output [31:0] slave_1_wdata,
	output [31:0] slave_1_addr
	);
	
	reg master_num;
	reg read_mode;
	
	assign master_0_resp = (master_num == 0)?
								  ((slave_0_resp ? 1'b1 : slave_1_resp ? 1'b1 : 1'b0))
								  : 1'b0;
	assign master_1_resp = (master_num == 1)?
								  ((slave_0_resp ? 1'b1 : slave_1_resp ? 1'b1 : 1'b0))
								  : 1'b0;
	
	assign master_0_rdata = (read_mode && master_num == 0) ?
									(slave_0_resp ? slave_0_rdata : slave_1_resp ? slave_1_rdata : 0)
									: 0;
	assign master_1_rdata = (read_mode && master_num == 1) ?
									(slave_0_resp ? slave_0_rdata : slave_1_resp ? slave_1_rdata : 0)
									: 0;
	
	assign master_0_ack = ((slave_0_ack || slave_1_ack) && master_num == 0)?1'b1:1'b0;
	assign master_1_ack = ((slave_0_ack || slave_1_ack) && master_num == 1)?1'b1:1'b0;
	
	assign slave_0_addr = (slave_0_ack && master_num == 0)?master_0_addr :
								 ((slave_0_ack && master_num == 1)?master_1_addr:0);
	assign slave_1_addr = (slave_1_ack && master_num == 0)?master_0_addr :
								 ((slave_1_ack && master_num == 1)?master_1_addr:0);
	
	assign slave_0_wdata = (slave_0_ack && master_num == 0)?master_0_wdata :
								  ((slave_0_ack && master_num == 1)?master_1_wdata:0);
	assign slave_1_wdata = (slave_1_ack && master_num == 0)?master_0_wdata :
								  ((slave_1_ack && master_num == 1)?master_1_wdata:0);
	
	assign slave_0_cmd = (slave_0_ack && master_num == 0)?master_0_cmd :
								(slave_0_ack && master_num == 1)?master_1_cmd:1'b0;

	assign slave_1_cmd = (slave_1_ack && master_num == 0)?master_0_cmd :
								(slave_1_ack && master_num == 1)?master_1_cmd:1'b0;
	
	always @(posedge clk)
	begin

		if (reset)
		begin
			master_num <= 0;
			read_mode <= 0;
			
			slave_0_req <= 0;
			slave_1_req <= 0;
		end
		else
		begin
			if (slave_0_resp || slave_1_resp)
			begin
				read_mode <= 0;
			end
			else if (master_0_req || master_1_req)
			begin
				/* round-robin */
				if (master_0_req && master_1_req)
					master_num = ~master_num;
				else
					master_num = master_0_req?1'b0:1'b1;
				
				case (master_num)
					1'b0 :
						begin
							if (master_0_addr[31])
								slave_1_req = 1;
							else
								slave_0_req = 1;
							
							read_mode <= !master_0_cmd?1'b1:1'b0;
						end
					1'b1 :
						begin
							if (master_1_addr[31])
								slave_1_req = 1;
							else
								slave_0_req = 1;
							
							read_mode <= !master_1_cmd?1'b1:1'b0;
						end
						
				endcase
				
			end
			else
			begin
				slave_0_req <= 0;
				slave_1_req <= 0;
			end
	end

	end
	
endmodule
