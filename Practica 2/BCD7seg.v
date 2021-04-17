module BCD7seg(
	input [3:0]iBCD,
	input clk,
	output [6:0]oSalida
);

reg [6:0]rSalida_D;
reg [6:0]rSalida_Q;

assign oSalida = rSalida_Q;

always @ (posedge clk)
begin
	rSalida_Q <= rSalida_D;
end

always @*
begin
	case(iBCD)								
		4'd0: rSalida_D = 7'b1111110;
		4'd1:	rSalida_D = 7'b0110000;
		4'd2:	rSalida_D = 7'b1101101;
		4'd3:	rSalida_D = 7'b1111001;
		4'd4:	rSalida_D = 7'b0110011;
		4'd5:	rSalida_D = 7'b1011010;
		4'd6:	rSalida_D = 7'b1011111;
		4'd7:	rSalida_D = 7'b1110000;
		4'd8:	rSalida_D = 7'b1111111;
		4'd9:	rSalida_D = 7'b1110011;
	endcase
end

endmodule 
