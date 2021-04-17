module divisorf(
	input clk,
	output oSenal
);

reg rSenal_D;
reg rSenal_Q;

reg [27:0]rContador_D;
reg [27:0]rContador_Q;

assign oSenal = rSenal_Q;

always @(posedge clk) begin
	rSenal_Q = rSenal_D;
	rContador_Q = rContador_D;
end

always @(*) begin
	if(rContador_Q == 28'd15000000)
	begin
		rSenal_D = 1'b1;
		rContador_D = 28'd0;
	end
	else
	begin
		rSenal_D = 1'b0;
		rContador_D = rContador_Q + 1'd1;
	end
end
endmodule
