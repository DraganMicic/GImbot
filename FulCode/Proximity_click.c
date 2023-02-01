
#include <built_in.h>
#include "VCNL40x0.h"

unsigned char i_loop;       // proksimity  variables
unsigned char Command;
unsigned int ProxiValue;
unsigned int AverageProxiValue;
unsigned int AmbiValue;
unsigned long int SummProxiValue;
unsigned char InterruptStatus;
unsigned char LoByte, HiByte;
char temp_text[7];


int U3R;    //variables for line folowr sensors read
int U3;
int U2R;
int U2;
int U1R;
int U1;
int U4R;
int U4;
int U5R;
int U5;

int cal; // back - white limit

float cnt1;        //variables for timers
float cnt2;
float cnt3;

int a1;            //PWM1 up signal time in ms
int a2;            //PWM1 down signal time in ms
int c1;            //PWM2 up signal time in ms
int c2;            //PWM2 down signal time in ms

int ab;            //variable for braking (1/0 = no/yes barriere)
int last;          //last line position (0; 4; -4 - center; left; right)

int trept;         //state of down leds

void interrupt() {               //timers interrupt function
     if (TMR0IF_bit) {
        
        cnt1=cnt1+1;       //set interly timers to ++
        cnt2=cnt2+1;
        cnt3=cnt3+1;

        TMR0IF_bit = 0;
        TMR0L = 0;
     }
}

void pwm1(int t1up, int t1down){                    //PWM1 function  (t1up= time of on in PWM1 signal   t1down= time of oFF in PWM1 signal im ms)
     if(cnt1<=t1up){LATB5_bit=1;}                                   //PWM2 is set to RB5 pin
     if(cnt1>=t1up&&cnt1<=t1up+t1down){LATB5_bit=0;}
     if(cnt1>=t1up+t1down){cnt1=0;}

}
void pwm2(int t2up, int t2down){                   //PWM2 function  (t2up= time of on in PWM2 signal   t2down= time of oFF in PWM2 signal im ms)
     if(cnt2<=t2up){LATB6_bit=1;}                              //PWM2 is set to RB6 pin
     if(cnt2>=t2up&&cnt2<=t2up+t2down){LATB6_bit=0;}
     if(cnt2>=t2up+t2down){cnt2=0;}

}
void mod(int c) {           //function who is changes motors speed  depending on line position

     switch(c){
               case 4:     a1=2;a2=60;c1=18;c2=45;       break;        //line is left

               case 3:    a1=8;a2=50;c1=17;c2=30;       break;        //3333333333

               case 2:     a1=10;a2=50;c1=17;c2=30;       break;      //2222222222222

               case 1:    a1=12;a2=50;c1=17;c2=30;       break;     //11111111111111111

              case 0:    a1=13;a2=45;c1=13;c2=45;       break;      //line in the center

               case -1:   a1=17;a2=30;c1=12;c2=50;       break;      //1111111111111

               case -2:   a1=17;a2=30;c1=10;c2=50;       break;        //222222222

               case -3:  a1=17;a2=30;c1=8;c2=50;       break;        //3333333333

               case -4:  a1=18;a2=45;c1=2;c2=60;       break;       //line is right
     }
}

void ridd (){                  //function for readind ADC value of line sensors

     U5R = ADC_Read(4);      //ADC read definitions
     U4R = ADC_Read(3);
     U3R = ADC_Read(2);
     U2R = ADC_Read(1);
     U1R = ADC_Read(0);

     if (U1R > cal){U1 = 1;}     // if line is under sensor 0
     if (U1R < cal){U1 = 0;}     // if line is not  under sensor 0

     if (U2R > cal){U2 = 1;}     // if line is under sensor 1
     if (U2R < cal){U2 = 0;}       // if line is not  under sensor 1

     if (U3R > cal){U3 = 1;}       // if line is under sensor 2
     if (U3R < cal){U3 = 0;}         // if line is not  under sensor 2

     if (U4R > cal){U4 = 1;}       // if line is under sensor 3
     if (U4R < cal){U4 = 0;}         // if line is not  under sensor 3

     if (U5R > cal){U5 = 1;}       // if line is under sensor 4
     if (U5R < cal){U5 = 0;}         // if line is not  under sensor 4
}

