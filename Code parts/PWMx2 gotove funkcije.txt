 //     3 TAJMERA NA 3 PORTA //

float cnt1;        //promenljive za tajmere
float cnt2;
float cnt3;
float cnt4;
float cnt5;

float pwm1i;
float pwm2i;

void interrupt() {              //<<<<<<<<<<<<<<<<<<<<<<<odve su definisane Interapt finkcije i njih nigde ne kopiras same se pozivaju
     if (TMR0IF_bit) {
        cnt1=cnt1+1;                 // increment counter
        cnt2=cnt2+1;                    // increment counter
        cnt3=cnt3+1;
        cnt4=cnt4+1;                 // increment counter
        cnt5=cnt5+1;                    // increment counter

        TMR0IF_bit = 0;        // clear TMR0IF
        TMR0L = 0;             // set TMR0 for aproximetly 1 sec
     }
}

void pwm1(int t1up,int t1down){
  if (cnt1 <= t1up && pwm1i==1) {
      LATB5_bit = 1;
     // cnt1 = 0;
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
     // cnt1 = 0;
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
 
 
  //setovanje pinovaaa//
  

  pwm1i=1;            //nesto za PWM
  pwm2i=1;
  
  cnt1 = 0;
  cnt2 =   0;
  cnt3 = 0;  
  cnt4 = 0;
  cnt5 = 0;


  ANSELB = 0;              // Configure AN pins as digital
  TRISB  = 0;              // PORTB is output
  LATB = 0x00;

  ANSELC = 0;              // Configure AN pins as digital
  TRISC  = 0;              // PORTB is output
  LATC = 0x00;           // Initialize PORTB

  ANSELD = 0;              // Configure AN pins as digital
  TRISD  = 0;              // PORTB is output
  LATD = 0x00;
    
  ANSELE = 0;              // Configure AN pins as digital
  TRISE  = 0;              // PORTB is output
  LATE = 0xFF;

  INTCON = 0xC0;                   //setovanje tajmera
  T0CON         = 0xC2;
  TMR0L         = 0;           // Set TMR0 to 8bit mode and prescaler to 256
  GIE_bit = 1;             // Enable global interrupt
  TMR0IE_bit = 1;          // Enable Timer0 interrupt


  while(1) {
  
    pwm1(1,6);        //desni
    pwm2(1,6);       //levi

    
    
    if (cnt5 >= 1000) {
      LATD = ~PORTD;         // Toggle PORTB LEDs
      cnt5 = 0;                // Reset cnt
    }
  }
}