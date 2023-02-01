
_mod:

;LINIJA.c,21 :: 		void mod(int c) {            //paljenje lampica
;LINIJA.c,22 :: 		switch(c){
	GOTO        L_mod0
;LINIJA.c,23 :: 		case 4: latD0_bit=1; break;
L_mod2:
	BSF         LATD0_bit+0, BitPos(LATD0_bit+0) 
	GOTO        L_mod1
;LINIJA.c,24 :: 		case 3: latD1_bit=1; break;
L_mod3:
	BSF         LATD1_bit+0, BitPos(LATD1_bit+0) 
	GOTO        L_mod1
;LINIJA.c,25 :: 		case 2: latD2_bit=1; break;
L_mod4:
	BSF         LATD2_bit+0, BitPos(LATD2_bit+0) 
	GOTO        L_mod1
;LINIJA.c,26 :: 		case 1: latD3_bit=1; break;
L_mod5:
	BSF         LATD3_bit+0, BitPos(LATD3_bit+0) 
	GOTO        L_mod1
;LINIJA.c,27 :: 		case 0: latD4_bit=1; break;
L_mod6:
	BSF         LATD4_bit+0, BitPos(LATD4_bit+0) 
	GOTO        L_mod1
;LINIJA.c,28 :: 		case -1: latD5_bit=1; break;
L_mod7:
	BSF         LATD5_bit+0, BitPos(LATD5_bit+0) 
	GOTO        L_mod1
;LINIJA.c,29 :: 		case -2: latD6_bit=1; break;
L_mod8:
	BSF         LATD6_bit+0, BitPos(LATD6_bit+0) 
	GOTO        L_mod1
;LINIJA.c,30 :: 		case -3: latD7_bit=1; break;
L_mod9:
	BSF         LATD7_bit+0, BitPos(LATD7_bit+0) 
	GOTO        L_mod1
;LINIJA.c,31 :: 		case -4: latE0_bit=1; break;
L_mod10:
	BSF         LATE0_bit+0, BitPos(LATE0_bit+0) 
	GOTO        L_mod1
;LINIJA.c,32 :: 		}
L_mod0:
	MOVLW       0
	XORWF       FARG_mod_c+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mod85
	MOVLW       4
	XORWF       FARG_mod_c+0, 0 
L__mod85:
	BTFSC       STATUS+0, 2 
	GOTO        L_mod2
	MOVLW       0
	XORWF       FARG_mod_c+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mod86
	MOVLW       3
	XORWF       FARG_mod_c+0, 0 
L__mod86:
	BTFSC       STATUS+0, 2 
	GOTO        L_mod3
	MOVLW       0
	XORWF       FARG_mod_c+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mod87
	MOVLW       2
	XORWF       FARG_mod_c+0, 0 
L__mod87:
	BTFSC       STATUS+0, 2 
	GOTO        L_mod4
	MOVLW       0
	XORWF       FARG_mod_c+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mod88
	MOVLW       1
	XORWF       FARG_mod_c+0, 0 
L__mod88:
	BTFSC       STATUS+0, 2 
	GOTO        L_mod5
	MOVLW       0
	XORWF       FARG_mod_c+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mod89
	MOVLW       0
	XORWF       FARG_mod_c+0, 0 
L__mod89:
	BTFSC       STATUS+0, 2 
	GOTO        L_mod6
	MOVLW       255
	XORWF       FARG_mod_c+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mod90
	MOVLW       255
	XORWF       FARG_mod_c+0, 0 
L__mod90:
	BTFSC       STATUS+0, 2 
	GOTO        L_mod7
	MOVLW       255
	XORWF       FARG_mod_c+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mod91
	MOVLW       254
	XORWF       FARG_mod_c+0, 0 
L__mod91:
	BTFSC       STATUS+0, 2 
	GOTO        L_mod8
	MOVLW       255
	XORWF       FARG_mod_c+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mod92
	MOVLW       253
	XORWF       FARG_mod_c+0, 0 
L__mod92:
	BTFSC       STATUS+0, 2 
	GOTO        L_mod9
	MOVLW       255
	XORWF       FARG_mod_c+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mod93
	MOVLW       252
	XORWF       FARG_mod_c+0, 0 
L__mod93:
	BTFSC       STATUS+0, 2 
	GOTO        L_mod10
L_mod1:
;LINIJA.c,33 :: 		}
L_end_mod:
	RETURN      0