calculate  (){         //function who ic calculate position of line and send this in mod function

    if(U1==1 && U2==1 && U3==1 && U4==1 && U5==1){mod(0);last=0;}          // 0 (if line on the center)
    if(U1==0 && U2==0 && U3==1 && U4==0 && U5==0){mod(0);last=0;}
    if(U1==0 && U2==1 && U3==1 && U4==1 && U5==0){mod(0);last=0;}

    if(U1==1 && U2==0 && U3==0 && U4==0 && U5==0){mod(4);last=4;}          //4 right

    if(U1==1 && U2==1 && U3==0 && U4==0 && U5==0){mod(4);last=3;}          //3 right

    if(U1==0 && U2==1 && U3==0 && U4==0 && U5==0){mod(4);last=2;}          //2 right
    if(U1==1 && U2==1 && U3==1 && U4==0 && U5==0){mod(4);last=2;}

    if(U1==0 && U2==1 && U3==1 && U4==0 && U5==0){mod(4);last=1;}
    if(U1==1 && U2==1 && U3==1 && U4==1 && U5==0){mod(4);last=1;}          //1 right

    if(U1==0 && U2==0 && U3==0 && U4==0 && U5==1){mod(-4);last=-4;}          //4 left

    if(U1==0 && U2==0 && U3==0 && U4==1 && U5==1){mod(-4);last=-3;}          //3 left

    if(U1==0 && U2==0 && U3==0 && U4==1 && U5==0){mod(-4);last=-2;}          //2 left
    if(U1==0 && U2==0 && U3==1 && U4==1 && U5==1){mod(-4);last=-2;}

    if(U1==0 && U2==0 && U3==1 && U4==1 && U5==0){mod(-4);last=-1;}          //1 left
    if(U1==0 && U2==1 && U3==1 && U4==1 && U5==1){mod(-4);last=-1;}

    if(U1==0 && U2==0 && U3==0 && U4==0 && U5==0 && last==-4){mod(-4);}      //no line but last position is -4
    if(U1==0 && U2==0 && U3==0 && U4==0 && U5==0 && last==4){mod(4);}        //no line but last position is 4


}


void VCNL_Set_default_Mode(){       //VCNL  setings

  ByteToStr(VCNL_RdSingle(REGISTER_ID),temp_text);
  VCNL_WrSingle(REGISTER_PROX_CURRENT, 20);
  ByteToStr(VCNL_RdSingle(REGISTER_PROX_CURRENT),temp_text);
  VCNL_WrSingle(REGISTER_PROX_RATE, PROX_MEASUREMENT_RATE_31);
  ByteToStr(VCNL_RdSingle(REGISTER_PROX_RATE), temp_text);
  VCNL_WrSingle(REGISTER_COMMAND, COMMAND_PROX_ENABLE | COMMAND_AMBI_ENABLE | COMMAND_SELFTIMED_MODE_ENABLE);
  ByteToStr(VCNL_RdSingle(REGISTER_COMMAND), temp_text);
  VCNL_WrSingle(REGISTER_INTERRUPT_CONTROL, INTERRUPT_THRES_SEL_PROX | INTERRUPT_THRES_ENABLE | INTERRUPT_COUNT_EXCEED_1);
  ByteToStr(VCNL_RdSingle(REGISTER_INTERRUPT_CONTROL), temp_text);
  VCNL_WrSingle(REGISTER_AMBI_PARAMETER, AMBI_PARA_AVERAGE_32 | AMBI_PARA_AUTO_OFFSET_ENABLE | AMBI_PARA_MEAS_RATE_2);
  ByteToStr(VCNL_RdSingle(REGISTER_AMBI_PARAMETER), temp_text);
  }

