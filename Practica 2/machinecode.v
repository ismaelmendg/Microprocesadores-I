	module machinecode(
		input [3:0] r,
		input [4:0] flags,
		input [3:0] swt,
		input clk,
		output[3:0] oA,
		output[3:0] oB,
		output[3:0] opcode,
		output led,
		output [3:0] result
);

reg [3:0] oa;
reg [3:0] ob;
reg [3:0] roa;
reg [3:0] rob;
reg [3:0] ocode;
reg [3:0] ropcode;
reg [3:0] cont;
reg [3:0] contador;
reg oled;
reg rled;
reg [3:0] state, nextstate;

assign oA = roa;
assign oB = rob;
assign opcode = ropcode; 
assign led = rled; 
assign result = contador;

	always @(posedge clk)begin
	roa <= oa;
	rob <= ob;
	ropcode <= ocode;
	rled <= oled;
	state <= nextstate;
	contador <= cont;
end
		
always @(*)
	case(state)	
/////////////////////////////////////////////////////////////////////////////	
	0: begin //Mayor que
				oa = swt;
				ob = 4'd7;
				ocode = 4'd9;
			if(flags[2]==0)//Si (swt-8) da postivo es porque es mayor 
				nextstate = 1;//************	
		else  nextstate = 2;//************
		end
/////////////////////////////////////////////////////////////////////////////		
	1:
		begin
				oa = cont;//iA = al contador
				ob = 4'd1;//iB = 1 decimal
				ocode = 4'd8;//Opcode en suma
				cont = r;// contador sumando - entrada a 7 segresultado que va al BCD
				nextstate = 0;//************	
		end
/////////////////////////////////////////////////////////////////////////////		
	2: begin //Igual que
				oa = swt;//valor de el switch de entrada
				ob = 4'd7;//Valor predefinido para entrada
				ocode = 4'd9;//Resta
			if((flags[0] == 1))//oa - ob En caso de ser iguales al restarse darian cero
				nextstate = 3; //************
			else nextstate = 4;//************
		end
/////////////////////////////////////////////////////////////////////////////		
	3:
		begin
				oled = 1'd1;//LED encendido
				nextstate = 0;//************
		end
/////////////////////////////////////////////////////////////////////////////				
	4: begin //Menor que
				oa = swt;
				ob = 4'd7;
				ocode = 4'd9;
			if(flags[2]==1);
				nextstate = 5; //************
	end
/////////////////////////////////////////////////////////////////////////////		
	5:
		begin
				oa = cont;
				ob = 4'd1;
				ocode = 4'd9;//Opcode en resta 
				cont = r;//contador restando - entrada a 7 seg 
				nextstate = 0;
		end
/////////////////////////////////////////////////////////////////////////////		
	endcase	
endmodule
 
