void dmxCheck() {
  if(useCOM == true) {
   while (myPort.available() > 0) {  
    if (cycleStart == true) {
      if (counter <= 6+enttecDMXchannels) {
        int inBuffer = myPort.read(); 
        vals[counter] = inBuffer;
        counter++;
      } 
      else {
          cycleStart = false;
      }
    } 
    else {
      for(int i = 0; i <= 5; i++) {
        if(vals[i] == check[i]) {
          if(error == false) {
            error = false;
          }
        }
        else {
        }
      }
      
      
      if(error == false) {
            for(int i = 6; i < 12; i++) {
              ch[i - 5] = vals[i];
              
            }
            counter = 0;
            cycleStart = true;
            
      }
     } 
  }
  
  
  }
}
void dmxToDim() {
  for(int i = 1; i < 13; i++) {
    if(chase == true || play == true) {
    if(ch[i] == 0) { } else {
      enttecDMXchannel[i] = ch[i];
    }
    }
    else {
      enttecDMXchannel[i] = ch[i];
    }
  }
  channelsToDim();
}
void channelsToDim() { 
  
  
  for(int i = 1; i <= controlP5channels; i++) {
    if(controlP5channelOld[i] != controlP5channel[i]) {
      allChannels[controlP5place][i] = controlP5channel[i];
    }
  }
  for(int i = 1; i <= enttecDMXchannels; i++) {
    if(enttecDMXchannelOld[i] != enttecDMXchannel[i]) {
      allChannels[enttecDMXplace][i] = enttecDMXchannel[i];
    }
  }
  for(int i = 1; i <= touchOSCchannels; i++) {
    if(touchOSCchannelOld[i] != touchOSCchannel[i]) {
     if(i > 48) {
       allChannels[touchOSCplace+4][i-48] = touchOSCchannel[i];
     }     
     else if(i > 36) {
          allChannels[touchOSCplace+3][i-36] = touchOSCchannel[i];
      }
      else if(i > 24) {
          allChannels[touchOSCplace+2][i-24] = touchOSCchannel[i];
      }
      else if(i > 12) {
          allChannels[touchOSCplace+1][i-12] = touchOSCchannel[i];
      }
      else {
        allChannels[touchOSCplace][i] = touchOSCchannel[i];
      }
    }
  }
  
  
   for(int i = 1; i < 13; i++) {
    if(allChannels[1][i] < 5) {
      allChannels[1][i] = 0;
    }
    if(allChannels[2][i] < 5) {
      allChannels[2][i] = 0;
    }
    if(allChannels[3][i] < 5) {
      allChannels[3][i] = 0;
    }
    if(allChannels[4][i] < 5) {
      allChannels[4][i] = 0;
    }
    if(allChannels[5][i] < 5) {
      allChannels[5][i] = 0;
    }
  }

    
  for(int i = 1; i < 13; i++) {
    if(allChannelsOld[1][i] != allChannels[1][i]) {
      dim[i] = round(map(allChannels[1][i], 0, 255, 0, fixtureMasterValue));
    }
    if(allChannelsOld[2][i] != allChannels[2][i]) {
      dim[i+12] = round(map(allChannels[2][i], 0, 255, 0, fixtureMasterValue));
    }
    if(allChannelsOld[5][i] != allChannels[5][i]) {
      if(useMemories == true) {
        memory(i+memoryMenu, round(map(allChannels[5][i], 0, 255, 0, memoryMasterValue)));
        memoryValue[i+memoryMenu] = round(map(allChannels[5][i], 0, 255, 0, memoryMasterValue));

      }
    }
    if(allChannelsOld[3][i] != allChannels[3][i]) {
      if(useMemories == true) {
        memory(i, round(map(allChannels[3][i], 0, 255, 0, memoryMasterValue)));
        memoryValue[i] = round(map(allChannels[3][i], 0, 255, 0, memoryMasterValue));

      }
      else {
        dim[i+12+12] = allChannels[3][i];
      }
    }
    
    if(allChannelsOld[4][i] != allChannels[4][i]) {
      if(useMemories == true) {
        memory(i+12, round(map(allChannels[4][i], 0, 255, 0, memoryMasterValue)));
        memoryValue[i+12] = round(map(allChannels[4][i], 0, 255, 0, memoryMasterValue));
      }
      else {
        dim[i+12+12] = allChannels[4][i];
      }
    }
  }
  for(int i = 1; i < 13; i++) {
    allChannelsOld[1][i] = allChannels[1][i];
    allChannelsOld[2][i] = allChannels[2][i];
    allChannelsOld[3][i] = allChannels[3][i];
    allChannelsOld[4][i] = allChannels[4][i];
    allChannelsOld[5][i] = allChannels[5][i];
  }
  
  for(int i = 1; i < 13; i++) {
      controlP5channelOld[i] = controlP5channel[i];
  }
  for(int i = 1; i < 24; i++) {
      enttecDMXchannelOld[i] = enttecDMXchannel[i];
  }
  for(int i = 1; i < touchOSCchannels; i++) {
      touchOSCchannelOld[i] = touchOSCchannel[i];
  }
}


void dmxEmulator() {
  
for(int i = 1; i < 10; i++) {
  for(int br = 1; br < 255; br++) {
    ch[i] = br;
    ch[i - 1] = 255 - br;
  }
}
}
