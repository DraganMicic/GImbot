
_VCNL_WrSingle:

;VCNL40x0.c,7 :: 		void VCNL_WrSingle(unsigned short wAddr, unsigned short wData) {
;VCNL40x0.c,10 :: 		I2C1_Start();
	CALL        _I2C1_Start+0, 0
;VCNL40x0.c,11 :: 		I2C1_Wr(VCNL40x0_ADDRESS);
	MOVLW       38
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;VCNL40x0.c,12 :: 		I2C1_Wr(wAddr);
	MOVF        FARG_VCNL_WrSingle_wAddr+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;VCNL40x0.c,13 :: 		I2C1_Wr(wData);
	MOVF        FARG_VCNL_WrSingle_wData+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;VCNL40x0.c,14 :: 		I2C1_Stop();
	CALL        _I2C1_Stop+0, 0
;VCNL40x0.c,15 :: 		}
L_end_VCNL_WrSingle:
	RETURN      0
; end of _VCNL_WrSingle

_VCNL_RdSingle:

;VCNL40x0.c,18 :: 		unsigned short VCNL_RdSingle(unsigned short rAddr) {
;VCNL40x0.c,20 :: 		I2C1_Start();
	CALL        _I2C1_Start+0, 0
;VCNL40x0.c,21 :: 		I2C1_Wr(VCNL40x0_ADDRESS);
	MOVLW       38
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;VCNL40x0.c,22 :: 		I2C1_Wr(rAddr);
	MOVF        FARG_VCNL_RdSingle_rAddr+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;VCNL40x0.c,23 :: 		I2C1_Repeated_Start();
	CALL        _I2C1_Repeated_Start+0, 0
;VCNL40x0.c,24 :: 		I2C1_Wr(VCNL40x0_ADDRESS + 1);
	MOVLW       39
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;VCNL40x0.c,25 :: 		data_[0] = I2C1_Rd(_I2C_NACK);
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       _data_+0 
;VCNL40x0.c,26 :: 		I2C1_Stop();
	CALL        _I2C1_Stop+0, 0
;VCNL40x0.c,28 :: 		return data_[0];
	MOVF        _data_+0, 0 
	MOVWF       R0 
;VCNL40x0.c,29 :: 		}
L_end_VCNL_RdSingle:
	RETURN      0
; end of _VCNL_RdSingle

_VCNL_RdSeq:

