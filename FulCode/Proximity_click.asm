
_interrupt:

;Proximity_click.c,43 :: 		void interrupt() {               //timers interrupt function
;Proximity_click.c,44 :: 		if (TMR0IF_bit) {
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt0
;Proximity_click.c,46 :: 		cnt1=cnt1+1;       //set interly timers to ++
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
;Proximity_click.c,47 :: 		cnt2=cnt2+1;
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
;Proximity_click.c,48 :: 		cnt3=cnt3+1;
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
;Proximity_click.c,50 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;Proximity_click.c,51 :: 		TMR0L = 0;
	CLRF        TMR0L+0 
;Proximity_click.c,52 :: 		}
L_interrupt0:
;Proximity_click.c,53 :: 		}
L_end_interrupt:
L__interrupt124:
	RETFIE      1
; end of _interrupt

_pwm1:

;Proximity_click.c,55 :: 		void pwm1(int t1up, int t1down){                    //PWM1 function  (t1up= time of on in PWM1 signal   t1down= time of oFF in PWM1 signal im ms)
;Proximity_click.c,56 :: 		if(cnt1<=t1up){LATB5_bit=1;}                                   //PWM2 is set to RB5 pin
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
	GOTO        L_pwm11
	BSF         LATB5_bit+0, BitPos(LATB5_bit+0) 
L_pwm11:
;Proximity_click.c,57 :: 		if(cnt1>=t1up&&cnt1<=t1up+t1down){LATB5_bit=0;}
	MOVF        FARG_pwm1_t1up+0, 0 
	MOVWF       R0 
	MOVF        FARG_pwm1_t1up+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        _cnt1+0, 0 
	MOVWF       R0 
	MOVF        _cnt1+1, 0 
	MOVWF       R1 
	MOVF        _cnt1+2, 0 
	MOVWF       R2 
	MOVF        _cnt1+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_pwm14
	MOVF        FARG_pwm1_t1down+0, 0 
	ADDWF       FARG_pwm1_t1up+0, 0 
	MOVWF       R0 
	MOVF        FARG_pwm1_t1down+1, 0 
	ADDWFC      FARG_pwm1_t1up+1, 0 
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
	GOTO        L_pwm14
L__pwm1104:
	BCF         LATB5_bit+0, BitPos(LATB5_bit+0) 
L_pwm14:
;Proximity_click.c,58 :: 		if(cnt1>=t1up+t1down){cnt1=0;}
	MOVF        FARG_pwm1_t1down+0, 0 
	ADDWF       FARG_pwm1_t1up+0, 0 
	MOVWF       R0 
	MOVF        FARG_pwm1_t1down+1, 0 
	ADDWFC      FARG_pwm1_t1up+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        _cnt1+0, 0 
	MOVWF       R0 
	MOVF        _cnt1+1, 0 
	MOVWF       R1 
	MOVF        _cnt1+2, 0 
	MOVWF       R2 
	MOVF        _cnt1+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_pwm15
	CLRF        _cnt1+0 
	CLRF        _cnt1+1 
	CLRF        _cnt1+2 
	CLRF        _cnt1+3 
L_pwm15:
;Proximity_click.c,60 :: 		}
L_end_pwm1:
	RETURN      0
; end of _pwm1

_pwm2:

;Proximity_click.c,61 :: 		void pwm2(int t2up, int t2down){                   //PWM2 function  (t2up= time of on in PWM2 signal   t2down= time of oFF in PWM2 signal im ms)
;Proximity_click.c,62 :: 		if(cnt2<=t2up){LATB6_bit=1;}                              //PWM2 is set to RB6 pin
	MOVF        FARG_pwm2_t2up+0, 0 
	MOVWF       R0 
	MOVF        FARG_pwm2_t2up+1, 0 
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
	GOTO        L_pwm26
	BSF         LATB6_bit+0, BitPos(LATB6_bit+0) 
L_pwm26:
;Proximity_click.c,63 :: 		if(cnt2>=t2up&&cnt2<=t2up+t2down){LATB6_bit=0;}
	MOVF        FARG_pwm2_t2up+0, 0 
	MOVWF       R0 
	MOVF        FARG_pwm2_t2up+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        _cnt2+0, 0 
	MOVWF       R0 
	MOVF        _cnt2+1, 0 
	MOVWF       R1 
	MOVF        _cnt2+2, 0 
	MOVWF       R2 
	MOVF        _cnt2+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_pwm29
	MOVF        FARG_pwm2_t2down+0, 0 
	ADDWF       FARG_pwm2_t2up+0, 0 
	MOVWF       R0 
	MOVF        FARG_pwm2_t2down+1, 0 
	ADDWFC      FARG_pwm2_t2up+1, 0 
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
	GOTO        L_pwm29
L__pwm2105:
	BCF         LATB6_bit+0, BitPos(LATB6_bit+0) 
L_pwm29:
;Proximity_click.c,64 :: 		if(cnt2>=t2up+t2down){cnt2=0;}
	MOVF        FARG_pwm2_t2down+0, 0 
	ADDWF       FARG_pwm2_t2up+0, 0 
	MOVWF       R0 
	MOVF        FARG_pwm2_t2down+1, 0 
	ADDWFC      FARG_pwm2_t2up+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        _cnt2+0, 0 
	MOVWF       R0 
	MOVF        _cnt2+1, 0 
	MOVWF       R1 
	MOVF        _cnt2+2, 0 
	MOVWF       R2 
	MOVF        _cnt2+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_pwm210
	CLRF        _cnt2+0 
	CLRF        _cnt2+1 
	CLRF        _cnt2+2 
	CLRF        _cnt2+3 
L_pwm210:
;Proximity_click.c,66 :: 		}
L_end_pwm2:
	RETURN      0
; end of _pwm2

_mod:

