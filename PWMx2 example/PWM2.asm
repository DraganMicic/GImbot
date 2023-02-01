
_interrupt:

;PWM2.c,12 :: 		void interrupt() {              //<<<<<<<<<<<<<<<<<<<<<<<odve su definisane Interapt finkcije i njih nigde ne kopiras same se pozivaju
;PWM2.c,13 :: 		if (TMR0IF_bit) {
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt0
;PWM2.c,14 :: 		cnt1=cnt1+1;                 // increment counter
	MOVF        _cnt1+0, 0 
	MOVWF       R0 
	MOVF        _cnt1+1, 0 
	MOVWF       R1 
	MOVF        _cnt1+2, 0 
	MOVWF       R2 
	MOVF        _cnt1+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _cnt1+0 
	MOVF        R1, 0 
	MOVWF       _cnt1+1 
	MOVF        R2, 0 
	MOVWF       _cnt1+2 
	MOVF        R3, 0 
	MOVWF       _cnt1+3 
;PWM2.c,15 :: 		cnt2=cnt2+1;                    // increment counter
	MOVF        _cnt2+0, 0 
	MOVWF       R0 
	MOVF        _cnt2+1, 0 
	MOVWF       R1 
	MOVF        _cnt2+2, 0 
	MOVWF       R2 
	MOVF        _cnt2+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _cnt2+0 
	MOVF        R1, 0 
	MOVWF       _cnt2+1 
	MOVF        R2, 0 
	MOVWF       _cnt2+2 
	MOVF        R3, 0 
	MOVWF       _cnt2+3 
;PWM2.c,16 :: 		cnt3=cnt3+1;
	MOVF        _cnt3+0, 0 
	MOVWF       R0 
	MOVF        _cnt3+1, 0 
	MOVWF       R1 
	MOVF        _cnt3+2, 0 
	MOVWF       R2 
	MOVF        _cnt3+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _cnt3+0 
	MOVF        R1, 0 
	MOVWF       _cnt3+1 
	MOVF        R2, 0 
	MOVWF       _cnt3+2 
	MOVF        R3, 0 
	MOVWF       _cnt3+3 
;PWM2.c,17 :: 		cnt4=cnt4+1;                 // increment counter
	MOVF        _cnt4+0, 0 
	MOVWF       R0 
	MOVF        _cnt4+1, 0 
	MOVWF       R1 
	MOVF        _cnt4+2, 0 
	MOVWF       R2 
	MOVF        _cnt4+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _cnt4+0 
	MOVF        R1, 0 
	MOVWF       _cnt4+1 
	MOVF        R2, 0 
	MOVWF       _cnt4+2 
	MOVF        R3, 0 
	MOVWF       _cnt4+3 
;PWM2.c,18 :: 		cnt5=cnt5+1;                    // increment counter
	MOVF        _cnt5+0, 0 
	MOVWF       R0 
	MOVF        _cnt5+1, 0 
	MOVWF       R1 
	MOVF        _cnt5+2, 0 
	MOVWF       R2 
	MOVF        _cnt5+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _cnt5+0 
	MOVF        R1, 0 
	MOVWF       _cnt5+1 
	MOVF        R2, 0 
	MOVWF       _cnt5+2 
	MOVF        R3, 0 
	MOVWF       _cnt5+3 
;PWM2.c,20 :: 		TMR0IF_bit = 0;        // clear TMR0IF
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;PWM2.c,21 :: 		TMR0L = 0;             // set TMR0 for aproximetly 1 sec
	CLRF        TMR0L+0 
;PWM2.c,22 :: 		}
L_interrupt0:
;PWM2.c,23 :: 		}
L_end_interrupt:
L__interrupt25:
	RETFIE      1
; end of _interrupt

_pwm1:

