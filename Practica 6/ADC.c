
void vfnADC(void){

	int *pRELOJ_PIN = (int*)0x40048038; //Reloj del Pin
	int *pRELOJ_ADC = (int*)0x4004803C; //Reloj del ADC
	int *PCRE 	 = (int*)0x4004A004; //PCR del Pin B1
	int *ADC_SC1A = (int*)0x4003B000; //Status and Control Register 1

	*pRELOJ_PIN = 0x400; 	 		//Enceder Reloj del Pin
	*pRELOJ_ADC = 0x8000000;		//Encender Reloj del ADC
	*PCRE	 = *PCRE & ~(0x700);    //Pin B1 como analogo
	*ADC_SC1A = *ADC_SC1A & ~(0x16);//7  01001 AD9 PTB1

}

