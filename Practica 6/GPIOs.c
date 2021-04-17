/*
 Nombre: Ismael Mendoza García
 Práctica: 05
 Fecha: 17/03/2021
  */

	///////////////
	int *pRELOJ = (int *)0x40048038, pRELOJg = 0x200;
	int *pPCR, PCRg = 0x100;
	int *PDDRA = (int*)0x400FF014;  //Dirección PDDR puerto A
	int *PDDRB = (int *)0x400FF054; //Dirección PDDR puerto B
	int *PDDRC = (int *)0x400FF094; //Dirección PDDR puerto C
	int *PDDRD = (int *)0x400FF0D4; //Dirección PDDR puerto D
	int *PDDRE = (int *)0x400FF114; //Dirección PDDR puerto E
	int *PDORA = (int *)0xF80FF000; //Dirección PDOR puerto A
	int *PDORB = (int *)0xF80FF040; //Dirección PDOR puerto B
	int *PDORC = (int *)0xF80FF080; //Dirección PDOR puerto C
	int *PDORD = (int *)0xF80FF0C0; //Dirección PDOR puerto D
	int *PDORE = (int *)0xF80FF100; //Dirección PDOR puerto E
	//////////////
void PinMode(unsigned char puerto, unsigned char Pin, char InputOutput){

	switch(puerto){
	case 'A':
		*pRELOJ = (*pRELOJ | pRELOJg); //Activar reloj para el puerto A en el Pin 9
		pPCR = (int *)(0x40049000 + (4*Pin)); //Activar el PCR comenzando por la dirección cero y aumentando por 4 dependiendo del Pin
		*pPCR = PCRg;
		if(InputOutput == 'O'){
			*PDDRA = *PDDRA | (1 <<Pin);
		}else
			*PDDRA = *PDDRA & ~(1<<Pin);
		break;
	case 'B':
		*pRELOJ = (*pRELOJ | (pRELOJg<<1)); //Activar reloj para el puerto A en el Pin 10
		pPCR = (int *)(0x4004A000 + (4*Pin));
		*pPCR = PCRg;
		if(InputOutput == 'O'){
			*PDDRB = *PDDRB | (1 <<Pin);
		}else
			*PDDRB = *PDDRB & ~(1<<Pin);
		break;
	case 'C':
		*pRELOJ = (*pRELOJ | (pRELOJg<<2)); //Activar reloj para el puerto A en el Pin 11
		pPCR = (int *)(0x4004B000 + (4*Pin));
		*pPCR = PCRg;
		if(InputOutput == 'O'){
			*PDDRC = *PDDRC | (1 <<Pin);
		}else
			*PDDRC = *PDDRC & ~(1<<Pin);
		break;
	case 'D':
		*pRELOJ = (*pRELOJ | (pRELOJg<<3)); //Activar reloj para el puerto A en el Pin 12
		pPCR = (int *)(0x4004C000 + (4*Pin));
		*pPCR = PCRg;
		if(InputOutput == 'O'){
			*PDDRD = *PDDRD | (1 <<Pin);
		}else
			*PDDRD = *PDDRD & ~(1<<Pin);
		break;
	case 'E':
		*pRELOJ = (*pRELOJ | (pRELOJg<<4)); //Activar reloj para el puerto A en el Pin 13
		pPCR = (int *)(0x4004D000 + (4*Pin));
		*pPCR = PCRg;
		if(InputOutput == 'O'){
			*PDDRE = *PDDRE | (1 <<Pin);
		}else
			*PDDRE = *PDDRE & ~(1<<Pin);
		break;}}

void DigitalWrite(unsigned char puerto, unsigned char Pin, unsigned char accion){

	switch(accion){
	case 1:
		switch(puerto){
			case 'A': *PDORA = *PDORA | (1 <<Pin);
			break;
			case 'B': *PDORB = *PDORB | (1 <<Pin);
			break;
			case 'C': *PDORC = *PDORC | (1 <<Pin);
			break;
			case 'D': *PDORD = *PDORD | (1 <<Pin);
			break;
			case 'E': *PDORE = *PDORE | (1 <<Pin);
			break;}
		break;
	case 0:
		switch(puerto){
			case 'A': *PDORA = *PDORA & ~(1<<Pin);
			break;
			case 'B': *PDORB = *PDORB & ~(1<<Pin);
			break;
			case 'C': *PDORC = *PDORC & ~(1<<Pin);
			break;
			case 'D': *PDORD = *PDORD & ~(1<<Pin);
			break;
			case 'E': *PDORE = *PDORE & ~(1<<Pin);
			break;}
		break;}}
