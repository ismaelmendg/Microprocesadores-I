.text
.global entrada2
.type entrada2 function

entrada2:

MOV r0, #0 //n
NOP

while:
CMP r0, #0
BEQ salida
SUB r0, r0, #1
NOP
B while

salida:
SUB r0, r0, #1
NOP
BX LR


//int main(){
//int n = 20;

//while (n--){

  // printf("%i\n", n);
//}
//}
