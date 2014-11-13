#include "Arduino.h"
#include <SPI.h>
#include "nRF24L01.h"
#include "RF24.h"
#include "printf.h"

// Hardware configuration: Set up nRF24L01 radio on SPI bus plus pins 7 & 8 
RF24 radio(3,13);
                                                                           // Topology
byte addresses[][6] = {"1Node","2Node"};              // Radio pipe addresses for the 2 nodes to communicate.

unsigned char dmxData[3];
/*
void setup2() {
  Serial.begin(115200);
  pinMode(17, OUTPUT);
  printf_begin();
}
* */

#define LED 17
#define OUT 11

void setupReceive() {
  radio.openReadingPipe(1, addresses[0]);       // Open different pipes when writing. Write on pipe 0, address 0
  radio.startListening();
}

void uextPowerOn() {
  pinMode(8, OUTPUT);
  digitalWrite(8, LOW);
}

void setup(){
  uextPowerOn();
  pinMode(LED, OUTPUT);
  pinMode(OUT, OUTPUT);

  Serial.begin(115200);
  printf_begin();

  radio.begin();
  radio.setCRCLength(RF24_CRC_16);
  radio.setDataRate(RF24_1MBPS);
  radio.setAutoAck(0);
  radio.setRetries(0,0);
  radio.setPayloadSize(3);                
  radio.powerUp();
  radio.printDetails(); 
  setupReceive();
}

unsigned char c = 0;
void loop() {
  unsigned long time = micros();
  unsigned char pipeNo;
  while(radio.available(&pipeNo)){
    radio.read(dmxData, 3);
    printf("%d %d %d \r\n", dmxData[0], dmxData[1], dmxData[2]);
    digitalWrite(LED, !digitalRead(LED));
    analogWrite(OUT, dmxData[2]);
  }
}