;Proximity_click.c,67 :: 		void mod(int c) {           //function who is changes motors speed  depending on line position
;Proximity_click.c,69 :: 		switch(c){
	GOTO        L_mod11
;Proximity_click.c,70 :: 		case 4:     a1=2;a2=60;c1=18;c2=45;       break;        //line is left
L_mod13:
	MOVLW       2
	MOVWF       _a1+0 
	MOVLW       0
	MOVWF       _a1+1 
	MOVLW       60
	MOVWF       _a2+0 
	MOVLW       0
	MOVWF       _a2+1 
	MOVLW       18
	MOVWF       _c1+0 
	MOVLW       0
	MOVWF       _c1+1 
	MOVLW       45
	MOVWF       _c2+0 
	MOVLW       0
	MOVWF       _c2+1 
	GOTO        L_mod12
;Proximity_click.c,72 :: 		case 3:    a1=8;a2=50;c1=17;c2=30;       break;        //3333333333
L_mod14:
	MOVLW       8
	MOVWF       _a1+0 
	MOVLW       0
	MOVWF       _a1+1 
	MOVLW       50
	MOVWF       _a2+0 
	MOVLW       0
	MOVWF       _a2+1 
	MOVLW       17
	MOVWF       _c1+0 
	MOVLW       0
	MOVWF       _c1+1 
	MOVLW       30
	MOVWF       _c2+0 
	MOVLW       0
	MOVWF       _c2+1 
	GOTO        L_mod12
;Proximity_click.c,74 :: 		case 2:     a1=10;a2=50;c1=17;c2=30;       break;      //2222222222222
L_mod15:
	MOVLW       10
	MOVWF       _a1+0 
	MOVLW       0
	MOVWF       _a1+1 
	MOVLW       50
	MOVWF       _a2+0 
	MOVLW       0
	MOVWF       _a2+1 
	MOVLW       17
	MOVWF       _c1+0 
	MOVLW       0
	MOVWF       _c1+1 
	MOVLW       30
	MOVWF       _c2+0 
	MOVLW       0
	MOVWF       _c2+1 
	GOTO        L_mod12
;Proximity_click.c,76 :: 		case 1:    a1=12;a2=50;c1=17;c2=30;       break;     //11111111111111111
L_mod16:
	MOVLW       12
	MOVWF       _a1+0 
	MOVLW       0
	MOVWF       _a1+1 
	MOVLW       50
	MOVWF       _a2+0 
	MOVLW       0
	MOVWF       _a2+1 
	MOVLW       17
	MOVWF       _c1+0 
	MOVLW       0
	MOVWF       _c1+1 
	MOVLW       30
	MOVWF       _c2+0 
	MOVLW       0
	MOVWF       _c2+1 
	GOTO        L_mod12
;Proximity_click.c,78 :: 		case 0:    a1=13;a2=45;c1=13;c2=45;       break;      //line in the center
L_mod17:
	MOVLW       13
	MOVWF       _a1+0 
	MOVLW       0
	MOVWF       _a1+1 
	MOVLW       45
	MOVWF       _a2+0 
	MOVLW       0
	MOVWF       _a2+1 
	MOVLW       13
	MOVWF       _c1+0 
	MOVLW       0
	MOVWF       _c1+1 
	MOVLW       45
	MOVWF       _c2+0 
	MOVLW       0
	MOVWF       _c2+1 
	GOTO        L_mod12
;Proximity_click.c,80 :: 		case -1:   a1=17;a2=30;c1=12;c2=50;       break;      //1111111111111
L_mod18:
	MOVLW       17
	MOVWF       _a1+0 
	MOVLW       0
	MOVWF       _a1+1 
	MOVLW       30
	MOVWF       _a2+0 
	MOVLW       0
	MOVWF       _a2+1 
	MOVLW       12
	MOVWF       _c1+0 
	MOVLW       0
	MOVWF       _c1+1 
	MOVLW       50
	MOVWF       _c2+0 
	MOVLW       0
	MOVWF       _c2+1 
	GOTO        L_mod12
;Proximity_click.c,82 :: 		case -2:   a1=17;a2=30;c1=10;c2=50;       break;        //222222222
L_mod19:
	MOVLW       17
	MOVWF       _a1+0 
	MOVLW       0
	MOVWF       _a1+1 
	MOVLW       30
	MOVWF       _a2+0 
	MOVLW       0
	MOVWF       _a2+1 
	MOVLW       10
	MOVWF       _c1+0 
	MOVLW       0
	MOVWF       _c1+1 
	MOVLW       50
	MOVWF       _c2+0 
	MOVLW       0
	MOVWF       _c2+1 
	GOTO        L_mod12
;Proximity_click.c,84 :: 		case -3:  a1=17;a2=30;c1=8;c2=50;       break;        //3333333333
L_mod20:
	MOVLW       17
	MOVWF       _a1+0 
	MOVLW       0
	MOVWF       _a1+1 
	MOVLW       30
	MOVWF       _a2+0 
	MOVLW       0
	MOVWF       _a2+1 
	MOVLW       8
	MOVWF       _c1+0 
	MOVLW       0
	MOVWF       _c1+1 
	MOVLW       50
	MOVWF       _c2+0 
	MOVLW       0
	MOVWF       _c2+1 
	GOTO        L_mod12
;Proximity_click.c,86 :: 		case -4:  a1=18;a2=45;c1=2;c2=60;       break;       //line is right
L_mod21:
	MOVLW       18
	MOVWF       _a1+0 
	MOVLW       0
	MOVWF       _a1+1 
	MOVLW       45
	MOVWF       _a2+0 
	MOVLW       0
	MOVWF       _a2+1 
	MOVLW       2
	MOVWF       _c1+0 
	MOVLW       0
	MOVWF       _c1+1 
	MOVLW       60
	MOVWF       _c2+0 
	MOVLW       0
	MOVWF       _c2+1 
	GOTO        L_mod12
;Proximity_click.c,87 :: 		}
L_mod11:
	MOVLW       0
	XORWF       FARG_mod_c+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mod128
	MOVLW       4
	XORWF       FARG_mod_c+0, 0 
L__mod128:
	BTFSC       STATUS+0, 2 
	GOTO        L_mod13
	MOVLW       0
	XORWF       FARG_mod_c+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mod129
	MOVLW       3
	XORWF       FARG_mod_c+0, 0 
L__mod129:
	BTFSC       STATUS+0, 2 
	GOTO        L_mod14
	MOVLW       0
	XORWF       FARG_mod_c+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mod130
	MOVLW       2
	XORWF       FARG_mod_c+0, 0 
L__mod130:
	BTFSC       STATUS+0, 2 
	GOTO        L_mod15
	MOVLW       0
	XORWF       FARG_mod_c+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mod131
	MOVLW       1
	XORWF       FARG_mod_c+0, 0 
L__mod131:
	BTFSC       STATUS+0, 2 
	GOTO        L_mod16
	MOVLW       0
	XORWF       FARG_mod_c+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mod132
	MOVLW       0
	XORWF       FARG_mod_c+0, 0 
L__mod132:
	BTFSC       STATUS+0, 2 
	GOTO        L_mod17
	MOVLW       255
	XORWF       FARG_mod_c+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mod133
	MOVLW       255
	XORWF       FARG_mod_c+0, 0 
L__mod133:
	BTFSC       STATUS+0, 2 
	GOTO        L_mod18
	MOVLW       255
	XORWF       FARG_mod_c+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mod134
	MOVLW       254
	XORWF       FARG_mod_c+0, 0 
L__mod134:
	BTFSC       STATUS+0, 2 
	GOTO        L_mod19
	MOVLW       255
	XORWF       FARG_mod_c+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mod135
	MOVLW       253
	XORWF       FARG_mod_c+0, 0 
L__mod135:
	BTFSC       STATUS+0, 2 
	GOTO        L_mod20
	MOVLW       255
	XORWF       FARG_mod_c+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mod136
	MOVLW       252
	XORWF       FARG_mod_c+0, 0 
L__mod136:
	BTFSC       STATUS+0, 2 
	GOTO        L_mod21
L_mod12:
;Proximity_click.c,88 :: 		}
L_end_mod:
	RETURN      0
; end of _mod

_ridd:

