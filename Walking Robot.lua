#include <Servo.h>

// Create servo objects for each leg
Servo frontLeftLeg;
Servo frontRightLeg;
Servo backLeftLeg;
Servo backRightLeg;

// Define servo pin connections
const int frontLeftPin = 3;
const int frontRightPin = 5;
const int backLeftPin = 6;
const int backRightPin = 9;

// Define movement angles
int forwardAngle = 45;
int backwardAngle = 135;
int restAngle = 90;

void setup() {
  // Attach servos to pins
  frontLeftLeg.attach(frontLeftPin);
  frontRightLeg.attach(frontRightPin);
  backLeftLeg.attach(backLeftPin);
  backRightLeg.attach(backRightPin);

  // Set initial positions to the resting angle
  frontLeftLeg.write(restAngle);
  frontRightLeg.write(restAngle);
  backLeftLeg.write(restAngle);
  backRightLeg.write(restAngle);

  delay(1000); // Wait for the servos to stabilize
}

void loop() {
  // Step 1: Move front-left and back-right legs forward
  frontLeftLeg.write(forwardAngle);
  backRightLeg.write(forwardAngle);
  delay(500);

  // Step 2: Move front-right and back-left legs backward
  frontRightLeg.write(backwardAngle);
  backLeftLeg.write(backwardAngle);
  delay(500);

  // Step 3: Move front-left and back-right legs backward
  frontLeftLeg.write(backwardAngle);
  backRightLeg.write(backwardAngle);
  delay(500);

  // Step 4: Move front-right and back-left legs forward
  frontRightLeg.write(forwardAngle);
  backLeftLeg.write(forwardAngle);
  delay(500);

  // Reset to resting position
  frontLeftLeg.write(restAngle);
  frontRightLeg.write(restAngle);
  backLeftLeg.write(restAngle);
  backRightLeg.write(restAngle);
  delay(500);
}