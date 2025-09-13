#include <Wire.h>
#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27, 16, 2); // I2C address alag bhi ho sakta hai (0x3F try karein agar na chale)

void setup() {
  lcd.init();
  lcd.backlight();
  lcd.setCursor(0, 0);  
  lcd.print("Hello Rahul"); // Apna name likho
  lcd.setCursor(0, 1);
  lcd.print("Arduino LCD");
}

void loop() {
  // Kuch nahi karna
}