//Measure voltage across the silicon diode
int Vpin = A1;     

//Declare required variables
float voltage; 
float V1; 
float V2;
float V3;
float T;

//Recommended calibration temperatures in Kelvin scale
//These temperatures can change to the user's preference
float T1 = 77;
float T2 = 297.15;     

void setup() {
//Load serial monitor
  Serial.begin (9600);

}

void loop() {
  if(Serial.available()){
    char val = Serial.read();

//Save the first calibration voltage when CALIBRATION_1 button is pressed
    while(val == 'a'){
      voltage=analogRead(Vpin);
      V1 = voltage/1023*5.00;
      val = 'd';
      }

//Save the second calibration voltage when CALIBRATION_2 button is pressed
    while(val == 'b'){
      voltage=analogRead(Vpin);
      V2 = voltage/1023*5.00;
      val = 'd';
      }
      
//Calculate temperature when MEASURE_TEMPERTURE button is pressed
    while(val == 'c'){
      voltage=analogRead(Vpin);
      V3 = voltage/1023*5.00;
      T = ((T2-T1)/(V2-V1))*V3 + T2 - ((T2-T1)/(V2-V1))*V2;
      Serial.println(T);
      val = 'd';
      }
    }

}