;Proximity_click.c,90 :: 		void ridd (){                  //function for readind ADC value of line sensors
;Proximity_click.c,92 :: 		U5R = ADC_Read(4);      //ADC read definitions
	MOVLW       4
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _U5R+0 
	MOVF        R1, 0 
	MOVWF       _U5R+1 
;Proximity_click.c,93 :: 		U4R = ADC_Read(3);
	MOVLW       3
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _U4R+0 
	MOVF        R1, 0 
	MOVWF       _U4R+1 
;Proximity_click.c,94 :: 		U3R = ADC_Read(2);
	MOVLW       2
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _U3R+0 
	MOVF        R1, 0 
	MOVWF       _U3R+1 
;Proximity_click.c,95 :: 		U2R = ADC_Read(1);
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _U2R+0 
	MOVF        R1, 0 
	MOVWF       _U2R+1 
;Proximity_click.c,96 :: 		U1R = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _U1R+0 
	MOVF        R1, 0 
	MOVWF       _U1R+1 
;Proximity_click.c,98 :: 		if (U1R > cal){U1 = 1;}     // if line is under sensor 0
	MOVLW       128
	XORWF       _cal+1, 0 
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ridd138
	MOVF        R0, 0 
	SUBWF       _cal+0, 0 
L__ridd138:
	BTFSC       STATUS+0, 0 
	GOTO        L_ridd22
	MOVLW       1
	MOVWF       _U1+0 
	MOVLW       0
	MOVWF       _U1+1 
L_ridd22:
;Proximity_click.c,99 :: 		if (U1R < cal){U1 = 0;}     // if line is not  under sensor 0
	MOVLW       128
	XORWF       _U1R+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _cal+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ridd139
	MOVF        _cal+0, 0 
	SUBWF       _U1R+0, 0 
L__ridd139:
	BTFSC       STATUS+0, 0 
	GOTO        L_ridd23
	CLRF        _U1+0 
	CLRF        _U1+1 
L_ridd23:
;Proximity_click.c,101 :: 		if (U2R > cal){U2 = 1;}     // if line is under sensor 1
	MOVLW       128
	XORWF       _cal+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _U2R+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ridd140
	MOVF        _U2R+0, 0 
	SUBWF       _cal+0, 0 
L__ridd140:
	BTFSC       STATUS+0, 0 
	GOTO        L_ridd24
	MOVLW       1
	MOVWF       _U2+0 
	MOVLW       0
	MOVWF       _U2+1 
L_ridd24:
;Proximity_click.c,102 :: 		if (U2R < cal){U2 = 0;}       // if line is not  under sensor 1
	MOVLW       128
	XORWF       _U2R+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _cal+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ridd141
	MOVF        _cal+0, 0 
	SUBWF       _U2R+0, 0 
L__ridd141:
	BTFSC       STATUS+0, 0 
	GOTO        L_ridd25
	CLRF        _U2+0 
	CLRF        _U2+1 
L_ridd25:
;Proximity_click.c,104 :: 		if (U3R > cal){U3 = 1;}       // if line is under sensor 2
	MOVLW       128
	XORWF       _cal+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _U3R+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ridd142
	MOVF        _U3R+0, 0 
	SUBWF       _cal+0, 0 
L__ridd142:
	BTFSC       STATUS+0, 0 
	GOTO        L_ridd26
	MOVLW       1
	MOVWF       _U3+0 
	MOVLW       0
	MOVWF       _U3+1 
L_ridd26:
;Proximity_click.c,105 :: 		if (U3R < cal){U3 = 0;}         // if line is not  under sensor 2
	MOVLW       128
	XORWF       _U3R+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _cal+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ridd143
	MOVF        _cal+0, 0 
	SUBWF       _U3R+0, 0 
L__ridd143:
	BTFSC       STATUS+0, 0 
	GOTO        L_ridd27
	CLRF        _U3+0 
	CLRF        _U3+1 
L_ridd27:
;Proximity_click.c,107 :: 		if (U4R > cal){U4 = 1;}       // if line is under sensor 3
	MOVLW       128
	XORWF       _cal+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _U4R+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ridd144
	MOVF        _U4R+0, 0 
	SUBWF       _cal+0, 0 
L__ridd144:
	BTFSC       STATUS+0, 0 
	GOTO        L_ridd28
	MOVLW       1
	MOVWF       _U4+0 
	MOVLW       0
	MOVWF       _U4+1 
L_ridd28:
;Proximity_click.c,108 :: 		if (U4R < cal){U4 = 0;}         // if line is not  under sensor 3
	MOVLW       128
	XORWF       _U4R+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _cal+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ridd145
	MOVF        _cal+0, 0 
	SUBWF       _U4R+0, 0 
L__ridd145:
	BTFSC       STATUS+0, 0 
	GOTO        L_ridd29
	CLRF        _U4+0 
	CLRF        _U4+1 
L_ridd29:
;Proximity_click.c,110 :: 		if (U5R > cal){U5 = 1;}       // if line is under sensor 4
	MOVLW       128
	XORWF       _cal+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _U5R+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ridd146
	MOVF        _U5R+0, 0 
	SUBWF       _cal+0, 0 
L__ridd146:
	BTFSC       STATUS+0, 0 
	GOTO        L_ridd30
	MOVLW       1
	MOVWF       _U5+0 
	MOVLW       0
	MOVWF       _U5+1 
L_ridd30:
;Proximity_click.c,111 :: 		if (U5R < cal){U5 = 0;}         // if line is not  under sensor 4
	MOVLW       128
	XORWF       _U5R+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _cal+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ridd147
	MOVF        _cal+0, 0 
	SUBWF       _U5R+0, 0 
L__ridd147:
	BTFSC       STATUS+0, 0 
	GOTO        L_ridd31
	CLRF        _U5+0 
	CLRF        _U5+1 
L_ridd31:
;Proximity_click.c,112 :: 		}
L_end_ridd:
	RETURN      0
; end of _ridd

_calculate:

