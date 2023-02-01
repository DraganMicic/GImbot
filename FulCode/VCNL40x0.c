#include "VCNL40x0.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////////////

unsigned short data_[16];

//--------------- Writes data to VCNL40x0 - signle location
void VCNL_WrSingle(unsigned short wAddr, unsigned short wData) {

  // issue I2C start signal
  I2C1_Start();
  I2C1_Wr(VCNL40x0_ADDRESS);
  I2C1_Wr(wAddr);
  I2C1_Wr(wData);
  I2C1_Stop();
}

//--------------- Reads data from VCNL40x0 - single location (random)
unsigned short VCNL_RdSingle(unsigned short rAddr) {

  I2C1_Start();
  I2C1_Wr(VCNL40x0_ADDRESS);
  I2C1_Wr(rAddr);
  I2C1_Repeated_Start();
  I2C1_Wr(VCNL40x0_ADDRESS + 1);
  data_[0] = I2C1_Rd(_I2C_NACK);
  I2C1_Stop();

  return data_[0];
}

//--------------- Reads data from VCNL40x0 - sequential read

void VCNL_RdSeq(unsigned short rAddr,
                        unsigned char *rcvData,
                        unsigned long rLen) {
char i_loop;

  I2C1_Start();
  I2C1_Wr(VCNL40x0_ADDRESS);
  I2C1_Wr(rAddr);
  I2C1_Repeated_Start();
  I2C1_Wr(VCNL40x0_ADDRESS + 1);
  for (i_loop = 0; i_loop < rLen - 1; i_loop++)
    *rcvData++ = I2C1_Rd(_I2C_ACK);
  *rcvData = I2C1_Rd(_I2C_NACK);
  I2C1_Stop();
}

//--------------- Writes data to VCNL40x0 - sequential read

void VCNL_WrSeq(unsigned short wAddr,
                        unsigned char *wrData,
                        unsigned long rLen) {
  unsigned short i_loop;
  
  I2C1_Start();
  I2C1_Wr(VCNL40x0_ADDRESS);
  I2C1_Wr(wAddr);
  for (i_loop = 0; i_loop < rLen; i_loop++)
    I2C1_Wr(*wrData);
  I2C1_Stop();
}