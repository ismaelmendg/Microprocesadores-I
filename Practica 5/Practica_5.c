#include <stdio.h>
#include "GPIOs.h"

int main(void)
{
	PinMode('B', 18, 'O');
	PinMode('B', 19, 'O');
	PinMode('D', 1, 'O');
	DigitalWrite('B', 18, 1);
	DigitalWrite('B', 19, 1);
	DigitalWrite('D', 1, 1);
	DigitalWrite('B', 18, 0);//Rojo
	DigitalWrite('B', 19, 0);//verde
	DigitalWrite('D', 1, 0);//azul
	PinMode('B', 20, 'I');
	DigitalWrite('B', 19, 1);
	///////
	DigitalWrite('B', 18, 1);
	DigitalWrite('B', 19, 0);//Verde
	DigitalWrite('D', 1, 0);//Azul
	DigitalWrite('D', 1, 1);//cian
	DigitalWrite('B', 19, 1);
	DigitalWrite('B', 18, 0);//Rojo
	DigitalWrite('D', 1, 0);//Azul
	DigitalWrite('D', 1, 1);//Magenta
	DigitalWrite('B', 18, 1);
    return 0 ;
}
