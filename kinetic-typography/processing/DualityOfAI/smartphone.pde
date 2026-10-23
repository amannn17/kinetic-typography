// YOUR SETTINGS
float correctionCompass = 577;
int microMax = -55;
/////////////////

float accelX;
float accelY;
float accelZ;
float gravityX;
float gravityY;
float gravityZ;
float compass;
float touchForce;
int proximity;

float micro;
float microMean;
float microMeanCorrection;

int tailleTriangle = 50;

float posX;
float posY;

String myID;

void setupSmartphone(){
  
  // L'adresse de mon sketch
  oscP5 = new OscP5(this,9000); // 9000 correspond au port OSC utilisé. Il doit être identique au port indiqué dans le logiciel Osculator (osc.udp://localhost:12000)
  myID = "amansiphone";
  
}






/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());  



  // GRAVITY / ORIENTATION
  if (theOscMessage.checkAddrPattern("/ZIGSIM/"+myID+"/gravity")==true) {
    gravityX = theOscMessage.get(0).floatValue();    
    gravityY = theOscMessage.get(1).floatValue();    
    gravityZ = theOscMessage.get(2).floatValue();  
    return;   
  } 
  
  
  //// ACCELERATION
  //if (theOscMessage.checkAddrPattern("/ZIGSIM/"+myID+"/accel")==true) {
  //  accelX = theOscMessage.get(0).floatValue();    
  //  accelY = theOscMessage.get(1).floatValue();    
  //  accelZ = theOscMessage.get(2).floatValue();  
  //  return;   
  //} 
  
  if (theOscMessage.checkAddrPattern("/ZIGSIM/amansiphone/compass")==true) {
    compass = theOscMessage.get(0).floatValue();  
    //correctionCompass = mouseY;     // only for compass' calibration
    println("mouseY = " + mouseY);      // only for compass' calibration
    compass = compass + correctionCompass;
    return;   
  } 

  // PROXIMITY
  if (theOscMessage.checkAddrPattern("/ZIGSIM/"+myID+"/proximitymonitor")==true) {
    proximity = theOscMessage.get(0).intValue();     
    return;   
  } 
  
  // TOUCH FORCE
  //if (theOscMessage.checkAddrPattern("/ZIGSIM/"+myID+"/touchforce0")==true) {
  //  touchForce = theOscMessage.get(0).floatValue();         
  //  return;   
  //} 
  
  // MICROPHONE
  if (theOscMessage.checkAddrPattern("/ZIGSIM/"+myID+"/miclevel")==true) {
    micro = theOscMessage.get(0).floatValue();     
    microMean = theOscMessage.get(1).floatValue();
    microMeanCorrection = map(microMean,-40,-6,0,10);
    return;   
  } 
  
}