;Proximity_click.c,114 :: 		calculate  (){         //function who ic calculate position of line and send this in mod function
;Proximity_click.c,116 :: 		if(U1==1 && U2==1 && U3==1 && U4==1 && U5==1){mod(0);last=0;}          // 0 (if line on the center)
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate149
	MOVLW       1
	XORWF       _U1+0, 0 
L__calculate149:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate34
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate150
	MOVLW       1
	XORWF       _U2+0, 0 
L__calculate150:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate34
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate151
	MOVLW       1
	XORWF       _U3+0, 0 
L__calculate151:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate34
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate152
	MOVLW       1
	XORWF       _U4+0, 0 
L__calculate152:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate34
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate153
	MOVLW       1
	XORWF       _U5+0, 0 
L__calculate153:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate34
L__calculate122:
	CLRF        FARG_mod_c+0 
	CLRF        FARG_mod_c+1 
	CALL        _mod+0, 0
	CLRF        _last+0 
	CLRF        _last+1 
L_calculate34:
;Proximity_click.c,117 :: 		if(U1==0 && U2==0 && U3==1 && U4==0 && U5==0){mod(0);last=0;}
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate154
	MOVLW       0
	XORWF       _U1+0, 0 
L__calculate154:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate37
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate155
	MOVLW       0
	XORWF       _U2+0, 0 
L__calculate155:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate37
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate156
	MOVLW       1
	XORWF       _U3+0, 0 
L__calculate156:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate37
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate157
	MOVLW       0
	XORWF       _U4+0, 0 
L__calculate157:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate37
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate158
	MOVLW       0
	XORWF       _U5+0, 0 
L__calculate158:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate37
L__calculate121:
	CLRF        FARG_mod_c+0 
	CLRF        FARG_mod_c+1 
	CALL        _mod+0, 0
	CLRF        _last+0 
	CLRF        _last+1 
L_calculate37:
;Proximity_click.c,118 :: 		if(U1==0 && U2==1 && U3==1 && U4==1 && U5==0){mod(0);last=0;}
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate159
	MOVLW       0
	XORWF       _U1+0, 0 
L__calculate159:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate40
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate160
	MOVLW       1
	XORWF       _U2+0, 0 
L__calculate160:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate40
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate161
	MOVLW       1
	XORWF       _U3+0, 0 
L__calculate161:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate40
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate162
	MOVLW       1
	XORWF       _U4+0, 0 
L__calculate162:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate40
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate163
	MOVLW       0
	XORWF       _U5+0, 0 
L__calculate163:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate40
L__calculate120:
	CLRF        FARG_mod_c+0 
	CLRF        FARG_mod_c+1 
	CALL        _mod+0, 0
	CLRF        _last+0 
	CLRF        _last+1 
L_calculate40:
;Proximity_click.c,120 :: 		if(U1==1 && U2==0 && U3==0 && U4==0 && U5==0){mod(4);last=4;}          //4 right
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate164
	MOVLW       1
	XORWF       _U1+0, 0 
L__calculate164:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate43
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate165
	MOVLW       0
	XORWF       _U2+0, 0 
L__calculate165:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate43
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate166
	MOVLW       0
	XORWF       _U3+0, 0 
L__calculate166:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate43
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate167
	MOVLW       0
	XORWF       _U4+0, 0 
L__calculate167:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate43
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate168
	MOVLW       0
	XORWF       _U5+0, 0 
L__calculate168:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate43
L__calculate119:
	MOVLW       4
	MOVWF       FARG_mod_c+0 
	MOVLW       0
	MOVWF       FARG_mod_c+1 
	CALL        _mod+0, 0
	MOVLW       4
	MOVWF       _last+0 
	MOVLW       0
	MOVWF       _last+1 
L_calculate43:
;Proximity_click.c,122 :: 		if(U1==1 && U2==1 && U3==0 && U4==0 && U5==0){mod(4);last=3;}          //3 right
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate169
	MOVLW       1
	XORWF       _U1+0, 0 
L__calculate169:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate46
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate170
	MOVLW       1
	XORWF       _U2+0, 0 
L__calculate170:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate46
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate171
	MOVLW       0
	XORWF       _U3+0, 0 
L__calculate171:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate46
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate172
	MOVLW       0
	XORWF       _U4+0, 0 
L__calculate172:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate46
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate173
	MOVLW       0
	XORWF       _U5+0, 0 
L__calculate173:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate46
L__calculate118:
	MOVLW       4
	MOVWF       FARG_mod_c+0 
	MOVLW       0
	MOVWF       FARG_mod_c+1 
	CALL        _mod+0, 0
	MOVLW       3
	MOVWF       _last+0 
	MOVLW       0
	MOVWF       _last+1 
L_calculate46:
;Proximity_click.c,124 :: 		if(U1==0 && U2==1 && U3==0 && U4==0 && U5==0){mod(4);last=2;}          //2 right
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate174
	MOVLW       0
	XORWF       _U1+0, 0 
L__calculate174:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate49
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate175
	MOVLW       1
	XORWF       _U2+0, 0 
L__calculate175:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate49
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate176
	MOVLW       0
	XORWF       _U3+0, 0 
L__calculate176:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate49
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate177
	MOVLW       0
	XORWF       _U4+0, 0 
L__calculate177:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate49
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate178
	MOVLW       0
	XORWF       _U5+0, 0 
L__calculate178:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate49
L__calculate117:
	MOVLW       4
	MOVWF       FARG_mod_c+0 
	MOVLW       0
	MOVWF       FARG_mod_c+1 
	CALL        _mod+0, 0
	MOVLW       2
	MOVWF       _last+0 
	MOVLW       0
	MOVWF       _last+1 
L_calculate49:
;Proximity_click.c,125 :: 		if(U1==1 && U2==1 && U3==1 && U4==0 && U5==0){mod(4);last=2;}
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate179
	MOVLW       1
	XORWF       _U1+0, 0 
L__calculate179:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate52
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate180
	MOVLW       1
	XORWF       _U2+0, 0 
L__calculate180:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate52
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate181
	MOVLW       1
	XORWF       _U3+0, 0 
L__calculate181:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate52
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate182
	MOVLW       0
	XORWF       _U4+0, 0 
L__calculate182:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate52
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate183
	MOVLW       0
	XORWF       _U5+0, 0 
L__calculate183:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate52
L__calculate116:
	MOVLW       4
	MOVWF       FARG_mod_c+0 
	MOVLW       0
	MOVWF       FARG_mod_c+1 
	CALL        _mod+0, 0
	MOVLW       2
	MOVWF       _last+0 
	MOVLW       0
	MOVWF       _last+1 
L_calculate52:
;Proximity_click.c,127 :: 		if(U1==0 && U2==1 && U3==1 && U4==0 && U5==0){mod(4);last=1;}
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate184
	MOVLW       0
	XORWF       _U1+0, 0 
L__calculate184:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate55
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate185
	MOVLW       1
	XORWF       _U2+0, 0 
L__calculate185:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate55
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate186
	MOVLW       1
	XORWF       _U3+0, 0 
L__calculate186:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate55
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate187
	MOVLW       0
	XORWF       _U4+0, 0 
L__calculate187:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate55
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate188
	MOVLW       0
	XORWF       _U5+0, 0 
L__calculate188:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate55
L__calculate115:
	MOVLW       4
	MOVWF       FARG_mod_c+0 
	MOVLW       0
	MOVWF       FARG_mod_c+1 
	CALL        _mod+0, 0
	MOVLW       1
	MOVWF       _last+0 
	MOVLW       0
	MOVWF       _last+1 
L_calculate55:
;Proximity_click.c,128 :: 		if(U1==1 && U2==1 && U3==1 && U4==1 && U5==0){mod(4);last=1;}          //1 right
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate189
	MOVLW       1
	XORWF       _U1+0, 0 
L__calculate189:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate58
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate190
	MOVLW       1
	XORWF       _U2+0, 0 
L__calculate190:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate58
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate191
	MOVLW       1
	XORWF       _U3+0, 0 
L__calculate191:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate58
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate192
	MOVLW       1
	XORWF       _U4+0, 0 
L__calculate192:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate58
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate193
	MOVLW       0
	XORWF       _U5+0, 0 
L__calculate193:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate58
L__calculate114:
	MOVLW       4
	MOVWF       FARG_mod_c+0 
	MOVLW       0
	MOVWF       FARG_mod_c+1 
	CALL        _mod+0, 0
	MOVLW       1
	MOVWF       _last+0 
	MOVLW       0
	MOVWF       _last+1 
L_calculate58:
;Proximity_click.c,130 :: 		if(U1==0 && U2==0 && U3==0 && U4==0 && U5==1){mod(-4);last=-4;}          //4 left
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate194
	MOVLW       0
	XORWF       _U1+0, 0 
L__calculate194:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate61
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate195
	MOVLW       0
	XORWF       _U2+0, 0 
L__calculate195:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate61
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate196
	MOVLW       0
	XORWF       _U3+0, 0 
L__calculate196:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate61
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate197
	MOVLW       0
	XORWF       _U4+0, 0 
L__calculate197:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate61
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate198
	MOVLW       1
	XORWF       _U5+0, 0 
L__calculate198:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate61
L__calculate113:
	MOVLW       252
	MOVWF       FARG_mod_c+0 
	MOVLW       255
	MOVWF       FARG_mod_c+1 
	CALL        _mod+0, 0
	MOVLW       252
	MOVWF       _last+0 
	MOVLW       255
	MOVWF       _last+1 
L_calculate61:
;Proximity_click.c,132 :: 		if(U1==0 && U2==0 && U3==0 && U4==1 && U5==1){mod(-4);last=-3;}          //3 left
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate199
	MOVLW       0
	XORWF       _U1+0, 0 
L__calculate199:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate64
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate200
	MOVLW       0
	XORWF       _U2+0, 0 
L__calculate200:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate64
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate201
	MOVLW       0
	XORWF       _U3+0, 0 
L__calculate201:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate64
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate202
	MOVLW       1
	XORWF       _U4+0, 0 
L__calculate202:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate64
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate203
	MOVLW       1
	XORWF       _U5+0, 0 
L__calculate203:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate64
L__calculate112:
	MOVLW       252
	MOVWF       FARG_mod_c+0 
	MOVLW       255
	MOVWF       FARG_mod_c+1 
	CALL        _mod+0, 0
	MOVLW       253
	MOVWF       _last+0 
	MOVLW       255
	MOVWF       _last+1 
L_calculate64:
;Proximity_click.c,134 :: 		if(U1==0 && U2==0 && U3==0 && U4==1 && U5==0){mod(-4);last=-2;}          //2 left
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate204
	MOVLW       0
	XORWF       _U1+0, 0 
L__calculate204:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate67
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate205
	MOVLW       0
	XORWF       _U2+0, 0 
L__calculate205:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate67
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate206
	MOVLW       0
	XORWF       _U3+0, 0 
L__calculate206:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate67
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate207
	MOVLW       1
	XORWF       _U4+0, 0 
L__calculate207:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate67
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate208
	MOVLW       0
	XORWF       _U5+0, 0 
L__calculate208:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate67
L__calculate111:
	MOVLW       252
	MOVWF       FARG_mod_c+0 
	MOVLW       255
	MOVWF       FARG_mod_c+1 
	CALL        _mod+0, 0
	MOVLW       254
	MOVWF       _last+0 
	MOVLW       255
	MOVWF       _last+1 
L_calculate67:
;Proximity_click.c,135 :: 		if(U1==0 && U2==0 && U3==1 && U4==1 && U5==1){mod(-4);last=-2;}
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate209
	MOVLW       0
	XORWF       _U1+0, 0 
L__calculate209:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate70
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate210
	MOVLW       0
	XORWF       _U2+0, 0 
L__calculate210:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate70
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate211
	MOVLW       1
	XORWF       _U3+0, 0 
L__calculate211:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate70
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate212
	MOVLW       1
	XORWF       _U4+0, 0 
L__calculate212:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate70
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate213
	MOVLW       1
	XORWF       _U5+0, 0 
L__calculate213:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate70
L__calculate110:
	MOVLW       252
	MOVWF       FARG_mod_c+0 
	MOVLW       255
	MOVWF       FARG_mod_c+1 
	CALL        _mod+0, 0
	MOVLW       254
	MOVWF       _last+0 
	MOVLW       255
	MOVWF       _last+1 
L_calculate70:
;Proximity_click.c,137 :: 		if(U1==0 && U2==0 && U3==1 && U4==1 && U5==0){mod(-4);last=-1;}          //1 left
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate214
	MOVLW       0
	XORWF       _U1+0, 0 
L__calculate214:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate73
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate215
	MOVLW       0
	XORWF       _U2+0, 0 
L__calculate215:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate73
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate216
	MOVLW       1
	XORWF       _U3+0, 0 
L__calculate216:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate73
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate217
	MOVLW       1
	XORWF       _U4+0, 0 
L__calculate217:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate73
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate218
	MOVLW       0
	XORWF       _U5+0, 0 
L__calculate218:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate73
L__calculate109:
	MOVLW       252
	MOVWF       FARG_mod_c+0 
	MOVLW       255
	MOVWF       FARG_mod_c+1 
	CALL        _mod+0, 0
	MOVLW       255
	MOVWF       _last+0 
	MOVLW       255
	MOVWF       _last+1 
L_calculate73:
;Proximity_click.c,138 :: 		if(U1==0 && U2==1 && U3==1 && U4==1 && U5==1){mod(-4);last=-1;}
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate219
	MOVLW       0
	XORWF       _U1+0, 0 
L__calculate219:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate76
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate220
	MOVLW       1
	XORWF       _U2+0, 0 
L__calculate220:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate76
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate221
	MOVLW       1
	XORWF       _U3+0, 0 
L__calculate221:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate76
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate222
	MOVLW       1
	XORWF       _U4+0, 0 
L__calculate222:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate76
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate223
	MOVLW       1
	XORWF       _U5+0, 0 
L__calculate223:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate76
L__calculate108:
	MOVLW       252
	MOVWF       FARG_mod_c+0 
	MOVLW       255
	MOVWF       FARG_mod_c+1 
	CALL        _mod+0, 0
	MOVLW       255
	MOVWF       _last+0 
	MOVLW       255
	MOVWF       _last+1 
L_calculate76:
;Proximity_click.c,140 :: 		if(U1==0 && U2==0 && U3==0 && U4==0 && U5==0 && last==-4){mod(-4);}      //no line but last position is -4
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate224
	MOVLW       0
	XORWF       _U1+0, 0 
L__calculate224:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate79
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate225
	MOVLW       0
	XORWF       _U2+0, 0 
L__calculate225:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate79
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate226
	MOVLW       0
	XORWF       _U3+0, 0 
L__calculate226:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate79
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate227
	MOVLW       0
	XORWF       _U4+0, 0 
L__calculate227:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate79
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate228
	MOVLW       0
	XORWF       _U5+0, 0 
L__calculate228:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate79
	MOVLW       255
	XORWF       _last+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate229
	MOVLW       252
	XORWF       _last+0, 0 
L__calculate229:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate79
L__calculate107:
	MOVLW       252
	MOVWF       FARG_mod_c+0 
	MOVLW       255
	MOVWF       FARG_mod_c+1 
	CALL        _mod+0, 0
L_calculate79:
;Proximity_click.c,141 :: 		if(U1==0 && U2==0 && U3==0 && U4==0 && U5==0 && last==4){mod(4);}        //no line but last position is 4
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate230
	MOVLW       0
	XORWF       _U1+0, 0 
L__calculate230:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate82
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate231
	MOVLW       0
	XORWF       _U2+0, 0 
L__calculate231:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate82
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate232
	MOVLW       0
	XORWF       _U3+0, 0 
L__calculate232:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate82
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate233
	MOVLW       0
	XORWF       _U4+0, 0 
L__calculate233:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate82
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate234
	MOVLW       0
	XORWF       _U5+0, 0 
L__calculate234:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate82
	MOVLW       0
	XORWF       _last+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__calculate235
	MOVLW       4
	XORWF       _last+0, 0 
L__calculate235:
	BTFSS       STATUS+0, 2 
	GOTO        L_calculate82
L__calculate106:
	MOVLW       4
	MOVWF       FARG_mod_c+0 
	MOVLW       0
	MOVWF       FARG_mod_c+1 
	CALL        _mod+0, 0
L_calculate82:
;Proximity_click.c,144 :: 		}
L_end_calculate:
	RETURN      0
