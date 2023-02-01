
_InitGPIO:

;DC Motor Click.c,45 :: 		void InitGPIO() {
;DC Motor Click.c,47 :: 		ANSELC = 0;
	CLRF        ANSELC+0 
;DC Motor Click.c,48 :: 		ANSELD = 0;
	CLRF        ANSELD+0 
;DC Motor Click.c,49 :: 		ANSELE = 0;
	CLRF        ANSELE+0 
;DC Motor Click.c,52 :: 		TRISD0_bit = 1;
	BSF         TRISD0_bit+0, BitPos(TRISD0_bit+0) 
;DC Motor Click.c,53 :: 		TRISD1_bit = 1;
	BSF         TRISD1_bit+0, BitPos(TRISD1_bit+0) 
;DC Motor Click.c,56 :: 		TRISD7_bit = 1;
	BSF         TRISD7_bit+0, BitPos(TRISD7_bit+0) 
;DC Motor Click.c,57 :: 		TRISD6_bit = 1;
	BSF         TRISD6_bit+0, BitPos(TRISD6_bit+0) 
;DC Motor Click.c,58 :: 		TRISD5_bit = 1;
	BSF         TRISD5_bit+0, BitPos(TRISD5_bit+0) 
;DC Motor Click.c,59 :: 		TRISD4_bit = 1;
	BSF         TRISD4_bit+0, BitPos(TRISD4_bit+0) 
;DC Motor Click.c,62 :: 		SEL1_Direction = 0;
	BCF         TRISE1_bit+0, BitPos(TRISE1_bit+0) 
;DC Motor Click.c,63 :: 		SEL2_Direction = 0;
	BCF         TRISE0_bit+0, BitPos(TRISE0_bit+0) 
;DC Motor Click.c,64 :: 		}
L_end_InitGPIO:
	RETURN      0
; end of _InitGPIO

_PWM_Setup:

;DC Motor Click.c,67 :: 		void PWM_Setup() {
;DC Motor Click.c,69 :: 		TRISC0_bit = 0;                    // Set RC0 as output
	BCF         TRISC0_bit+0, BitPos(TRISC0_bit+0) 
;DC Motor Click.c,70 :: 		current_duty = 0;                  // Initial value for current_duty
	CLRF        _current_duty+0 
	CLRF        _current_duty+1 
;DC Motor Click.c,71 :: 		PWM2_Init(5000);                   // Set PWM frequency/period (according to the DC motor characteristics)
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM2_Init+0, 0
;DC Motor Click.c,72 :: 		PSTR1CON = 0x02;                   // Configure RC0
	MOVLW       2
	MOVWF       PSTR1CON+0 
;DC Motor Click.c,73 :: 		PSTR2CON = 0x02;                   //   as PWM2 putput
	MOVLW       2
	MOVWF       PSTR2CON+0 
;DC Motor Click.c,74 :: 		PWM2_Set_Duty(current_duty);       // Set current duty for PWM
	MOVF        _current_duty+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;DC Motor Click.c,75 :: 		PWM2_Start();                      // Start PWM
	CALL        _PWM2_Start+0, 0
;DC Motor Click.c,76 :: 		}
L_end_PWM_Setup:
	RETURN      0
; end of _PWM_Setup

_main:

;DC Motor Click.c,78 :: 		void main() {
;DC Motor Click.c,80 :: 		InitGPIO();
	CALL        _InitGPIO+0, 0
;DC Motor Click.c,83 :: 		PWM_Setup();
	CALL        _PWM_Setup+0, 0
;DC Motor Click.c,86 :: 		SEL1 = 0;
	BCF         LATE1_bit+0, BitPos(LATE1_bit+0) 
;DC Motor Click.c,87 :: 		SEL2 = 0;
	BCF         LATE0_bit+0, BitPos(LATE0_bit+0) 
;DC Motor Click.c,89 :: 		while (1) {
L_main0:
;DC Motor Click.c,91 :: 		if (Button(&PORTD, 7, 1, 1)) {
	MOVLW       PORTD+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTD+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       7
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main2
;DC Motor Click.c,92 :: 		SEL1 = 0;
	BCF         LATE1_bit+0, BitPos(LATE1_bit+0) 
;DC Motor Click.c,93 :: 		SEL2 = 0;
	BCF         LATE0_bit+0, BitPos(LATE0_bit+0) 
;DC Motor Click.c,94 :: 		}
L_main2:
;DC Motor Click.c,97 :: 		if (Button(&PORTD, 6, 1, 1)) {
	MOVLW       PORTD+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTD+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       6
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main3
;DC Motor Click.c,98 :: 		SEL1 = 0;
	BCF         LATE1_bit+0, BitPos(LATE1_bit+0) 
;DC Motor Click.c,99 :: 		SEL2 = 1;
	BSF         LATE0_bit+0, BitPos(LATE0_bit+0) 
;DC Motor Click.c,100 :: 		}
L_main3:
;DC Motor Click.c,103 :: 		if (Button(&PORTD, 5, 1, 1)) {
	MOVLW       PORTD+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTD+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       5
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main4
;DC Motor Click.c,104 :: 		SEL1 = 1;
	BSF         LATE1_bit+0, BitPos(LATE1_bit+0) 
;DC Motor Click.c,105 :: 		SEL2 = 1;
	BSF         LATE0_bit+0, BitPos(LATE0_bit+0) 
;DC Motor Click.c,106 :: 		}
L_main4:
;DC Motor Click.c,109 :: 		if (Button(&PORTD, 4, 1, 1)) {
	MOVLW       PORTD+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTD+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       4
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main5
;DC Motor Click.c,110 :: 		SEL1 = 1;
	BSF         LATE1_bit+0, BitPos(LATE1_bit+0) 
;DC Motor Click.c,111 :: 		SEL2 = 0;
	BCF         LATE0_bit+0, BitPos(LATE0_bit+0) 
;DC Motor Click.c,112 :: 		}
L_main5:
;DC Motor Click.c,115 :: 		if (Button(&PORTD, 1, 5, 1)) {            //  If RD1 button pressed
	MOVLW       PORTD+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTD+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       1
	MOVWF       FARG_Button_pin+0 
	MOVLW       5
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main6
;DC Motor Click.c,116 :: 		current_duty = current_duty + 1;        //    increment current_duty
	INFSNZ      _current_duty+0, 1 
	INCF        _current_duty+1, 1 
;DC Motor Click.c,117 :: 		PWM2_Set_Duty(current_duty);            //  set newly acquired duty ratio
	MOVF        _current_duty+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;DC Motor Click.c,118 :: 		}
L_main6:
;DC Motor Click.c,121 :: 		if (Button(&PORTD, 0, 5, 1)) {            // If RD0 button pressed
	MOVLW       PORTD+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTD+0)
	MOVWF       FARG_Button_port+1 
	CLRF        FARG_Button_pin+0 
	MOVLW       5
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main7
;DC Motor Click.c,122 :: 		current_duty = current_duty - 1;        //   decrement current_duty
	MOVLW       1
	SUBWF       _current_duty+0, 1 
	MOVLW       0
	SUBWFB      _current_duty+1, 1 
;DC Motor Click.c,123 :: 		PWM2_Set_Duty(current_duty);            // set newly acquired duty ratio
	MOVF        _current_duty+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;DC Motor Click.c,124 :: 		}
L_main7:
;DC Motor Click.c,125 :: 		}
	GOTO        L_main0
;DC Motor Click.c,126 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
