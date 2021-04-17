.text
.global entrada1
.type entrada1 function

entrada1:
MOV r0, #4 //i
MOV r1, #2 //sum

for:
NOP  //Primer printf
CMP r1, r0
BLS salida
ADD r0, r0, #1
NOP //Segundo printf
CMP r1, r0
BLS salida
ADD r0, r0, #1
B for

salida:
BX LR

//int main()
//{
  //  int sum = 15;
   // for (int i=0; i < sum; i++)
    //{
      // i += 1;
      // printf("%i\n",i);
    //}
    //return 0;
//}
