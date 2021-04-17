module ALU(
		input[3:0] Opcode,
		input[3:0] iA,
		input[3:0] iB,
		input clk,
		output[3:0] Oresult,
		output[4:0] Oflags
);

			reg [3:0] result;
			reg [4:0] f; //Flag
			reg [3:0] resultado;
			reg [4:0] flags;
			assign Oresult = resultado;
			assign Oflags = flags;
			
		always @(posedge clk)begin
			 resultado = result;
			 flags = f;
		end
			
		always @(*)
	begin 
		case(Opcode)
			4'B0000: begin//Complemento a 1*
				result = ~iA; end
			4'B0001: begin//Complemento a 2*
				result = ~iA + 4'b0001; end
			4'B0010: begin//Desplzar a izquierda aritmética*
				result = iA<<<1; end
			4'B0011: begin//Desplazar a derecha aritmética*
				result = {iA[3], iA[3:1]}; end
			4'B0100: begin//Desplazar a izquierda logico*
				result = iA<<1; end
			4'B0101: begin//Desplazar a derecha logico*
				result = iA>>1; end
			4'B0110: begin//Rotación a izquierda*
				result = {iA[2:0], iA[3]}; end
			4'B0111: begin//Rotación a derecha *
				result = {iA[0], iA[3:1]}; end
			4'B1000: begin//Súma *
				result = iA + iB; end 
			4'B1001: begin//Resta*	
				result = iA - iB; end
			4'B1010: begin//And*
				result = iA & iB; end
			4'B1011: begin//Or*
				result = iA | iB; end
			4'B1100: begin//Not* 
				result = !iA; end
			4'B1101: begin//Xor*
				result = iA ^ iB; end
		endcase 
		//Zero
			if(result == 0)
				f[0] = 1;
					else f[0] = 0;
				
		//Carry
			if(result >= 5'b10000)
				f[1] = 1;
					else f[1] = 0;	
					
		//Sign
				if(result[3] == 1)
						f[2] = 1;
							else f[2] = 0; 
		//overflow
			if ((result >= 4'b1000)||(result >= -4'd9))
				f[3] = 1;
					else f[3] = 0;
		//paridad
			if ((result[0] ^ result[1] ^ result[2] ^ result[3])==1)
						f[4] = 1;
					else if (f[0] == 1)
						f[4] = 0;
					else	
						f[4] = 0;
	end	
endmodule


