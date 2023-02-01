#line 1 "R:/GIMBOT/Gimbot final code/EasyPIC v7 - PIC18F45K22/VCNL40x0.c"
#line 1 "r:/gimbot/gimbot final code/easypic v7 - pic18f45k22/vcnl40x0.h"
#line 92 "r:/gimbot/gimbot final code/easypic v7 - pic18f45k22/vcnl40x0.h"
extern unsigned short data_[16];
extern unsigned short rcvData[16];

extern void VCNL_WrSingle(unsigned short wAddr, unsigned short wData);
extern unsigned short VCNL_RdSingle(unsigned short rAddr);
extern void VCNL_RdSeq(unsigned short rAddr, unsigned char *rcvData, unsigned long rLen);
extern void void VCNL_WrSeq(unsigned short wAddr, unsigned char *wrData, unsigned long rLen);
#line 4 "R:/GIMBOT/Gimbot final code/EasyPIC v7 - PIC18F45K22/VCNL40x0.c"
unsigned short data_[16];


void VCNL_WrSingle(unsigned short wAddr, unsigned short wData) {


 I2C1_Start();
 I2C1_Wr( 0x26 );
 I2C1_Wr(wAddr);
 I2C1_Wr(wData);
 I2C1_Stop();
}


unsigned short VCNL_RdSingle(unsigned short rAddr) {

 I2C1_Start();
 I2C1_Wr( 0x26 );
 I2C1_Wr(rAddr);
 I2C1_Repeated_Start();
 I2C1_Wr( 0x26  + 1);
 data_[0] = I2C1_Rd(_I2C_NACK);
 I2C1_Stop();

 return data_[0];
}



void VCNL_RdSeq(unsigned short rAddr,
 unsigned char *rcvData,
 unsigned long rLen) {
char i_loop;

 I2C1_Start();
 I2C1_Wr( 0x26 );
 I2C1_Wr(rAddr);
 I2C1_Repeated_Start();
 I2C1_Wr( 0x26  + 1);
 for (i_loop = 0; i_loop < rLen - 1; i_loop++)
 *rcvData++ = I2C1_Rd(_I2C_ACK);
 *rcvData = I2C1_Rd(_I2C_NACK);
 I2C1_Stop();
}



void VCNL_WrSeq(unsigned short wAddr,
 unsigned char *wrData,
 unsigned long rLen) {
 unsigned short i_loop;

 I2C1_Start();
 I2C1_Wr( 0x26 );
 I2C1_Wr(wAddr);
 for (i_loop = 0; i_loop < rLen; i_loop++)
 I2C1_Wr(*wrData);
 I2C1_Stop();
}