;PWM2.c,25 :: 		void pwm1(int t1up,int t1down){
;PWM2.c,26 :: 		if (cnt1 <= t1up && pwm1i==1) {
	MOVF        FARG_pwm1_t1up+0, 0 
	MOVWF       R0 
	MOVF        FARG_pwm1_t1up+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        _cnt1+0, 0 
	MOVWF       R4 
	MOVF        _cnt1+1, 0 
	MOVWF       R5 
	MOVF        _cnt1+2, 0 
	MOVWF       R6 
	MOVF        _cnt1+3, 0 
	MOVWF       R7 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_pwm13
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	MOVF        _pwm1i+0, 0 
	MOVWF       R0 
	MOVF        _pwm1i+1, 0 
	MOVWF       R1 
	MOVF        _pwm1i+2, 0 
	MOVWF       R2 
	MOVF        _pwm1i+3, 0 
	MOVWF       R3 
	CALL        _Equals_Double+0, 0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_pwm13
L__pwm121:
;PWM2.c,27 :: 		LATB5_bit = 1;
	BSF         LATB5_bit+0, BitPos(LATB5_bit+0) 
;PWM2.c,29 :: 		cnt2 = 0;
	CLRF        _cnt2+0 
	CLRF        _cnt2+1 
	CLRF        _cnt2+2 
	CLRF        _cnt2+3 
;PWM2.c,30 :: 		}
	GOTO        L_pwm14
L_pwm13:
;PWM2.c,31 :: 		else {pwm1i=0;}
	CLRF        _pwm1i+0 
	CLRF        _pwm1i+1 
	CLRF        _pwm1i+2 
	CLRF        _pwm1i+3 
L_pwm14:
;PWM2.c,33 :: 		if (cnt2 <= t1down && pwm1i==0) {
	MOVF        FARG_pwm1_t1down+0, 0 
	MOVWF       R0 
	MOVF        FARG_pwm1_t1down+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        _cnt2+0, 0 
	MOVWF       R4 
	MOVF        _cnt2+1, 0 
	MOVWF       R5 
	MOVF        _cnt2+2, 0 
	MOVWF       R6 
	MOVF        _cnt2+3, 0 
	MOVWF       R7 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_pwm17
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	MOVF        _pwm1i+0, 0 
	MOVWF       R0 
	MOVF        _pwm1i+1, 0 
	MOVWF       R1 
	MOVF        _pwm1i+2, 0 
	MOVWF       R2 
	MOVF        _pwm1i+3, 0 
	MOVWF       R3 
	CALL        _Equals_Double+0, 0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_pwm17
L__pwm120:
;PWM2.c,34 :: 		LATB5_bit = 0;
	BCF         LATB5_bit+0, BitPos(LATB5_bit+0) 
;PWM2.c,35 :: 		cnt1 =0;
	CLRF        _cnt1+0 
	CLRF        _cnt1+1 
	CLRF        _cnt1+2 
	CLRF        _cnt1+3 
;PWM2.c,37 :: 		}
	GOTO        L_pwm18
L_pwm17:
;PWM2.c,38 :: 		else {pwm1i=1;}
	MOVLW       0
	MOVWF       _pwm1i+0 
	MOVLW       0
	MOVWF       _pwm1i+1 
	MOVLW       0
	MOVWF       _pwm1i+2 
	MOVLW       127
	MOVWF       _pwm1i+3 
L_pwm18:
;PWM2.c,39 :: 		}
L_end_pwm1:
	RETURN      0
; end of _pwm1

_pwm2:

