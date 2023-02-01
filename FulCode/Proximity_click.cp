#line 1 "R:/GIMBOT/Gimbot final code/EasyPIC v7 - PIC18F45K22/Proximity_click.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/built_in.h"
#line 1 "r:/gimbot/gimbot final code/easypic v7 - pic18f45k22/vcnl40x0.h"
#line 92 "r:/gimbot/gimbot final code/easypic v7 - pic18f45k22/vcnl40x0.h"
extern unsigned short data_[16];
extern unsigned short rcvData[16];

extern void VCNL_WrSingle(unsigned short wAddr, unsigned short wData);
extern unsigned short VCNL_RdSingle(unsigned short rAddr);
extern void VCNL_RdSeq(unsigned short rAddr, unsigned char *rcvData, unsigned long rLen);
extern void void VCNL_WrSeq(unsigned short wAddr, unsigned char *wrData, unsigned long rLen);
#line 5 "R:/GIMBOT/Gimbot final code/EasyPIC v7 - PIC18F45K22/Proximity_click.c"
unsigned char i_loop;
unsigned char Command;
unsigned int ProxiValue;
unsigned int AverageProxiValue;
unsigned int AmbiValue;
unsigned long int SummProxiValue;
unsigned char InterruptStatus;
unsigned char LoByte, HiByte;
char temp_text[7];


int U3R;
int U3;
int U2R;
int U2;
int U1R;
int U1;
int U4R;
int U4;
int U5R;
int U5;

int cal;

float cnt1;
float cnt2;
float cnt3;

int a1;
int a2;
int c1;
int c2;

int ab;
int last;

int trept;

void interrupt() {
 if (TMR0IF_bit) {

 cnt1=cnt1+1;
 cnt2=cnt2+1;
 cnt3=cnt3+1;

 TMR0IF_bit = 0;
 TMR0L = 0;
 }
}

void pwm1(int t1up, int t1down){
 if(cnt1<=t1up){LATB5_bit=1;}
 if(cnt1>=t1up&&cnt1<=t1up+t1down){LATB5_bit=0;}
 if(cnt1>=t1up+t1down){cnt1=0;}

}
void pwm2(int t2up, int t2down){
 if(cnt2<=t2up){LATB6_bit=1;}
 if(cnt2>=t2up&&cnt2<=t2up+t2down){LATB6_bit=0;}
 if(cnt2>=t2up+t2down){cnt2=0;}

}
void mod(int c) {

 switch(c){
 case 4: a1=2;a2=60;c1=18;c2=45; break;

 case 3: a1=8;a2=50;c1=17;c2=30; break;

 case 2: a1=10;a2=50;c1=17;c2=30; break;

 case 1: a1=12;a2=50;c1=17;c2=30; break;

 case 0: a1=13;a2=45;c1=13;c2=45; break;

 case -1: a1=17;a2=30;c1=12;c2=50; break;

 case -2: a1=17;a2=30;c1=10;c2=50; break;

 case -3: a1=17;a2=30;c1=8;c2=50; break;

 case -4: a1=18;a2=45;c1=2;c2=60; break;
 }
}

void ridd (){

 U5R = ADC_Read(4);
 U4R = ADC_Read(3);
 U3R = ADC_Read(2);
 U2R = ADC_Read(1);
 U1R = ADC_Read(0);

 if (U1R > cal){U1 = 1;}
 if (U1R < cal){U1 = 0;}

 if (U2R > cal){U2 = 1;}
 if (U2R < cal){U2 = 0;}

 if (U3R > cal){U3 = 1;}
 if (U3R < cal){U3 = 0;}

 if (U4R > cal){U4 = 1;}
 if (U4R < cal){U4 = 0;}

 if (U5R > cal){U5 = 1;}
 if (U5R < cal){U5 = 0;}
}

calculate (){

 if(U1==1 && U2==1 && U3==1 && U4==1 && U5==1){mod(0);last=0;}
 if(U1==0 && U2==0 && U3==1 && U4==0 && U5==0){mod(0);last=0;}
 if(U1==0 && U2==1 && U3==1 && U4==1 && U5==0){mod(0);last=0;}

 if(U1==1 && U2==0 && U3==0 && U4==0 && U5==0){mod(4);last=4;}

 if(U1==1 && U2==1 && U3==0 && U4==0 && U5==0){mod(4);last=3;}

 if(U1==0 && U2==1 && U3==0 && U4==0 && U5==0){mod(4);last=2;}
 if(U1==1 && U2==1 && U3==1 && U4==0 && U5==0){mod(4);last=2;}

 if(U1==0 && U2==1 && U3==1 && U4==0 && U5==0){mod(4);last=1;}
 if(U1==1 && U2==1 && U3==1 && U4==1 && U5==0){mod(4);last=1;}

 if(U1==0 && U2==0 && U3==0 && U4==0 && U5==1){mod(-4);last=-4;}

 if(U1==0 && U2==0 && U3==0 && U4==1 && U5==1){mod(-4);last=-3;}

 if(U1==0 && U2==0 && U3==0 && U4==1 && U5==0){mod(-4);last=-2;}
 if(U1==0 && U2==0 && U3==1 && U4==1 && U5==1){mod(-4);last=-2;}

 if(U1==0 && U2==0 && U3==1 && U4==1 && U5==0){mod(-4);last=-1;}
 if(U1==0 && U2==1 && U3==1 && U4==1 && U5==1){mod(-4);last=-1;}

 if(U1==0 && U2==0 && U3==0 && U4==0 && U5==0 && last==-4){mod(-4);}
 if(U1==0 && U2==0 && U3==0 && U4==0 && U5==0 && last==4){mod(4);}


}


