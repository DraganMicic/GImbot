#line 1 "R:/GIMBOT/Dc klik PWMx1/EasyPIC7 - PIC18F45K22/DC Motor Click.c"
#line 37 "R:/GIMBOT/Dc klik PWMx1/EasyPIC7 - PIC18F45K22/DC Motor Click.c"
sbit SEL1 at LATE1_bit;
sbit SEL2 at LATE0_bit;
sbit SEL1_Direction at TRISE1_bit;
sbit SEL2_Direction at TRISE0_bit;

unsigned int current_duty;


void InitGPIO() {

 ANSELC = 0;
 ANSELD = 0;
 ANSELE = 0;


 TRISD0_bit = 1;
 TRISD1_bit = 1;


 TRISD7_bit = 1;
 TRISD6_bit = 1;
 TRISD5_bit = 1;
 TRISD4_bit = 1;


 SEL1_Direction = 0;
 SEL2_Direction = 0;
}


void PWM_Setup() {

 TRISC0_bit = 0;
 current_duty = 0;
 PWM2_Init(5000);
 PSTR1CON = 0x02;
 PSTR2CON = 0x02;
 PWM2_Set_Duty(current_duty);
 PWM2_Start();
}

void main() {

 InitGPIO();


 PWM_Setup();


 SEL1 = 0;
 SEL2 = 0;

 while (1) {

 if (Button(&PORTD, 7, 1, 1)) {
 SEL1 = 0;
 SEL2 = 0;
 }


 if (Button(&PORTD, 6, 1, 1)) {
 SEL1 = 0;
 SEL2 = 1;
 }


 if (Button(&PORTD, 5, 1, 1)) {
 SEL1 = 1;
 SEL2 = 1;
 }


 if (Button(&PORTD, 4, 1, 1)) {
 SEL1 = 1;
 SEL2 = 0;
 }


 if (Button(&PORTD, 1, 5, 1)) {
 current_duty = current_duty + 1;
 PWM2_Set_Duty(current_duty);
 }


 if (Button(&PORTD, 0, 5, 1)) {
 current_duty = current_duty - 1;
 PWM2_Set_Duty(current_duty);
 }
 }
}
