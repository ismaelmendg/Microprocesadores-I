.text
.global entrada4
.type entrada4 function

entrada4:

MOV r0, #5 //Numero 1
MOV r1, #1 //Numero 2
MOV r2, #0 //Contador

CMP r1, r0
BHI mayor //r1 mayor a r0 - Numero 2 mayor
BEQ igual
BCC menor //r0 mayor a r1b - Numero 2 menor

mayor:
ADD r2, r2, #1
B salida
NOP

igual:
ADD r2, r1, r0
B salida
NOP

menor:
SUB r2, r2, #1
NOP

salida:
BX LR

//void vfnCompareNumbers (usigned char bNumber1, unsigned char bNumber2)
//{
//if (bNumber1 < bNumber2)
//{
  //  ubCounter++;
//}
//else if (bNumber1 == bNumber2)
//{
  //  ubCounter = bNumber1 + bNumber2;
//}
//else
//{
  //  ubCounter--;
//}

//}