;PWM2.c,41 :: 		void pwm2(int t2up,int t2down){
;PWM2.c,42 :: 		if (cnt3 <= t2up && pwm2i==1 ) {
	MOVF        FARG_pwm2_t2up+0, 0 
	MOVWF       R0 
	MOVF        FARG_pwm2_t2up+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        _cnt3+0, 0 
	MOVWF       R4 
	MOVF        _cnt3+1, 0 
	MOVWF       R5 
	MOVF        _cnt3+2, 0 
	MOVWF       R6 
	MOVF        _cnt3+3, 0 
	MOVWF       R7 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_pwm211
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	MOVF        _pwm2i+0, 0 
	MOVWF       R0 
	MOVF        _pwm2i+1, 0 
	MOVWF       R1 
	MOVF        _pwm2i+2, 0 
	MOVWF       R2 
	MOVF        _pwm2i+3, 0 
	MOVWF       R3 
	CALL        _Equals_Double+0, 0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_pwm211
L__pwm223:
;PWM2.c,43 :: 		LATB6_bit = 1;
	BSF         LATB6_bit+0, BitPos(LATB6_bit+0) 
;PWM2.c,45 :: 		cnt4 = 0;
	CLRF        _cnt4+0 
	CLRF        _cnt4+1 
	CLRF        _cnt4+2 
	CLRF        _cnt4+3 
;PWM2.c,46 :: 		}
	GOTO        L_pwm212
L_pwm211:
;PWM2.c,47 :: 		else {pwm2i=0;}
	CLRF        _pwm2i+0 
	CLRF        _pwm2i+1 
	CLRF        _pwm2i+2 
	CLRF        _pwm2i+3 
L_pwm212:
;PWM2.c,49 :: 		if (cnt4 <= t2down && pwm2i==0) {
	MOVF        FARG_pwm2_t2down+0, 0 
	MOVWF       R0 
	MOVF        FARG_pwm2_t2down+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        _cnt4+0, 0 
	MOVWF       R4 
	MOVF        _cnt4+1, 0 
	MOVWF       R5 
	MOVF        _cnt4+2, 0 
	MOVWF       R6 
	MOVF        _cnt4+3, 0 
	MOVWF       R7 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_pwm215
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	MOVF        _pwm2i+0, 0 
	MOVWF       R0 
	MOVF        _pwm2i+1, 0 
	MOVWF       R1 
	MOVF        _pwm2i+2, 0 
	MOVWF       R2 
	MOVF        _pwm2i+3, 0 
	MOVWF       R3 
	CALL        _Equals_Double+0, 0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_pwm215
L__pwm222:
;PWM2.c,50 :: 		LATB6_bit = 0;
	BCF         LATB6_bit+0, BitPos(LATB6_bit+0) 
;PWM2.c,51 :: 		cnt3 =0;
	CLRF        _cnt3+0 
	CLRF        _cnt3+1 
	CLRF        _cnt3+2 
	CLRF        _cnt3+3 
;PWM2.c,53 :: 		}
	GOTO        L_pwm216
L_pwm215:
;PWM2.c,54 :: 		else {pwm2i=1;}
	MOVLW       0
	MOVWF       _pwm2i+0 
	MOVLW       0
	MOVWF       _pwm2i+1 
	MOVLW       0
	MOVWF       _pwm2i+2 
	MOVLW       127
	MOVWF       _pwm2i+3 
L_pwm216:
;PWM2.c,55 :: 		}
L_end_pwm2:
	RETURN      0
; end of _pwm2

_main:

