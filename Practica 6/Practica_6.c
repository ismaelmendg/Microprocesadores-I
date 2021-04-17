#include "GPIOs.h"
#include "ADC.h"
#include <stdio.h>
#define valor 102 //Escala celsius de 0 a 100 - 40 grados = 102 bits
void secuencia(void);
int static cont = 0;
int main(void){

	int i;
	int *ADCresult = (int*)0x4003B010;
	int *PDIR_Boton = (int *)0x400FF090;
	PinMode('D', 1, 'O');
	PinMode('B', 18, 'O');
	PinMode('B', 19, 'O');
	DigitalWrite('D', 1, 1);
	DigitalWrite('B', 18, 1);
	DigitalWrite('B', 19, 1);

while(1){

	cont = 0;
	PinMode('C', 1, 'O');
	vfnADC();
	printf("%i\n", *ADCresult);
	if(*ADCresult > valor){
		for(i=0; i < 15; i++ ){
			vfnADC();
			printf("-%i\n", *ADCresult);
	if(*ADCresult < valor)
		break;
}
	while(*PDIR_Boton != 0x2){
		for(i=0; i<1000000; i++){
			if(*PDIR_Boton == 0x2){
				cont = 6;
			secuencia();
				break;}
}
		if(cont != 6){
			secuencia();
}}}
}}

void secuencia(){

	PinMode('C', 1, 'I');

		switch(cont){
			case 0: //Estado 0 Azul
				DigitalWrite('D', 1, 0);
				DigitalWrite('B', 18, 1);
				DigitalWrite('B', 19, 1);
				cont++; break;
			case 1: //Estado 1 Rojo
				DigitalWrite('D', 1, 1);
				DigitalWrite('B', 18, 0);
				DigitalWrite('B', 19, 1);
				cont++; break;
			case 2://Estado 2 Verde
				DigitalWrite('D', 1, 1);
				DigitalWrite('B', 18, 1);
				DigitalWrite('B', 19, 0);
				cont++; break;
			case 3: //Estado 3 Cian
				DigitalWrite('D', 1, 0);
				DigitalWrite('B', 18, 1);
				cont++; break;
			case 4: //Estado 4 Verde
				DigitalWrite('D', 1, 1);
				DigitalWrite('B', 18, 1);
				DigitalWrite('B', 19, 0);
				cont++; break;
			case 5:	//Estado 5 Rojo
				DigitalWrite('D', 1, 1);
				DigitalWrite('B', 18, 0);
				DigitalWrite('B', 19, 1);
				cont = 0; break;
			case 6:
				DigitalWrite('D', 1, 1);
				DigitalWrite('B', 18, 1);
				DigitalWrite('B', 19, 1);
			    break;
}}
