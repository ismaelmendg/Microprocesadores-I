

#ifndef GPIOS_H_
#define GPIOS_H_

void PinMode(unsigned char puerto, unsigned char Pin, unsigned char InputOutput);
void DigitalWrite(unsigned char puerto, unsigned char Pin, unsigned char accion);

#endif /* GPIOS_H_ */