; end of _calculate

_VCNL_Set_default_Mode:

;Proximity_click.c,147 :: 		void VCNL_Set_default_Mode(){       //VCNL  setings
;Proximity_click.c,149 :: 		ByteToStr(VCNL_RdSingle(REGISTER_ID),temp_text);
	MOVLW       129
	MOVWF       FARG_VCNL_RdSingle_rAddr+0 
	CALL        _VCNL_RdSingle+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _temp_text+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_temp_text+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;Proximity_click.c,150 :: 		VCNL_WrSingle(REGISTER_PROX_CURRENT, 20);
	MOVLW       131
	MOVWF       FARG_VCNL_WrSingle_wAddr+0 
	MOVLW       20
	MOVWF       FARG_VCNL_WrSingle_wData+0 
	CALL        _VCNL_WrSingle+0, 0
;Proximity_click.c,151 :: 		ByteToStr(VCNL_RdSingle(REGISTER_PROX_CURRENT),temp_text);
	MOVLW       131
	MOVWF       FARG_VCNL_RdSingle_rAddr+0 
	CALL        _VCNL_RdSingle+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _temp_text+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_temp_text+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;Proximity_click.c,152 :: 		VCNL_WrSingle(REGISTER_PROX_RATE, PROX_MEASUREMENT_RATE_31);
	MOVLW       130
	MOVWF       FARG_VCNL_WrSingle_wAddr+0 
	MOVLW       4
	MOVWF       FARG_VCNL_WrSingle_wData+0 
	CALL        _VCNL_WrSingle+0, 0
;Proximity_click.c,153 :: 		ByteToStr(VCNL_RdSingle(REGISTER_PROX_RATE), temp_text);
	MOVLW       130
	MOVWF       FARG_VCNL_RdSingle_rAddr+0 
	CALL        _VCNL_RdSingle+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _temp_text+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_temp_text+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;Proximity_click.c,154 :: 		VCNL_WrSingle(REGISTER_COMMAND, COMMAND_PROX_ENABLE | COMMAND_AMBI_ENABLE | COMMAND_SELFTIMED_MODE_ENABLE);
	MOVLW       128
	MOVWF       FARG_VCNL_WrSingle_wAddr+0 
	MOVLW       7
	MOVWF       FARG_VCNL_WrSingle_wData+0 
	CALL        _VCNL_WrSingle+0, 0
;Proximity_click.c,155 :: 		ByteToStr(VCNL_RdSingle(REGISTER_COMMAND), temp_text);
	MOVLW       128
	MOVWF       FARG_VCNL_RdSingle_rAddr+0 
	CALL        _VCNL_RdSingle+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _temp_text+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_temp_text+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;Proximity_click.c,156 :: 		VCNL_WrSingle(REGISTER_INTERRUPT_CONTROL, INTERRUPT_THRES_SEL_PROX | INTERRUPT_THRES_ENABLE | INTERRUPT_COUNT_EXCEED_1);
	MOVLW       137
	MOVWF       FARG_VCNL_WrSingle_wAddr+0 
	MOVLW       2
	MOVWF       FARG_VCNL_WrSingle_wData+0 
	CALL        _VCNL_WrSingle+0, 0
;Proximity_click.c,157 :: 		ByteToStr(VCNL_RdSingle(REGISTER_INTERRUPT_CONTROL), temp_text);
	MOVLW       137
	MOVWF       FARG_VCNL_RdSingle_rAddr+0 
	CALL        _VCNL_RdSingle+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _temp_text+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_temp_text+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;Proximity_click.c,158 :: 		VCNL_WrSingle(REGISTER_AMBI_PARAMETER, AMBI_PARA_AVERAGE_32 | AMBI_PARA_AUTO_OFFSET_ENABLE | AMBI_PARA_MEAS_RATE_2);
	MOVLW       132
	MOVWF       FARG_VCNL_WrSingle_wAddr+0 
	MOVLW       29
	MOVWF       FARG_VCNL_WrSingle_wData+0 
	CALL        _VCNL_WrSingle+0, 0
;Proximity_click.c,159 :: 		ByteToStr(VCNL_RdSingle(REGISTER_AMBI_PARAMETER), temp_text);
	MOVLW       132
	MOVWF       FARG_VCNL_RdSingle_rAddr+0 
	CALL        _VCNL_RdSingle+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _temp_text+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_temp_text+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;Proximity_click.c,160 :: 		}