void VCNL_Set_default_Mode(){

 ByteToStr(VCNL_RdSingle( (0x81) ),temp_text);
 VCNL_WrSingle( (0x83) , 20);
 ByteToStr(VCNL_RdSingle( (0x83) ),temp_text);
 VCNL_WrSingle( (0x82) ,  (0x04) );
 ByteToStr(VCNL_RdSingle( (0x82) ), temp_text);
 VCNL_WrSingle( (0x80) ,  (0x02)  |  (0x04)  |  (0x01) );
 ByteToStr(VCNL_RdSingle( (0x80) ), temp_text);
 VCNL_WrSingle( (0x89) ,  (0x00)  |  (0x02)  |  (0x00) );
 ByteToStr(VCNL_RdSingle( (0x89) ), temp_text);
 VCNL_WrSingle( (0x84) ,  (0x05)  |  (0x08)  |  (0x10) );
 ByteToStr(VCNL_RdSingle( (0x84) ), temp_text);
 }

void main() {

 cal= 300;

 cnt1 = 0;
 cnt2 = 0;
 cnt3 = 0;

 ab=0;

 a1=100;
 a2=100;
 c1=100;
 c2=100;

 trept=0;

 ANSELA = 0x2F;
 TRISA = 0x2F;
 LATA = 0x00;

 ANSELB = 0;
 TRISB = 0;
 TRISB0_bit = 1;

 ANSELC = 0;
 TRISC = 0;
 LATC = 0x00;
 TRISC0_BIT=1;

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

 I2C1_Init(100000);
 I2C1_Stop();

 VCNL_Set_default_Mode();



 SummProxiValue = 0;
 for (i_loop = 0; i_loop < 16; i_loop++) {
 do {
 Command = VCNL_RdSingle( (0x80) );
 } while (!(Command &  (0x20) ));
 VCNL_RdSeq( (0x87) , &data_, 2);
 ProxiValue = (data_[0] << 8) | data_[1];
 SummProxiValue += ProxiValue;
 }
 AverageProxiValue = SummProxiValue / 16;

 LoByte = (unsigned char)((AverageProxiValue + 20) & 0x00FF);
 HiByte = (unsigned char)(((AverageProxiValue + 20) & 0xFF00) >> 8);
 VCNL_WrSingle( (0x8c) , HiByte);
 VCNL_WrSingle( (0x8c)  + 1, LoByte);
 WordToStr(AverageProxiValue + 20, temp_text);


 LATB = 0x00;

 Delay_ms(50);

 LATD0_bit=0;
 LATD1_bit=0;
 LATD3_bit=0;
 LATD5_bit=0;

 while (1) {

 ridd();
 calculate();

 if(ab==0){

 pwm1(c1,c2);
 pwm2(a1,a2);

 }
 else{
 pwm1(2,80);
 pwm2(2,80);
 }

 do{
 Command = VCNL_RdSingle( (0x80) );
 }while (!(Command & ( (0x20)  |  (0x40) )));


 InterruptStatus = VCNL_RdSingle( (0x8e) );

 if(InterruptStatus &  (0x01) ){
 VCNL_WrSingle( (0x8e) , InterruptStatus);
 }


 if(Command &  (0x20) ){

 VCNL_RdSeq( (0x87) , &data_, 2);
 ProxiValue = (data_[0] << 8) | data_[1];

 WordToStr(ProxiValue, temp_text);



 if(ProxiValue < (AverageProxiValue + 50)){
 LATB2_bit=1;
 LATD2_bit=0;
 } ab=0;
 if((ProxiValue > (AverageProxiValue + 50))) {
 LATB2_bit=0;
 LATD2_bit=1;
 ab=1;
 }
 }
 if(cnt3>700&trept==0){LATB1_bit=1;cnt3=0;trept=trept+1;}
 if(cnt3>700&trept==1){LATB1_bit=0;cnt3=0;trept=trept+1;}
 if(trept==2){trept=0;}


 }


 }
