#line 1 "R:/GIMBOT/CRTA/LINIJA.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/built_in.h"
#line 8 "R:/GIMBOT/CRTA/LINIJA.c"
int U3R;
int U3;
int U2R;
int U2;
int U1R;
int U1;
int U4R;
int U4;
int U5R;
int U5;

int cal;

void mod(int c) {
 switch(c){
 case 4: latD0_bit=1; break;
 case 3: latD1_bit=1; break;
 case 2: latD2_bit=1; break;
 case 1: latD3_bit=1; break;
 case 0: latD4_bit=1; break;
 case -1: latD5_bit=1; break;
 case -2: latD6_bit=1; break;
 case -3: latD7_bit=1; break;
 case -4: latE0_bit=1; break;
 }
}

void ridd (){

 U5R = ADC_Read(4);
 U4R = ADC_Read(3);
 U3R = ADC_Read(2);
 U2R = ADC_Read(1);
 U1R = ADC_Read(0);

 if (U1R > cal){U1 = 1;}
 if (U1R < cal){U1 = 0;}

 if (U2R > cal){U2 = 1;}
 if (U2R < cal){U2 = 0;}

 if (U3R > cal){U3 = 1;}
 if (U3R < cal){U3 = 0;}

 if (U4R > cal){U4 = 1;}
 if (U4R < cal){U4 = 0;}

 if (U5R > cal){U5 = 1;}
 if (U5R < cal){U5 = 0;}
}

preracunaj (){
 if(U1==1 && U2==1 && U3==1 && U4==1 && U5==1){mod(0);}
 if(U1==0 && U2==0 && U3==1 && U4==0 && U5==0){mod(0);}
 if(U1==0 && U2==1 && U3==1 && U4==1 && U5==0){mod(0);}

 if(U1==1 && U2==0 && U3==0 && U4==0 && U5==0){mod(4);}

 if(U1==1 && U2==1 && U3==0 && U4==0 && U5==0){mod(3);}

 if(U1==0 && U2==1 && U3==0 && U4==0 && U5==0){mod(2);}
 if(U1==1 && U2==1 && U3==1 && U4==0 && U5==0){mod(2);}

 if(U1==0 && U2==1 && U3==1 && U4==0 && U5==0){mod(1);}
 if(U1==1 && U2==1 && U3==1 && U4==1 && U5==0){mod(1);}

 if(U1==0 && U2==0 && U3==0 && U4==0 && U5==1){mod(-4);}

 if(U1==0 && U2==0 && U3==0 && U4==1 && U5==1){mod(-3);}

 if(U1==0 && U2==0 && U3==0 && U4==1 && U5==0){mod(-2);}
 if(U1==0 && U2==0 && U3==1 && U4==1 && U5==1){mod(-2);}

 if(U1==0 && U2==0 && U3==1 && U4==1 && U5==0){mod(-1);}
 if(U1==0 && U2==1 && U3==1 && U4==1 && U5==1){mod(-1);}
}

void all0 () { LATE=0x00;LATD=0x00;}

void main() {
 cal= 120;

 ANSELA = 0x2F;
 ANSELC = 0;
 ANSELD = 0;
 ANSELE = 0;

 TRISA = 0x2F;
 TRISC = 0x00;
 TRISD = 0x00;
 TRISE = 0x00;

 LATA=0x00;
 all0();







 while (1) {

 ridd();
 preracunaj();


 Delay_ms(10);
 all0();









 }
}