;VCNL40x0.c,35 :: 		unsigned long rLen) {
;VCNL40x0.c,38 :: 		I2C1_Start();
	CALL        _I2C1_Start+0, 0
;VCNL40x0.c,39 :: 		I2C1_Wr(VCNL40x0_ADDRESS);
	MOVLW       38
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;VCNL40x0.c,40 :: 		I2C1_Wr(rAddr);
	MOVF        FARG_VCNL_RdSeq_rAddr+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;VCNL40x0.c,41 :: 		I2C1_Repeated_Start();
	CALL        _I2C1_Repeated_Start+0, 0
;VCNL40x0.c,42 :: 		I2C1_Wr(VCNL40x0_ADDRESS + 1);
	MOVLW       39
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;VCNL40x0.c,43 :: 		for (i_loop = 0; i_loop < rLen - 1; i_loop++)
	CLRF        VCNL_RdSeq_i_loop_L0+0 
L_VCNL_RdSeq0:
	MOVF        FARG_VCNL_RdSeq_rLen+0, 0 
	MOVWF       R1 
	MOVF        FARG_VCNL_RdSeq_rLen+1, 0 
	MOVWF       R2 
	MOVF        FARG_VCNL_RdSeq_rLen+2, 0 
	MOVWF       R3 
	MOVF        FARG_VCNL_RdSeq_rLen+3, 0 
	MOVWF       R4 
	MOVLW       1
	SUBWF       R1, 1 
	MOVLW       0
	SUBWFB      R2, 1 
	SUBWFB      R3, 1 
	SUBWFB      R4, 1 
	MOVF        R4, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__VCNL_RdSeq9
	MOVF        R3, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__VCNL_RdSeq9
	MOVF        R2, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__VCNL_RdSeq9
	MOVF        R1, 0 
	SUBWF       VCNL_RdSeq_i_loop_L0+0, 0 
L__VCNL_RdSeq9:
	BTFSC       STATUS+0, 0 
	GOTO        L_VCNL_RdSeq1
;VCNL40x0.c,44 :: 		*rcvData++ = I2C1_Rd(_I2C_ACK);
	MOVLW       1
	MOVWF       FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVFF       FARG_VCNL_RdSeq_rcvData+0, FSR1
	MOVFF       FARG_VCNL_RdSeq_rcvData+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      FARG_VCNL_RdSeq_rcvData+0, 1 
	INCF        FARG_VCNL_RdSeq_rcvData+1, 1 
;VCNL40x0.c,43 :: 		for (i_loop = 0; i_loop < rLen - 1; i_loop++)
	INCF        VCNL_RdSeq_i_loop_L0+0, 1 
;VCNL40x0.c,44 :: 		*rcvData++ = I2C1_Rd(_I2C_ACK);
	GOTO        L_VCNL_RdSeq0
L_VCNL_RdSeq1:
;VCNL40x0.c,45 :: 		*rcvData = I2C1_Rd(_I2C_NACK);
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVFF       FARG_VCNL_RdSeq_rcvData+0, FSR1
	MOVFF       FARG_VCNL_RdSeq_rcvData+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;VCNL40x0.c,46 :: 		I2C1_Stop();
	CALL        _I2C1_Stop+0, 0
;VCNL40x0.c,47 :: 		}
L_end_VCNL_RdSeq:
	RETURN      0
; end of _VCNL_RdSeq

_VCNL_WrSeq:

;VCNL40x0.c,53 :: 		unsigned long rLen) {
;VCNL40x0.c,56 :: 		I2C1_Start();
	CALL        _I2C1_Start+0, 0
;VCNL40x0.c,57 :: 		I2C1_Wr(VCNL40x0_ADDRESS);
	MOVLW       38
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;VCNL40x0.c,58 :: 		I2C1_Wr(wAddr);
	MOVF        FARG_VCNL_WrSeq_wAddr+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;VCNL40x0.c,59 :: 		for (i_loop = 0; i_loop < rLen; i_loop++)
	CLRF        VCNL_WrSeq_i_loop_L0+0 
L_VCNL_WrSeq3:
	MOVF        FARG_VCNL_WrSeq_rLen+3, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__VCNL_WrSeq11
	MOVF        FARG_VCNL_WrSeq_rLen+2, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__VCNL_WrSeq11
	MOVF        FARG_VCNL_WrSeq_rLen+1, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__VCNL_WrSeq11
	MOVF        FARG_VCNL_WrSeq_rLen+0, 0 
	SUBWF       VCNL_WrSeq_i_loop_L0+0, 0 
L__VCNL_WrSeq11:
	BTFSC       STATUS+0, 0 
	GOTO        L_VCNL_WrSeq4
;VCNL40x0.c,60 :: 		I2C1_Wr(*wrData);
	MOVFF       FARG_VCNL_WrSeq_wrData+0, FSR0
	MOVFF       FARG_VCNL_WrSeq_wrData+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;VCNL40x0.c,59 :: 		for (i_loop = 0; i_loop < rLen; i_loop++)
	INCF        VCNL_WrSeq_i_loop_L0+0, 1 
;VCNL40x0.c,60 :: 		I2C1_Wr(*wrData);
	GOTO        L_VCNL_WrSeq3
L_VCNL_WrSeq4:
;VCNL40x0.c,61 :: 		I2C1_Stop();
	CALL        _I2C1_Stop+0, 0
;VCNL40x0.c,62 :: 		}
L_end_VCNL_WrSeq:
	RETURN      0
; end of _VCNL_WrSeq