; end of _mod

_ridd:

;LINIJA.c,35 :: 		void ridd (){                  //cita vrednosti sa line folow clicka
;LINIJA.c,37 :: 		U5R = ADC_Read(4);
	MOVLW       4
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _U5R+0 
	MOVF        R1, 0 
	MOVWF       _U5R+1 
;LINIJA.c,38 :: 		U4R = ADC_Read(3);
	MOVLW       3
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _U4R+0 
	MOVF        R1, 0 
	MOVWF       _U4R+1 
;LINIJA.c,39 :: 		U3R = ADC_Read(2);
	MOVLW       2
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _U3R+0 
	MOVF        R1, 0 
	MOVWF       _U3R+1 
;LINIJA.c,40 :: 		U2R = ADC_Read(1);
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _U2R+0 
	MOVF        R1, 0 
	MOVWF       _U2R+1 
;LINIJA.c,41 :: 		U1R = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _U1R+0 
	MOVF        R1, 0 
	MOVWF       _U1R+1 
;LINIJA.c,43 :: 		if (U1R > cal){U1 = 1;}
	MOVLW       128
	XORWF       _cal+1, 0 
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ridd95
	MOVF        R0, 0 
	SUBWF       _cal+0, 0 
L__ridd95:
	BTFSC       STATUS+0, 0 
	GOTO        L_ridd11
	MOVLW       1
	MOVWF       _U1+0 
	MOVLW       0
	MOVWF       _U1+1 
L_ridd11:
;LINIJA.c,44 :: 		if (U1R < cal){U1 = 0;}
	MOVLW       128
	XORWF       _U1R+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _cal+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ridd96
	MOVF        _cal+0, 0 
	SUBWF       _U1R+0, 0 
L__ridd96:
	BTFSC       STATUS+0, 0 
	GOTO        L_ridd12
	CLRF        _U1+0 
	CLRF        _U1+1 
L_ridd12:
;LINIJA.c,46 :: 		if (U2R > cal){U2 = 1;}
	MOVLW       128
	XORWF       _cal+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _U2R+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ridd97
	MOVF        _U2R+0, 0 
	SUBWF       _cal+0, 0 
L__ridd97:
	BTFSC       STATUS+0, 0 
	GOTO        L_ridd13
	MOVLW       1
	MOVWF       _U2+0 
	MOVLW       0
	MOVWF       _U2+1 
L_ridd13:
;LINIJA.c,47 :: 		if (U2R < cal){U2 = 0;}
	MOVLW       128
	XORWF       _U2R+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _cal+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ridd98
	MOVF        _cal+0, 0 
	SUBWF       _U2R+0, 0 
L__ridd98:
	BTFSC       STATUS+0, 0 
	GOTO        L_ridd14
	CLRF        _U2+0 
	CLRF        _U2+1 
L_ridd14:
;LINIJA.c,49 :: 		if (U3R > cal){U3 = 1;}
	MOVLW       128
	XORWF       _cal+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _U3R+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ridd99
	MOVF        _U3R+0, 0 
	SUBWF       _cal+0, 0 
L__ridd99:
	BTFSC       STATUS+0, 0 
	GOTO        L_ridd15
	MOVLW       1
	MOVWF       _U3+0 
	MOVLW       0
	MOVWF       _U3+1 
L_ridd15:
;LINIJA.c,50 :: 		if (U3R < cal){U3 = 0;}
	MOVLW       128
	XORWF       _U3R+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _cal+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ridd100
	MOVF        _cal+0, 0 
	SUBWF       _U3R+0, 0 
L__ridd100:
	BTFSC       STATUS+0, 0 
	GOTO        L_ridd16
	CLRF        _U3+0 
	CLRF        _U3+1 
L_ridd16:
;LINIJA.c,52 :: 		if (U4R > cal){U4 = 1;}
	MOVLW       128
	XORWF       _cal+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _U4R+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ridd101
	MOVF        _U4R+0, 0 
	SUBWF       _cal+0, 0 
L__ridd101:
	BTFSC       STATUS+0, 0 
	GOTO        L_ridd17
	MOVLW       1
	MOVWF       _U4+0 
	MOVLW       0
	MOVWF       _U4+1 
L_ridd17:
;LINIJA.c,53 :: 		if (U4R < cal){U4 = 0;}
	MOVLW       128
	XORWF       _U4R+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _cal+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ridd102
	MOVF        _cal+0, 0 
	SUBWF       _U4R+0, 0 
L__ridd102:
	BTFSC       STATUS+0, 0 
	GOTO        L_ridd18
	CLRF        _U4+0 
	CLRF        _U4+1 
L_ridd18:
;LINIJA.c,55 :: 		if (U5R > cal){U5 = 1;}
	MOVLW       128
	XORWF       _cal+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _U5R+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ridd103
	MOVF        _U5R+0, 0 
	SUBWF       _cal+0, 0 
L__ridd103:
	BTFSC       STATUS+0, 0 
	GOTO        L_ridd19
	MOVLW       1
	MOVWF       _U5+0 
	MOVLW       0
	MOVWF       _U5+1 
L_ridd19:
;LINIJA.c,56 :: 		if (U5R < cal){U5 = 0;}
	MOVLW       128
	XORWF       _U5R+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _cal+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ridd104
	MOVF        _cal+0, 0 
	SUBWF       _U5R+0, 0 
L__ridd104:
	BTFSC       STATUS+0, 0 
	GOTO        L_ridd20
	CLRF        _U5+0 
	CLRF        _U5+1 
L_ridd20:
;LINIJA.c,57 :: 		}
L_end_ridd:
	RETURN      0