L_end_VCNL_Set_default_Mode:
	RETURN      0
; end of _VCNL_Set_default_Mode

_main:

;Proximity_click.c,162 :: 		void main() {
;Proximity_click.c,164 :: 		cal= 300;  //black-white limit calculate
	MOVLW       44
	MOVWF       _cal+0 
	MOVLW       1
	MOVWF       _cal+1 
;Proximity_click.c,166 :: 		cnt1 = 0;   //set all ehtermal timers on 0
	CLRF        _cnt1+0 
	CLRF        _cnt1+1 
	CLRF        _cnt1+2 
	CLRF        _cnt1+3 
;Proximity_click.c,167 :: 		cnt2 = 0;
	CLRF        _cnt2+0 
	CLRF        _cnt2+1 
	CLRF        _cnt2+2 
	CLRF        _cnt2+3 
;Proximity_click.c,168 :: 		cnt3 = 0;
	CLRF        _cnt3+0 
	CLRF        _cnt3+1 
	CLRF        _cnt3+2 
	CLRF        _cnt3+3 
;Proximity_click.c,170 :: 		ab=0;
	CLRF        _ab+0 
	CLRF        _ab+1 
;Proximity_click.c,172 :: 		a1=100;
	MOVLW       100
	MOVWF       _a1+0 
	MOVLW       0
	MOVWF       _a1+1 
;Proximity_click.c,173 :: 		a2=100;
	MOVLW       100
	MOVWF       _a2+0 
	MOVLW       0
	MOVWF       _a2+1 
;Proximity_click.c,174 :: 		c1=100;
	MOVLW       100
	MOVWF       _c1+0 
	MOVLW       0
	MOVWF       _c1+1 
;Proximity_click.c,175 :: 		c2=100;
	MOVLW       100
	MOVWF       _c2+0 
	MOVLW       0
	MOVWF       _c2+1 
;Proximity_click.c,177 :: 		trept=0; // set  state of down leds  on 0
	CLRF        _trept+0 
	CLRF        _trept+1 
;Proximity_click.c,179 :: 		ANSELA = 0x2F;      //set port A
	MOVLW       47
	MOVWF       ANSELA+0 
;Proximity_click.c,180 :: 		TRISA = 0x2F;
	MOVLW       47
	MOVWF       TRISA+0 
;Proximity_click.c,181 :: 		LATA = 0x00;
	CLRF        LATA+0 
;Proximity_click.c,183 :: 		ANSELB = 0;              // set port B
	CLRF        ANSELB+0 
;Proximity_click.c,184 :: 		TRISB  = 0;
	CLRF        TRISB+0 
;Proximity_click.c,185 :: 		TRISB0_bit = 1;
	BSF         TRISB0_bit+0, BitPos(TRISB0_bit+0) 
;Proximity_click.c,187 :: 		ANSELC = 0;              // set port C
	CLRF        ANSELC+0 
;Proximity_click.c,188 :: 		TRISC  = 0;
	CLRF        TRISC+0 
;Proximity_click.c,189 :: 		LATC = 0x00;
	CLRF        LATC+0 
;Proximity_click.c,190 :: 		TRISC0_BIT=1;
	BSF         TRISC0_bit+0, BitPos(TRISC0_bit+0) 
;Proximity_click.c,192 :: 		ANSELD = 0;              //set port D
	CLRF        ANSELD+0 
;Proximity_click.c,193 :: 		TRISD  = 0;
	CLRF        TRISD+0 
;Proximity_click.c,194 :: 		LATD = 0x00;
	CLRF        LATD+0 
;Proximity_click.c,196 :: 		ANSELE = 0;              // set port E
	CLRF        ANSELE+0 
;Proximity_click.c,197 :: 		TRISE  = 0;
	CLRF        TRISE+0 
;Proximity_click.c,198 :: 		LATE = 0xFF;
	MOVLW       255
	MOVWF       LATE+0 
;Proximity_click.c,200 :: 		INTCON = 0xC0;                   //timer set to 1ms
	MOVLW       192
	MOVWF       INTCON+0 
;Proximity_click.c,201 :: 		T0CON         = 0xC2;
	MOVLW       194
	MOVWF       T0CON+0 
;Proximity_click.c,202 :: 		TMR0L         = 0;
	CLRF        TMR0L+0 
;Proximity_click.c,203 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;Proximity_click.c,204 :: 		TMR0IE_bit = 1;
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;Proximity_click.c,206 :: 		I2C1_Init(100000);
	MOVLW       40
	MOVWF       SSP1ADD+0 
	CALL        _I2C1_Init+0, 0
;Proximity_click.c,207 :: 		I2C1_Stop();
	CALL        _I2C1_Stop+0, 0
;Proximity_click.c,209 :: 		VCNL_Set_default_Mode();
	CALL        _VCNL_Set_default_Mode+0, 0
;Proximity_click.c,213 :: 		SummProxiValue = 0;
	CLRF        _SummProxiValue+0 
	CLRF        _SummProxiValue+1 
	CLRF        _SummProxiValue+2 
	CLRF        _SummProxiValue+3 
;Proximity_click.c,214 :: 		for (i_loop = 0; i_loop < 16; i_loop++) {
	CLRF        _i_loop+0 
L_main83:
	MOVLW       16
	SUBWF       _i_loop+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main84
;Proximity_click.c,215 :: 		do { // wait on prox data ready bit
L_main86:
;Proximity_click.c,216 :: 		Command = VCNL_RdSingle(REGISTER_COMMAND);
	MOVLW       128
	MOVWF       FARG_VCNL_RdSingle_rAddr+0 
	CALL        _VCNL_RdSingle+0, 0
	MOVF        R0, 0 
	MOVWF       _Command+0 
;Proximity_click.c,217 :: 		} while (!(Command & COMMAND_MASK_PROX_DATA_READY)); // prox data ready ?
	BTFSS       R0, 5 
	GOTO        L_main86
;Proximity_click.c,218 :: 		VCNL_RdSeq(REGISTER_PROX_VALUE, &data_, 2);
	MOVLW       135
	MOVWF       FARG_VCNL_RdSeq_rAddr+0 
	MOVLW       _data_+0
	MOVWF       FARG_VCNL_RdSeq_rcvData+0 
	MOVLW       hi_addr(_data_+0)
	MOVWF       FARG_VCNL_RdSeq_rcvData+1 
	MOVLW       2
	MOVWF       FARG_VCNL_RdSeq_rLen+0 
	MOVLW       0
	MOVWF       FARG_VCNL_RdSeq_rLen+1 
	MOVWF       FARG_VCNL_RdSeq_rLen+2 
	MOVWF       FARG_VCNL_RdSeq_rLen+3 
	CALL        _VCNL_RdSeq+0, 0
;Proximity_click.c,219 :: 		ProxiValue = (data_[0] << 8) | data_[1];
	MOVF        _data_+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        _data_+1, 0 
	IORWF       R0, 1 
	MOVLW       0
	IORWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       _ProxiValue+0 
	MOVF        R1, 0 
	MOVWF       _ProxiValue+1 
;Proximity_click.c,220 :: 		SummProxiValue += ProxiValue; // Summ of all measured prox values
	MOVF        R0, 0 
	ADDWF       _SummProxiValue+0, 1 
	MOVF        R1, 0 
	ADDWFC      _SummProxiValue+1, 1 
	MOVLW       0
	ADDWFC      _SummProxiValue+2, 1 
	ADDWFC      _SummProxiValue+3, 1 
;Proximity_click.c,214 :: 		for (i_loop = 0; i_loop < 16; i_loop++) {
	INCF        _i_loop+0, 1 
;Proximity_click.c,221 :: 		}
	GOTO        L_main83
L_main84:
;Proximity_click.c,222 :: 		AverageProxiValue = SummProxiValue / 16; // calculate average
	MOVLW       4
	MOVWF       R4 
	MOVF        _SummProxiValue+0, 0 
	MOVWF       R0 
	MOVF        _SummProxiValue+1, 0 
	MOVWF       R1 
	MOVF        _SummProxiValue+2, 0 
	MOVWF       R2 
	MOVF        _SummProxiValue+3, 0 
	MOVWF       R3 
	MOVF        R4, 0 
L__main238:
	BZ          L__main239
	RRCF        R3, 1 
	RRCF        R2, 1 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R3, 7 
	ADDLW       255
	GOTO        L__main238
L__main239:
	MOVF        R0, 0 
	MOVWF       _AverageProxiValue+0 
	MOVF        R1, 0 
	MOVWF       _AverageProxiValue+1 
;Proximity_click.c,224 :: 		LoByte = (unsigned char)((AverageProxiValue + 20) & 0x00FF);
	MOVLW       20
	ADDWF       R0, 0 
	MOVWF       _LoByte+0 
	MOVLW       255
	ANDWF       _LoByte+0, 1 
;Proximity_click.c,225 :: 		HiByte = (unsigned char)(((AverageProxiValue + 20) & 0xFF00) >> 8);
	MOVLW       20
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       0
	ANDWF       R0, 0 
	MOVWF       R3 
	MOVF        R1, 0 
	ANDLW       255
	MOVWF       R4 
	MOVF        R4, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVF        R0, 0 
	MOVWF       _HiByte+0 
;Proximity_click.c,226 :: 		VCNL_WrSingle(REGISTER_INTERRUPT_HIGH_THRES, HiByte);
	MOVLW       140
	MOVWF       FARG_VCNL_WrSingle_wAddr+0 
	MOVF        R0, 0 
	MOVWF       FARG_VCNL_WrSingle_wData+0 
	CALL        _VCNL_WrSingle+0, 0
;Proximity_click.c,227 :: 		VCNL_WrSingle(REGISTER_INTERRUPT_HIGH_THRES + 1, LoByte);
	MOVLW       141
	MOVWF       FARG_VCNL_WrSingle_wAddr+0 
	MOVF        _LoByte+0, 0 
	MOVWF       FARG_VCNL_WrSingle_wData+0 
	CALL        _VCNL_WrSingle+0, 0
;Proximity_click.c,228 :: 		WordToStr(AverageProxiValue + 20, temp_text);
	MOVLW       20
	ADDWF       _AverageProxiValue+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVLW       0
	ADDWFC      _AverageProxiValue+1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       _temp_text+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(_temp_text+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;Proximity_click.c,231 :: 		LATB = 0x00;  //again set port B pins to 0
	CLRF        LATB+0 
;Proximity_click.c,233 :: 		Delay_ms(50);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main89:
	DECFSZ      R13, 1, 1
	BRA         L_main89
	DECFSZ      R12, 1, 1
	BRA         L_main89
	DECFSZ      R11, 1, 1
	BRA         L_main89
	NOP
;Proximity_click.c,235 :: 		LATD0_bit=0;  //again set port D pins to 0
	BCF         LATD0_bit+0, BitPos(LATD0_bit+0) 
;Proximity_click.c,236 :: 		LATD1_bit=0;
	BCF         LATD1_bit+0, BitPos(LATD1_bit+0) 
;Proximity_click.c,237 :: 		LATD3_bit=0;
	BCF         LATD3_bit+0, BitPos(LATD3_bit+0) 
;Proximity_click.c,238 :: 		LATD5_bit=0;
	BCF         LATD5_bit+0, BitPos(LATD5_bit+0) 
;Proximity_click.c,240 :: 		while (1) {
L_main90:
;Proximity_click.c,242 :: 		ridd();
	CALL        _ridd+0, 0
;Proximity_click.c,243 :: 		calculate();
	CALL        _calculate+0, 0
;Proximity_click.c,245 :: 		if(ab==0){         //if is not  barriere
	MOVLW       0
	XORWF       _ab+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main240
	MOVLW       0
	XORWF       _ab+0, 0 
L__main240:
	BTFSS       STATUS+0, 2 
	GOTO        L_main92
;Proximity_click.c,247 :: 		pwm1(c1,c2);   //set PWM1 and PWM2 (motors speeds)
	MOVF        _c1+0, 0 
	MOVWF       FARG_pwm1_t1up+0 
	MOVF        _c1+1, 0 
	MOVWF       FARG_pwm1_t1up+1 
	MOVF        _c2+0, 0 
	MOVWF       FARG_pwm1_t1down+0 
	MOVF        _c2+1, 0 
	MOVWF       FARG_pwm1_t1down+1 
	CALL        _pwm1+0, 0
;Proximity_click.c,248 :: 		pwm2(a1,a2);
	MOVF        _a1+0, 0 
	MOVWF       FARG_pwm2_t2up+0 
	MOVF        _a1+1, 0 
	MOVWF       FARG_pwm2_t2up+1 
	MOVF        _a2+0, 0 
	MOVWF       FARG_pwm2_t2down+0 
	MOVF        _a2+1, 0 
	MOVWF       FARG_pwm2_t2down+1 
	CALL        _pwm2+0, 0
;Proximity_click.c,250 :: 		}
	GOTO        L_main93
L_main92:
;Proximity_click.c,252 :: 		pwm1(2,80);  //braek (set very smolly motors speeds)
	MOVLW       2
	MOVWF       FARG_pwm1_t1up+0 
	MOVLW       0
	MOVWF       FARG_pwm1_t1up+1 
	MOVLW       80
	MOVWF       FARG_pwm1_t1down+0 
	MOVLW       0
	MOVWF       FARG_pwm1_t1down+1 
	CALL        _pwm1+0, 0
;Proximity_click.c,253 :: 		pwm2(2,80);
	MOVLW       2
	MOVWF       FARG_pwm2_t2up+0 
	MOVLW       0
	MOVWF       FARG_pwm2_t2up+1 
	MOVLW       80
	MOVWF       FARG_pwm2_t2down+0 
	MOVLW       0
	MOVWF       FARG_pwm2_t2down+1 
	CALL        _pwm2+0, 0
;Proximity_click.c,254 :: 		}
L_main93:
;Proximity_click.c,256 :: 		do{                                                        //proximity read
L_main94:
;Proximity_click.c,257 :: 		Command = VCNL_RdSingle(REGISTER_COMMAND);
	MOVLW       128
	MOVWF       FARG_VCNL_RdSingle_rAddr+0 
	CALL        _VCNL_RdSingle+0, 0
	MOVF        R0, 0 
	MOVWF       _Command+0 
;Proximity_click.c,258 :: 		}while (!(Command & (COMMAND_MASK_PROX_DATA_READY | COMMAND_MASK_AMBI_DATA_READY))); // data ready ?
	MOVLW       96
	ANDWF       R0, 1 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main94
;Proximity_click.c,261 :: 		InterruptStatus = VCNL_RdSingle(REGISTER_INTERRUPT_STATUS);
	MOVLW       142
	MOVWF       FARG_VCNL_RdSingle_rAddr+0 
	CALL        _VCNL_RdSingle+0, 0
	MOVF        R0, 0 
	MOVWF       _InterruptStatus+0 
;Proximity_click.c,263 :: 		if(InterruptStatus & INTERRUPT_MASK_STATUS_THRES_HI){
	BTFSS       R0, 0 
	GOTO        L_main97
;Proximity_click.c,264 :: 		VCNL_WrSingle(REGISTER_INTERRUPT_STATUS, InterruptStatus);
	MOVLW       142
	MOVWF       FARG_VCNL_WrSingle_wAddr+0 
	MOVF        _InterruptStatus+0, 0 
	MOVWF       FARG_VCNL_WrSingle_wData+0 
	CALL        _VCNL_WrSingle+0, 0
;Proximity_click.c,265 :: 		}
L_main97:
;Proximity_click.c,268 :: 		if(Command & COMMAND_MASK_PROX_DATA_READY){
	BTFSS       _Command+0, 5 
	GOTO        L_main98
;Proximity_click.c,270 :: 		VCNL_RdSeq(REGISTER_PROX_VALUE, &data_, 2);
	MOVLW       135
	MOVWF       FARG_VCNL_RdSeq_rAddr+0 
	MOVLW       _data_+0
	MOVWF       FARG_VCNL_RdSeq_rcvData+0 
	MOVLW       hi_addr(_data_+0)
	MOVWF       FARG_VCNL_RdSeq_rcvData+1 
	MOVLW       2
	MOVWF       FARG_VCNL_RdSeq_rLen+0 
	MOVLW       0
	MOVWF       FARG_VCNL_RdSeq_rLen+1 
	MOVWF       FARG_VCNL_RdSeq_rLen+2 
	MOVWF       FARG_VCNL_RdSeq_rLen+3 
	CALL        _VCNL_RdSeq+0, 0
;Proximity_click.c,271 :: 		ProxiValue = (data_[0] << 8) | data_[1];
	MOVF        _data_+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        _data_+1, 0 
	IORWF       R0, 1 
	MOVLW       0
	IORWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       _ProxiValue+0 
	MOVF        R1, 0 
	MOVWF       _ProxiValue+1 
;Proximity_click.c,273 :: 		WordToStr(ProxiValue, temp_text);
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       _temp_text+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(_temp_text+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;Proximity_click.c,277 :: 		if(ProxiValue < (AverageProxiValue + 50)){     //if is not  barriere
	MOVLW       50
	ADDWF       _AverageProxiValue+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      _AverageProxiValue+1, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       _ProxiValue+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main241
	MOVF        R1, 0 
	SUBWF       _ProxiValue+0, 0 
L__main241:
	BTFSC       STATUS+0, 0 
	GOTO        L_main99
;Proximity_click.c,278 :: 		LATB2_bit=1;      //turn on up front lights
	BSF         LATB2_bit+0, BitPos(LATB2_bit+0) 
;Proximity_click.c,279 :: 		LATD2_bit=0;     //turn off braking lights
	BCF         LATD2_bit+0, BitPos(LATD2_bit+0) 
;Proximity_click.c,280 :: 		}             ab=0;
L_main99:
	CLRF        _ab+0 
	CLRF        _ab+1 
;Proximity_click.c,281 :: 		if((ProxiValue > (AverageProxiValue + 50))) {       //if is  barriere
	MOVLW       50
	ADDWF       _AverageProxiValue+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      _AverageProxiValue+1, 0 
	MOVWF       R2 
	MOVF        _ProxiValue+1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main242
	MOVF        _ProxiValue+0, 0 
	SUBWF       R1, 0 
L__main242:
	BTFSC       STATUS+0, 0 
	GOTO        L_main100
;Proximity_click.c,282 :: 		LATB2_bit=0;      //turn off up front lights
	BCF         LATB2_bit+0, BitPos(LATB2_bit+0) 
;Proximity_click.c,283 :: 		LATD2_bit=1;    //turn on braking lights
	BSF         LATD2_bit+0, BitPos(LATD2_bit+0) 
;Proximity_click.c,284 :: 		ab=1;
	MOVLW       1
	MOVWF       _ab+0 
	MOVLW       0
	MOVWF       _ab+1 
;Proximity_click.c,285 :: 		}
L_main100:
;Proximity_click.c,286 :: 		}
L_main98:
;Proximity_click.c,287 :: 		if(cnt3>700&trept==0){LATB1_bit=1;cnt3=0;trept=trept+1;}       //down lights blinking (OFF)
	MOVF        _cnt3+0, 0 
	MOVWF       R4 
	MOVF        _cnt3+1, 0 
	MOVWF       R5 
	MOVF        _cnt3+2, 0 
	MOVWF       R6 
	MOVF        _cnt3+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       47
	MOVWF       R2 
	MOVLW       136
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	XORWF       _trept+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main243
	MOVLW       0
	XORWF       _trept+0, 0 
L__main243:
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R1 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main101
	BSF         LATB1_bit+0, BitPos(LATB1_bit+0) 
	CLRF        _cnt3+0 
	CLRF        _cnt3+1 
	CLRF        _cnt3+2 
	CLRF        _cnt3+3 
	INFSNZ      _trept+0, 1 
	INCF        _trept+1, 1 
L_main101:
;Proximity_click.c,288 :: 		if(cnt3>700&trept==1){LATB1_bit=0;cnt3=0;trept=trept+1;}      //down lights blinking (ON)
	MOVF        _cnt3+0, 0 
	MOVWF       R4 
	MOVF        _cnt3+1, 0 
	MOVWF       R5 
	MOVF        _cnt3+2, 0 
	MOVWF       R6 
	MOVF        _cnt3+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       47
	MOVWF       R2 
	MOVLW       136
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	XORWF       _trept+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main244
	MOVLW       1
	XORWF       _trept+0, 0 
L__main244:
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R1 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main102
	BCF         LATB1_bit+0, BitPos(LATB1_bit+0) 
	CLRF        _cnt3+0 
	CLRF        _cnt3+1 
	CLRF        _cnt3+2 
	CLRF        _cnt3+3 
	INFSNZ      _trept+0, 1 
	INCF        _trept+1, 1 
L_main102:
;Proximity_click.c,289 :: 		if(trept==2){trept=0;}
	MOVLW       0
	XORWF       _trept+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main245
	MOVLW       2
	XORWF       _trept+0, 0 
L__main245:
	BTFSS       STATUS+0, 2 
	GOTO        L_main103
	CLRF        _trept+0 
	CLRF        _trept+1 
L_main103:
;Proximity_click.c,292 :: 		}
	GOTO        L_main90
;Proximity_click.c,295 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
