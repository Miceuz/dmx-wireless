#include "Arduino.h"
#include <SPI.h>
#include "nRF24L01.h"
#include "RF24.h"
#include "logvalues.h"
#include <avr/pgmspace.h>	// include program space (for PROGMEM)
#include "Conceptinetics.h"

#define DMX_START_ADDRESS 97
#define DMX_SLAVE_CHANNELS   3 

#define LED 6

void OnFrameReceiveComplete (unsigned short channelsReceived);

DMX_Slave dmx_slave ( DMX_SLAVE_CHANNELS );

RF24 radio(9,10);
byte addresses[][6] = {"1Node"};

unsigned char dmxData[3];

void setupTransmit() {
      radio.openWritingPipe(addresses[0]);       // Open different pipes when writing. Write on pipe 0, address 0
}

void setup(){
  pinMode(LED, OUTPUT);
  pinMode(7, OUTPUT);
  digitalWrite(7, LOW);

  radio.begin();
  radio.setCRCLength(RF24_CRC_16);
  radio.setDataRate(RF24_1MBPS);
  radio.setAutoAck(0);
  radio.setRetries(0,0);
  radio.setPayloadSize(3);                
  radio.powerUp();
  setupTransmit();

  digitalWrite(LED, HIGH);
  delay(1000);
  digitalWrite(LED, LOW);

  dmx_slave.enable ();  
  dmx_slave.setStartAddress (DMX_START_ADDRESS);
  dmx_slave.onReceiveComplete ( OnFrameReceiveComplete );
  
}

unsigned char payload = 1;
char change = 1;
void updatePayload() {
  unsigned char t = pgm_read_byte(&logValues[255-payload]);
  dmxData[0] = t;
  dmxData[1] = t;
  dmxData[2] = t;
  if(payload > 254 || payload < 1) {
    change = change * -1;
  }
  payload += change;
}

void transmitDmxData() {
  //byte txok = 
  radio.write(&dmxData, 12, 1);
  //byte standbyok = 
  radio.txStandBy();
}

void loop() {
}

void OnFrameReceiveComplete (unsigned short channelsReceived) {
  if ( channelsReceived == DMX_SLAVE_CHANNELS) {
    dmxData[0] = pgm_read_byte(&logValues[dmx_slave.getChannelValue(1)]);
    dmxData[1] = pgm_read_byte(&logValues[dmx_slave.getChannelValue(2)]); 
    dmxData[2] = pgm_read_byte(&logValues[dmx_slave.getChannelValue(3)]);
    transmitDmxData();
    
    digitalWrite(LED, !digitalRead(LED));
  } else {
  }
}