; end of _ridd

_preracunaj:

;LINIJA.c,59 :: 		preracunaj (){                               //pretvara u brojku od -4 do 4 stanje na senzoru
;LINIJA.c,60 :: 		if(U1==1 && U2==1 && U3==1 && U4==1 && U5==1){mod(0);}          //pravo
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj106
	MOVLW       1
	XORWF       _U1+0, 0 
L__preracunaj106:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj23
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj107
	MOVLW       1
	XORWF       _U2+0, 0 
L__preracunaj107:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj23
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj108
	MOVLW       1
	XORWF       _U3+0, 0 
L__preracunaj108:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj23
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj109
	MOVLW       1
	XORWF       _U4+0, 0 
L__preracunaj109:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj23
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj110
	MOVLW       1
	XORWF       _U5+0, 0 
L__preracunaj110:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj23
L__preracunaj83:
	CLRF        FARG_mod_c+0 
	CLRF        FARG_mod_c+1 
	CALL        _mod+0, 0
L_preracunaj23:
;LINIJA.c,61 :: 		if(U1==0 && U2==0 && U3==1 && U4==0 && U5==0){mod(0);}
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj111
	MOVLW       0
	XORWF       _U1+0, 0 
L__preracunaj111:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj26
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj112
	MOVLW       0
	XORWF       _U2+0, 0 
L__preracunaj112:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj26
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj113
	MOVLW       1
	XORWF       _U3+0, 0 
L__preracunaj113:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj26
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj114
	MOVLW       0
	XORWF       _U4+0, 0 
L__preracunaj114:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj26
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj115
	MOVLW       0
	XORWF       _U5+0, 0 
L__preracunaj115:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj26
L__preracunaj82:
	CLRF        FARG_mod_c+0 
	CLRF        FARG_mod_c+1 
	CALL        _mod+0, 0
L_preracunaj26:
;LINIJA.c,62 :: 		if(U1==0 && U2==1 && U3==1 && U4==1 && U5==0){mod(0);}
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj116
	MOVLW       0
	XORWF       _U1+0, 0 
L__preracunaj116:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj29
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj117
	MOVLW       1
	XORWF       _U2+0, 0 
L__preracunaj117:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj29
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj118
	MOVLW       1
	XORWF       _U3+0, 0 
L__preracunaj118:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj29
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj119
	MOVLW       1
	XORWF       _U4+0, 0 
L__preracunaj119:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj29
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj120
	MOVLW       0
	XORWF       _U5+0, 0 
L__preracunaj120:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj29
L__preracunaj81:
	CLRF        FARG_mod_c+0 
	CLRF        FARG_mod_c+1 
	CALL        _mod+0, 0
L_preracunaj29:
;LINIJA.c,64 :: 		if(U1==1 && U2==0 && U3==0 && U4==0 && U5==0){mod(4);}          //4 desno
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj121
	MOVLW       1
	XORWF       _U1+0, 0 
L__preracunaj121:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj32
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj122
	MOVLW       0
	XORWF       _U2+0, 0 
L__preracunaj122:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj32
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj123
	MOVLW       0
	XORWF       _U3+0, 0 
L__preracunaj123:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj32
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj124
	MOVLW       0
	XORWF       _U4+0, 0 
L__preracunaj124:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj32
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj125
	MOVLW       0
	XORWF       _U5+0, 0 
L__preracunaj125:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj32
L__preracunaj80:
	MOVLW       4
	MOVWF       FARG_mod_c+0 
	MOVLW       0
	MOVWF       FARG_mod_c+1 
	CALL        _mod+0, 0
L_preracunaj32:
;LINIJA.c,66 :: 		if(U1==1 && U2==1 && U3==0 && U4==0 && U5==0){mod(3);}          //3 desno
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj126
	MOVLW       1
	XORWF       _U1+0, 0 
L__preracunaj126:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj35
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj127
	MOVLW       1
	XORWF       _U2+0, 0 
L__preracunaj127:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj35
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj128
	MOVLW       0
	XORWF       _U3+0, 0 
L__preracunaj128:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj35
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj129
	MOVLW       0
	XORWF       _U4+0, 0 
L__preracunaj129:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj35
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj130
	MOVLW       0
	XORWF       _U5+0, 0 
L__preracunaj130:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj35
L__preracunaj79:
	MOVLW       3
	MOVWF       FARG_mod_c+0 
	MOVLW       0
	MOVWF       FARG_mod_c+1 
	CALL        _mod+0, 0
L_preracunaj35:
;LINIJA.c,68 :: 		if(U1==0 && U2==1 && U3==0 && U4==0 && U5==0){mod(2);}          //2 desno
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj131
	MOVLW       0
	XORWF       _U1+0, 0 
L__preracunaj131:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj38
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj132
	MOVLW       1
	XORWF       _U2+0, 0 
L__preracunaj132:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj38
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj133
	MOVLW       0
	XORWF       _U3+0, 0 
L__preracunaj133:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj38
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj134
	MOVLW       0
	XORWF       _U4+0, 0 
L__preracunaj134:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj38
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj135
	MOVLW       0
	XORWF       _U5+0, 0 
L__preracunaj135:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj38
L__preracunaj78:
	MOVLW       2
	MOVWF       FARG_mod_c+0 
	MOVLW       0
	MOVWF       FARG_mod_c+1 
	CALL        _mod+0, 0
L_preracunaj38:
;LINIJA.c,69 :: 		if(U1==1 && U2==1 && U3==1 && U4==0 && U5==0){mod(2);}
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj136
	MOVLW       1
	XORWF       _U1+0, 0 
L__preracunaj136:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj41
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj137
	MOVLW       1
	XORWF       _U2+0, 0 
L__preracunaj137:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj41
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj138
	MOVLW       1
	XORWF       _U3+0, 0 
L__preracunaj138:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj41
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj139
	MOVLW       0
	XORWF       _U4+0, 0 
L__preracunaj139:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj41
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj140
	MOVLW       0
	XORWF       _U5+0, 0 
L__preracunaj140:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj41
L__preracunaj77:
	MOVLW       2
	MOVWF       FARG_mod_c+0 
	MOVLW       0
	MOVWF       FARG_mod_c+1 
	CALL        _mod+0, 0
L_preracunaj41:
;LINIJA.c,71 :: 		if(U1==0 && U2==1 && U3==1 && U4==0 && U5==0){mod(1);}
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj141
	MOVLW       0
	XORWF       _U1+0, 0 
L__preracunaj141:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj44
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj142
	MOVLW       1
	XORWF       _U2+0, 0 
L__preracunaj142:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj44
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj143
	MOVLW       1
	XORWF       _U3+0, 0 
L__preracunaj143:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj44
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj144
	MOVLW       0
	XORWF       _U4+0, 0 
L__preracunaj144:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj44
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj145
	MOVLW       0
	XORWF       _U5+0, 0 
L__preracunaj145:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj44
L__preracunaj76:
	MOVLW       1
	MOVWF       FARG_mod_c+0 
	MOVLW       0
	MOVWF       FARG_mod_c+1 
	CALL        _mod+0, 0
L_preracunaj44:
;LINIJA.c,72 :: 		if(U1==1 && U2==1 && U3==1 && U4==1 && U5==0){mod(1);}          //1 desno
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj146
	MOVLW       1
	XORWF       _U1+0, 0 
L__preracunaj146:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj47
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj147
	MOVLW       1
	XORWF       _U2+0, 0 
L__preracunaj147:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj47
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj148
	MOVLW       1
	XORWF       _U3+0, 0 
L__preracunaj148:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj47
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj149
	MOVLW       1
	XORWF       _U4+0, 0 
L__preracunaj149:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj47
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj150
	MOVLW       0
	XORWF       _U5+0, 0 
L__preracunaj150:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj47
L__preracunaj75:
	MOVLW       1
	MOVWF       FARG_mod_c+0 
	MOVLW       0
	MOVWF       FARG_mod_c+1 
	CALL        _mod+0, 0
L_preracunaj47:
;LINIJA.c,74 :: 		if(U1==0 && U2==0 && U3==0 && U4==0 && U5==1){mod(-4);}          //4 levo
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj151
	MOVLW       0
	XORWF       _U1+0, 0 
L__preracunaj151:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj50
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj152
	MOVLW       0
	XORWF       _U2+0, 0 
L__preracunaj152:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj50
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj153
	MOVLW       0
	XORWF       _U3+0, 0 
L__preracunaj153:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj50
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj154
	MOVLW       0
	XORWF       _U4+0, 0 
L__preracunaj154:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj50
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj155
	MOVLW       1
	XORWF       _U5+0, 0 
L__preracunaj155:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj50
L__preracunaj74:
	MOVLW       252
	MOVWF       FARG_mod_c+0 
	MOVLW       255
	MOVWF       FARG_mod_c+1 
	CALL        _mod+0, 0
L_preracunaj50:
;LINIJA.c,76 :: 		if(U1==0 && U2==0 && U3==0 && U4==1 && U5==1){mod(-3);}          //3 levo
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj156
	MOVLW       0
	XORWF       _U1+0, 0 
L__preracunaj156:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj53
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj157
	MOVLW       0
	XORWF       _U2+0, 0 
L__preracunaj157:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj53
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj158
	MOVLW       0
	XORWF       _U3+0, 0 
L__preracunaj158:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj53
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj159
	MOVLW       1
	XORWF       _U4+0, 0 
L__preracunaj159:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj53
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj160
	MOVLW       1
	XORWF       _U5+0, 0 
L__preracunaj160:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj53
L__preracunaj73:
	MOVLW       253
	MOVWF       FARG_mod_c+0 
	MOVLW       255
	MOVWF       FARG_mod_c+1 
	CALL        _mod+0, 0
L_preracunaj53:
;LINIJA.c,78 :: 		if(U1==0 && U2==0 && U3==0 && U4==1 && U5==0){mod(-2);}          //2 levo
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj161
	MOVLW       0
	XORWF       _U1+0, 0 
L__preracunaj161:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj56
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj162
	MOVLW       0
	XORWF       _U2+0, 0 
L__preracunaj162:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj56
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj163
	MOVLW       0
	XORWF       _U3+0, 0 
L__preracunaj163:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj56
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj164
	MOVLW       1
	XORWF       _U4+0, 0 
L__preracunaj164:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj56
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj165
	MOVLW       0
	XORWF       _U5+0, 0 
L__preracunaj165:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj56
L__preracunaj72:
	MOVLW       254
	MOVWF       FARG_mod_c+0 
	MOVLW       255
	MOVWF       FARG_mod_c+1 
	CALL        _mod+0, 0
L_preracunaj56:
;LINIJA.c,79 :: 		if(U1==0 && U2==0 && U3==1 && U4==1 && U5==1){mod(-2);}
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj166
	MOVLW       0
	XORWF       _U1+0, 0 
L__preracunaj166:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj59
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj167
	MOVLW       0
	XORWF       _U2+0, 0 
L__preracunaj167:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj59
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj168
	MOVLW       1
	XORWF       _U3+0, 0 
L__preracunaj168:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj59
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj169
	MOVLW       1
	XORWF       _U4+0, 0 
L__preracunaj169:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj59
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj170
	MOVLW       1
	XORWF       _U5+0, 0 
L__preracunaj170:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj59
L__preracunaj71:
	MOVLW       254
	MOVWF       FARG_mod_c+0 
	MOVLW       255
	MOVWF       FARG_mod_c+1 
	CALL        _mod+0, 0
L_preracunaj59:
;LINIJA.c,81 :: 		if(U1==0 && U2==0 && U3==1 && U4==1 && U5==0){mod(-1);}          //1 levo
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj171
	MOVLW       0
	XORWF       _U1+0, 0 
L__preracunaj171:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj62
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj172
	MOVLW       0
	XORWF       _U2+0, 0 
L__preracunaj172:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj62
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj173
	MOVLW       1
	XORWF       _U3+0, 0 
L__preracunaj173:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj62
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj174
	MOVLW       1
	XORWF       _U4+0, 0 
L__preracunaj174:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj62
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj175
	MOVLW       0
	XORWF       _U5+0, 0 
L__preracunaj175:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj62
L__preracunaj70:
	MOVLW       255
	MOVWF       FARG_mod_c+0 
	MOVLW       255
	MOVWF       FARG_mod_c+1 
	CALL        _mod+0, 0
L_preracunaj62:
;LINIJA.c,82 :: 		if(U1==0 && U2==1 && U3==1 && U4==1 && U5==1){mod(-1);}
	MOVLW       0
	XORWF       _U1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj176
	MOVLW       0
	XORWF       _U1+0, 0 
L__preracunaj176:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj65
	MOVLW       0
	XORWF       _U2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj177
	MOVLW       1
	XORWF       _U2+0, 0 
L__preracunaj177:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj65
	MOVLW       0
	XORWF       _U3+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj178
	MOVLW       1
	XORWF       _U3+0, 0 
L__preracunaj178:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj65
	MOVLW       0
	XORWF       _U4+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj179
	MOVLW       1
	XORWF       _U4+0, 0 
L__preracunaj179:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj65
	MOVLW       0
	XORWF       _U5+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__preracunaj180
	MOVLW       1
	XORWF       _U5+0, 0 
L__preracunaj180:
	BTFSS       STATUS+0, 2 
	GOTO        L_preracunaj65
L__preracunaj69:
	MOVLW       255
	MOVWF       FARG_mod_c+0 
	MOVLW       255
	MOVWF       FARG_mod_c+1 
	CALL        _mod+0, 0
L_preracunaj65:
;LINIJA.c,83 :: 		}
L_end_preracunaj:
	RETURN      0
