 //ovo je kod za line folow click
 // ukljuci gornji adc int na RA0 i uklju?i sviceve 1.1 i 2.1  i jumpere j3 i j4 stavi na USB UART

#include <built_in.h>

//char uart_rd;

int U3R;    //sve sto treba za ocitavanje
int U3;
int U2R;
int U2;
int U1R;
int U1;
int U4R;
int U4;
int U5R;
int U5;

int cal; //za granicu belo crno

void mod(int c) {            //paljenje lampica
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

void ridd (){                  //cita vrednosti sa line folow clicka

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

preracunaj (){                               //pretvara u brojku od -4 do 4 stanje na senzoru
    if(U1==1 && U2==1 && U3==1 && U4==1 && U5==1){mod(0);}          //pravo
    if(U1==0 && U2==0 && U3==1 && U4==0 && U5==0){mod(0);}
    if(U1==0 && U2==1 && U3==1 && U4==1 && U5==0){mod(0);}

    if(U1==1 && U2==0 && U3==0 && U4==0 && U5==0){mod(4);}          //4 desno

    if(U1==1 && U2==1 && U3==0 && U4==0 && U5==0){mod(3);}          //3 desno

    if(U1==0 && U2==1 && U3==0 && U4==0 && U5==0){mod(2);}          //2 desno
    if(U1==1 && U2==1 && U3==1 && U4==0 && U5==0){mod(2);}

    if(U1==0 && U2==1 && U3==1 && U4==0 && U5==0){mod(1);}
    if(U1==1 && U2==1 && U3==1 && U4==1 && U5==0){mod(1);}          //1 desno

    if(U1==0 && U2==0 && U3==0 && U4==0 && U5==1){mod(-4);}          //4 levo

    if(U1==0 && U2==0 && U3==0 && U4==1 && U5==1){mod(-3);}          //3 levo

    if(U1==0 && U2==0 && U3==0 && U4==1 && U5==0){mod(-2);}          //2 levo
    if(U1==0 && U2==0 && U3==1 && U4==1 && U5==1){mod(-2);}

    if(U1==0 && U2==0 && U3==1 && U4==1 && U5==0){mod(-1);}          //1 levo
    if(U1==0 && U2==1 && U3==1 && U4==1 && U5==1){mod(-1);}
}

void all0 () { LATE=0x00;LATD=0x00;}   //port e i d na nulu

void main() {
  cal= 120;  //dal je crno il je belo

  ANSELA = 0x2F;             // Configure RA1 pin as analog         Jela sloncee <3
  ANSELC = 0;                // Configure PORTC pins as digital
  ANSELD = 0;                // Configure PORTD pins as digital
  ANSELE = 0;

  TRISA = 0x2F;              // Set RA1 pin as input
  TRISC = 0x00;              // Set PORTC as output
  TRISD = 0x00;
  TRISE = 0x00;

  LATA=0x00;
  all0();

  //UART1_Init(9600);               // Initialize UART module at 9600 bps
  //Delay_ms(100);

  //UART1_Write(13);
  //UART1_Write(10);

  while (1) {

    ridd();
    preracunaj();


    Delay_ms(10);
    all0();

    //LATC = adc_rd;
    //LATD = Hi(adc_rd);

    //uart_rd = UART1_Read();     // read the received data,
    // UART1_Write(U5R);       // and send data via UART
    // UART1_Write(hi(U5R));


  }
}