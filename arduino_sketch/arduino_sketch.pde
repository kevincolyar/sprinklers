int incomingByte = 0;

void setup()
{
  Serial.begin(9600);
  delay(1000);
  pinMode(2, OUTPUT);    
  pinMode(3, OUTPUT);
  pinMode(4, OUTPUT);
  pinMode(5, OUTPUT);
  pinMode(6, OUTPUT);
  pinMode(7, OUTPUT);
  pinMode(8, OUTPUT);
  pinMode(9, OUTPUT);
}

void loop()
{
  if (Serial.available() > 0) {
    // get incoming byte:
    incomingByte = Serial.read();
    
    if(incomingByte > 10)
      digitalWrite(incomingByte-10, LOW);
    
    if(incomingByte < 10)    
      digitalWrite(incomingByte, HIGH);
     
  }
  
}