; end of _preracunaj

_all0:

;LINIJA.c,85 :: 		void all0 () { LATE=0x00;LATD=0x00;}   //port e i d na nulu
	CLRF        LATE+0 
	CLRF        LATD+0 
L_end_all0:
	RETURN      0
; end of _all0

_main:

;LINIJA.c,87 :: 		void main() {
;LINIJA.c,88 :: 		cal= 120;  //dal je crno il je belo
	MOVLW       120
	MOVWF       _cal+0 
	MOVLW       0
	MOVWF       _cal+1 
;LINIJA.c,90 :: 		ANSELA = 0x2F;             // Configure RA1 pin as analog         Jela sloncee <3
	MOVLW       47
	MOVWF       ANSELA+0 
;LINIJA.c,91 :: 		ANSELC = 0;                // Configure PORTC pins as digital
	CLRF        ANSELC+0 
;LINIJA.c,92 :: 		ANSELD = 0;                // Configure PORTD pins as digital
	CLRF        ANSELD+0 
;LINIJA.c,93 :: 		ANSELE = 0;
	CLRF        ANSELE+0 
;LINIJA.c,95 :: 		TRISA = 0x2F;              // Set RA1 pin as input
	MOVLW       47
	MOVWF       TRISA+0 
;LINIJA.c,96 :: 		TRISC = 0x00;              // Set PORTC as output
	CLRF        TRISC+0 
;LINIJA.c,97 :: 		TRISD = 0x00;
	CLRF        TRISD+0 
;LINIJA.c,98 :: 		TRISE = 0x00;
	CLRF        TRISE+0 
;LINIJA.c,100 :: 		LATA=0x00;
	CLRF        LATA+0 
;LINIJA.c,101 :: 		all0();
	CALL        _all0+0, 0
;LINIJA.c,109 :: 		while (1) {
L_main66:
;LINIJA.c,111 :: 		ridd();
	CALL        _ridd+0, 0
;LINIJA.c,112 :: 		preracunaj();
	CALL        _preracunaj+0, 0
;LINIJA.c,115 :: 		Delay_ms(10);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_main68:
	DECFSZ      R13, 1, 1
	BRA         L_main68
	DECFSZ      R12, 1, 1
	BRA         L_main68
	NOP
;LINIJA.c,116 :: 		all0();
	CALL        _all0+0, 0
;LINIJA.c,126 :: 		}
	GOTO        L_main66
;LINIJA.c,127 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
