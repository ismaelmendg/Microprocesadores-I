.text
.global entrada3
.type entrada3 function

entrada3:

MOV r0, #0 //n
SUB r0, r0, #3

do_while:
NOP
ADD r0, r0, #1
NOP
CMP r0, #0 //condición
BPL salida //PL Postivo o cero
B do_while

salida:
 BX LR

//int n = 1;
//do
//{
  // n++;
//}
//while (n < 0)