void main() {

  cal= 300;  //black-white limit calculate
  
  cnt1 = 0;   //set all ehtermal timers on 0
  cnt2 = 0;
  cnt3 = 0;

   ab=0;
   
   a1=100;
   a2=100;
   c1=100;
   c2=100;
   
   trept=0; // set  state of down leds  on 0

  ANSELA = 0x2F;      //set port A
  TRISA = 0x2F;
  LATA = 0x00;

  ANSELB = 0;              // set port B
  TRISB  = 0;
  TRISB0_bit = 1;

  ANSELC = 0;              // set port C
  TRISC  = 0;
  LATC = 0x00;
  TRISC0_BIT=1;

  ANSELD = 0;              //set port D
  TRISD  = 0;
  LATD = 0x00;

  ANSELE = 0;              // set port E
  TRISE  = 0;
  LATE = 0xFF;

  INTCON = 0xC0;                   //timer set to 1ms
  T0CON         = 0xC2;
  TMR0L         = 0;
  GIE_bit = 1;
  TMR0IE_bit = 1;
                        //I2C protocol seting proximity read
  I2C1_Init(100000);
  I2C1_Stop();
  // Set Default mode of operation for VCNL4000 chip
  VCNL_Set_default_Mode();

  // Measure average of proximity value
  // it will be used to set threshold value
  SummProxiValue = 0;
  for (i_loop = 0; i_loop < 16; i_loop++) {
    do { // wait on prox data ready bit
      Command = VCNL_RdSingle(REGISTER_COMMAND);
    } while (!(Command & COMMAND_MASK_PROX_DATA_READY)); // prox data ready ?
    VCNL_RdSeq(REGISTER_PROX_VALUE, &data_, 2);
    ProxiValue = (data_[0] << 8) | data_[1];
    SummProxiValue += ProxiValue; // Summ of all measured prox values
  }
  AverageProxiValue = SummProxiValue / 16; // calculate average

  LoByte = (unsigned char)((AverageProxiValue + 20) & 0x00FF);
  HiByte = (unsigned char)(((AverageProxiValue + 20) & 0xFF00) >> 8);
  VCNL_WrSingle(REGISTER_INTERRUPT_HIGH_THRES, HiByte);
  VCNL_WrSingle(REGISTER_INTERRUPT_HIGH_THRES + 1, LoByte);
  WordToStr(AverageProxiValue + 20, temp_text);
  
  
  LATB = 0x00;  //again set port B pins to 0
  
  Delay_ms(50);
  
  LATD0_bit=0;  //again set port D pins to 0
  LATD1_bit=0;
  LATD3_bit=0;
  LATD5_bit=0;

  while (1) {

    ridd();
    calculate();
    
    if(ab==0){         //if is not  barriere

              pwm1(c1,c2);   //set PWM1 and PWM2 (motors speeds)
              pwm2(a1,a2);

              }
    else{             //if is barriere
        pwm1(2,80);  //braek (set very smolly motors speeds)
        pwm2(2,80);
         }

    do{                                                        //proximity read
      Command = VCNL_RdSingle(REGISTER_COMMAND);
    }while (!(Command & (COMMAND_MASK_PROX_DATA_READY | COMMAND_MASK_AMBI_DATA_READY))); // data ready ?

    // read interrupt status register
    InterruptStatus = VCNL_RdSingle(REGISTER_INTERRUPT_STATUS);
    // check interrupt status for High Threshold
    if(InterruptStatus & INTERRUPT_MASK_STATUS_THRES_HI){
      VCNL_WrSingle(REGISTER_INTERRUPT_STATUS, InterruptStatus);
    }

    // prox value ready for using
    if(Command & COMMAND_MASK_PROX_DATA_READY){
      // read proximity value
      VCNL_RdSeq(REGISTER_PROX_VALUE, &data_, 2);
      ProxiValue = (data_[0] << 8) | data_[1];
      // display proximity value
      WordToStr(ProxiValue, temp_text);



      if(ProxiValue < (AverageProxiValue + 50)){     //if is not  barriere
                    LATB2_bit=1;      //turn on up front lights
                    LATD2_bit=0;     //turn off braking lights
      }             ab=0;
      if((ProxiValue > (AverageProxiValue + 50))) {       //if is  barriere
                     LATB2_bit=0;      //turn off up front lights
                     LATD2_bit=1;    //turn on braking lights
                     ab=1;
       }
     }
     if(cnt3>700&trept==0){LATB1_bit=1;cnt3=0;trept=trept+1;}       //down lights blinking (OFF)
      if(cnt3>700&trept==1){LATB1_bit=0;cnt3=0;trept=trept+1;}      //down lights blinking (ON)
      if(trept==2){trept=0;}
 

   }


  }