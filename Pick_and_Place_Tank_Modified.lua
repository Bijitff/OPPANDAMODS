/*
 * This Code is writen and tested By Ravi Ranjan
 * m1 left motor & m2 right motor
 * m3 pick and place motor & m4 hold and Unhold motor
 * Bluetooth Module: Rx pin at Servo 1 and Tx pin at servo 2
 * 
 * Commands :
 * F=Forward Move
 * B=Backward Move
 * L=Left turn
 * R=right Turn
 * S=Stop
 * P=Pick up
 * Q=Place Down
 * H=Hold
 * I=Unhold
*/
#include <SoftwareSerial.h>
SoftwareSerial bluetoothSerial(9, 10); // RX, TX (Arduino)[Servo1,Servo2]

#include <AFMotor.h>
AF_DCMotor motor1(1);
AF_DCMotor motor2(2);
AF_DCMotor motor3(3);
AF_DCMotor motor4(4);
int Speed=255;
int state;
unsigned long timer0;
unsigned long timer1 = 0;
char prevCommand='S';
int flag=0;

void setup() {
  bluetoothSerial.begin(9600);
  Serial.begin(9600);           // set up Serial library at 9600 bps
  motor1.setSpeed(Speed);
  motor2.setSpeed(Speed);
  motor3.setSpeed(Speed);
  motor4.setSpeed(Speed);
  motor1.run(RELEASE);
  motor2.run(RELEASE);
  motor3.run(RELEASE);
  motor4.run(RELEASE);
}

void loop() {
  if(bluetoothSerial.available() > 0 || Serial.available()>0){
    timer1=millis();
    prevCommand=state;
    if(bluetoothSerial.available() > 0 ) state = bluetoothSerial.read();
    else state = Serial.read();
    
    if(state!=prevCommand){
      if (state == 'F')           moveForward();
      else if (state == 'B')      moveBackward();
      else if (state == 'L')      leftTurn();
      else if (state == 'R')      rightTurn();
      else if (state == 'S')      allStop();
      else if (state == 'P')      pick();
      else if (state == 'Q')      place();
      else if (state == 'H')      hold();
      else if (state == 'I')      unHold();
      flag=0;
    }
  }
  else{
    timer0 = millis();
    if((timer0 - timer1)>500)   
    if(flag==0)
    {
      allStop();
      flag=1;
    }
  }
}

void moveForward(){
  motor1.run(FORWARD);
  motor2.run(FORWARD);
  Serial.println("Go Forward");
}
void moveBackward(){
  motor1.run(BACKWARD);
  motor2.run(BACKWARD);
  Serial.println("Go BACKWARD");
}

void leftTurn(){
  motor1.run(BACKWARD);
  motor2.run(FORWARD);
  Serial.println("Go LEFT");
}

void rightTurn(){
  motor1.run(FORWARD);
  motor2.run(BACKWARD);
  Serial.println("Go RIGHT");
}

void allStop(){
  motor1.run(RELEASE);
  motor2.run(RELEASE);
  motor3.run(RELEASE);
  motor4.run(RELEASE);
  Serial.println("STOP!");
}
void pick(){
  motor3.run(FORWARD);
  Serial.println("Pick");
}

void place(){
  motor3.run(BACKWARD);
  Serial.println("Place");
}

void hold(){
  motor4.run(FORWARD);
  Serial.println("HOLD");
}

void unHold(){
  motor4.run(BACKWARD);
  Serial.println("UNHOLD");
}