;PWM2.c,56 :: 		void main() {
;PWM2.c,62 :: 		pwm1i=1;            //nesto za PWM
	MOVLW       0
	MOVWF       _pwm1i+0 
	MOVLW       0
	MOVWF       _pwm1i+1 
	MOVLW       0
	MOVWF       _pwm1i+2 
	MOVLW       127
	MOVWF       _pwm1i+3 
;PWM2.c,63 :: 		pwm2i=1;
	MOVLW       0
	MOVWF       _pwm2i+0 
	MOVLW       0
	MOVWF       _pwm2i+1 
	MOVLW       0
	MOVWF       _pwm2i+2 
	MOVLW       127
	MOVWF       _pwm2i+3 
;PWM2.c,65 :: 		cnt1 = 0;
	CLRF        _cnt1+0 
	CLRF        _cnt1+1 
	CLRF        _cnt1+2 
	CLRF        _cnt1+3 
;PWM2.c,66 :: 		cnt2 =   0;
	CLRF        _cnt2+0 
	CLRF        _cnt2+1 
	CLRF        _cnt2+2 
	CLRF        _cnt2+3 
;PWM2.c,67 :: 		cnt3 = 0;
	CLRF        _cnt3+0 
	CLRF        _cnt3+1 
	CLRF        _cnt3+2 
	CLRF        _cnt3+3 
;PWM2.c,68 :: 		cnt4 = 0;
	CLRF        _cnt4+0 
	CLRF        _cnt4+1 
	CLRF        _cnt4+2 
	CLRF        _cnt4+3 
;PWM2.c,69 :: 		cnt5 = 0;
	CLRF        _cnt5+0 
	CLRF        _cnt5+1 
	CLRF        _cnt5+2 
	CLRF        _cnt5+3 
;PWM2.c,72 :: 		ANSELB = 0;              // Configure AN pins as digital
	CLRF        ANSELB+0 
;PWM2.c,73 :: 		TRISB  = 0;              // PORTB is output
	CLRF        TRISB+0 
;PWM2.c,74 :: 		LATB = 0x00;
	CLRF        LATB+0 
;PWM2.c,76 :: 		ANSELC = 0;              // Configure AN pins as digital
	CLRF        ANSELC+0 
;PWM2.c,77 :: 		TRISC  = 0;              // PORTB is output
	CLRF        TRISC+0 
;PWM2.c,78 :: 		LATC = 0x00;           // Initialize PORTB
	CLRF        LATC+0 
;PWM2.c,80 :: 		ANSELD = 0;              // Configure AN pins as digital
	CLRF        ANSELD+0 
;PWM2.c,81 :: 		TRISD  = 0;              // PORTB is output
	CLRF        TRISD+0 
;PWM2.c,82 :: 		LATD = 0x00;
	CLRF        LATD+0 
;PWM2.c,84 :: 		ANSELE = 0;              // Configure AN pins as digital
	CLRF        ANSELE+0 
;PWM2.c,85 :: 		TRISE  = 0;              // PORTB is output
	CLRF        TRISE+0 
;PWM2.c,86 :: 		LATE = 0xFF;
	MOVLW       255
	MOVWF       LATE+0 
;PWM2.c,88 :: 		INTCON = 0xC0;                   //setovanje tajmera
	MOVLW       192
	MOVWF       INTCON+0 
;PWM2.c,89 :: 		T0CON         = 0xC2;
	MOVLW       194
	MOVWF       T0CON+0 
;PWM2.c,90 :: 		TMR0L         = 0;           // Set TMR0 to 8bit mode and prescaler to 256
	CLRF        TMR0L+0 
;PWM2.c,91 :: 		GIE_bit = 1;             // Enable global interrupt
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;PWM2.c,92 :: 		TMR0IE_bit = 1;          // Enable Timer0 interrupt
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;PWM2.c,95 :: 		while(1) {
L_main17:
;PWM2.c,97 :: 		pwm1(1,6);        //desni
	MOVLW       1
	MOVWF       FARG_pwm1_t1up+0 
	MOVLW       0
	MOVWF       FARG_pwm1_t1up+1 
	MOVLW       6
	MOVWF       FARG_pwm1_t1down+0 
	MOVLW       0
	MOVWF       FARG_pwm1_t1down+1 
	CALL        _pwm1+0, 0
;PWM2.c,98 :: 		pwm2(1,6);       //levi
	MOVLW       1
	MOVWF       FARG_pwm2_t2up+0 
	MOVLW       0
	MOVWF       FARG_pwm2_t2up+1 
	MOVLW       6
	MOVWF       FARG_pwm2_t2down+0 
	MOVLW       0
	MOVWF       FARG_pwm2_t2down+1 
	CALL        _pwm2+0, 0
;PWM2.c,102 :: 		if (cnt5 >= 1000) {
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	MOVF        _cnt5+0, 0 
	MOVWF       R0 
	MOVF        _cnt5+1, 0 
	MOVWF       R1 
	MOVF        _cnt5+2, 0 
	MOVWF       R2 
	MOVF        _cnt5+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main19
;PWM2.c,103 :: 		LATD = ~PORTD;         // Toggle PORTB LEDs
	COMF        PORTD+0, 0 
	MOVWF       LATD+0 
;PWM2.c,104 :: 		cnt5 = 0;                // Reset cnt
	CLRF        _cnt5+0 
	CLRF        _cnt5+1 
	CLRF        _cnt5+2 
	CLRF        _cnt5+3 
;PWM2.c,105 :: 		}
L_main19:
;PWM2.c,106 :: 		}
	GOTO        L_main17
;PWM2.c,107 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
