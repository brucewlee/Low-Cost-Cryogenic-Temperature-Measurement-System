//Setting up
import controlP5.*; 
import processing.serial.*;
String m_="";
String m_2="";
String c_1="";
String c_2="";
Serial port;

//create cp5 object
ControlP5 cp5; 
PFont font;
PFont font2;

void setup (){ 
//Setting the window size and ports
  size(2000,1000); 
  printArray(Serial.list()); 
  port = new Serial(this, "COM13", 9600);
  port.bufferUntil('\n');

//Setting "CALIBRATION_1", "CALIBRATION_2", "MEASURE_TEMPERATURE" buttons
  cp5 = new ControlP5(this);
  font = createFont("times new roman bold", 50);
  font2 = createFont("times new roman bold", 80);
  cp5.addButton("calibration_1")
     .setPosition(100,200)
     .setSize(700,200)
     .setFont(font)
  ; 
  cp5.addButton("calibration_2")
     .setPosition(100,600)
     .setSize(700,200)
     .setFont(font)
  ;  
  cp5.addButton("measure_temperature")
     .setPosition(1100,200)
     .setSize(800,300)
     .setFont(font)
  ;
}

void draw (){
//Setting the window's background color and label
  background(230,230,230); 
  fill(0,0,0); 
  textFont(font2);
  text("Low-Cost Cryogenic Temperature Measurement Panel",50,100); 
  textFont(font);
 
//Setting location to show "complete" message and measured temperature
  text(c_1, 100, 500);
  text(c_2, 100, 900);
  text("Measured Temperature:", 1100, 700);
  text(m_2, 1650, 700);
}

//Defining "CALIBRATION_1" function
void calibration_1(){
  port.write("a");
  c_1 = "complete";

}

//Defining "CALIBRATION_2" function
void calibration_2(){
  port.write("b");
  c_2 = "complete";
    }

//Defining "MEASURE_TEMPERATURE" function
void measure_temperature(){
  m_="";
  m_2="";
  port.write("c");
  while(port.available()>0){
    m_ = port.readStringUntil('\n');
    m_2 =  m_ + "K";
    }
}
