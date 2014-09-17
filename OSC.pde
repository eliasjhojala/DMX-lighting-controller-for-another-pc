//Tässä välilehdessä luetaan iPadilta touchOSC-ohjelman inputti

void oscEvent(OscMessage theOscMessage){
  String addr = theOscMessage.addrPattern();
  int val = theOscMessage.get(0).intValue();

 dim[int(addr)] = round(val);
 
 println(addr + " : " + val);

}
