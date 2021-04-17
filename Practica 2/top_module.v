module top_module(
		input clk,
		input [3:0]swt,
		output [6:0]a7seg,
		output oled
);

wire wdiv;
wire wresultaBCD;
wire wiA;
wire wib;
wire wOpcode;
wire wresult;
wire wflags;


divisorf(
	.clk(clk),
	.oSenal(wdiv)
);

BCD7seg(
	.iBCD(wresultaBCD),
	.clk(wdiv),
	.oSalida(a7seg)
);

ALU(
	.Opcode(wOpcode),
	.iA(wiA),
	.iB(wib),
	.clk(wdiv),
	.Oresult(wresult),
	.Oflags(wflags)
);

machinecode(
	.clk(wdiv),
	.swt(swt),
	.r(wresult),
	.flags(wflags),
	.oA(wiA),
	.oB(wib),
	.led(oled),
	.opcode(wOpcode),
	.result(wresultaBCD)
);

endmodule
