#line 1 "R:/GIMBOT/PWM2/PWM2.c"


float cnt1;
float cnt2;
float cnt3;
float cnt4;
float cnt5;

float pwm1i;
float pwm2i;

void interrupt() {
 if (TMR0IF_bit) {
 cnt1=cnt1+1;
 cnt2=cnt2+1;
 cnt3=cnt3+1;
 cnt4=cnt4+1;
 cnt5=cnt5+1;

 TMR0IF_bit = 0;
 TMR0L = 0;
 }
}

void pwm1(int t1up,int t1down){
 if (cnt1 <= t1up && pwm1i==1) {
 LATB5_bit = 1;

 cnt2 = 0;
 }
 else {pwm1i=0;}

 if (cnt2 <= t1down && pwm1i==0) {
 LATB5_bit = 0;
 cnt1 =0;

 }
 else {pwm1i=1;}
}

void pwm2(int t2up,int t2down){
 if (cnt3 <= t2up && pwm2i==1 ) {
 LATB6_bit = 1;

 cnt4 = 0;
 }
 else {pwm2i=0;}

 if (cnt4 <= t2down && pwm2i==0) {
 LATB6_bit = 0;
 cnt3 =0;

 }
 else {pwm2i=1;}
}
void main() {





 pwm1i=1;
 pwm2i=1;

 cnt1 = 0;
 cnt2 = 0;
 cnt3 = 0;
 cnt4 = 0;
 cnt5 = 0;


 ANSELB = 0;
 TRISB = 0;
 LATB = 0x00;

 ANSELC = 0;
 TRISC = 0;
 LATC = 0x00;

 ANSELD = 0;
 TRISD = 0;
 LATD = 0x00;

 ANSELE = 0;
 TRISE = 0;
 LATE = 0xFF;

 INTCON = 0xC0;
 T0CON = 0xC2;
 TMR0L = 0;
 GIE_bit = 1;
 TMR0IE_bit = 1;


 while(1) {

 pwm1(1,6);
 pwm2(1,6);



 if (cnt5 >= 1000) {
 LATD = ~PORTD;
 cnt5 = 0;
 }
 }
}
