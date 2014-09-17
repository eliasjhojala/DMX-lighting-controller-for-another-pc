//Tässä välilehdessä piirretään alavalikko, jossa näkyy mm. fixtuurien nykyiset arvot

void alavalikko() {
  translate(0, height-100);
  for(int i = 0; i <= channels/2; i++) {
    translate(65, 0);
    fixture(i, dim[(-1)+fixtureChannelNow[fixtureIdNow[i]]+1], fixtureChannelNow[fixtureIdOriginal[fixtureIdNow[i]]], (-1)+fixtureChannelNow[fixtureIdNow[i]]+1, fixtureType1[fixtureIdNow[i]]);
  }
  for(int i = 0; i <= channels/2; i++) {
    translate(-65, 0);
  }
  translate(0, 65);
  for(int i = channels/2+1; i <= channels; i++) {
    translate(65, 0);
    fixture(i, dim[(-1)+fixtureChannelNow[fixtureIdNow[i]]+1], fixtureChannelNow[fixtureIdOriginal[fixtureIdNow[i]]], (-1)+fixtureChannelNow[fixtureIdNow[i]]+1, fixtureType1[fixtureIdNow[i]]);
  }
  translate(0, -55);
  for(int i = channels/2+1; i <= channels; i++) {
    translate(-65, 0);
  }
  translate(0, (height-100)*(-1));
}
void fixture(int numero3, int dimmi, int numero2, int numero, int fixtuuriTyyppi1) {
  
  String fixtuuriTyyppi = "";

    
  if(fixtuuriTyyppi1 == 1) { fixtuuriTyyppi = "par64"; }
  if(fixtuuriTyyppi1 == 2) { fixtuuriTyyppi = "p.fresu"; }
  if(fixtuuriTyyppi1 == 3) { fixtuuriTyyppi = "k.fresu"; }
  if(fixtuuriTyyppi1 == 4) { fixtuuriTyyppi = "i.fresu"; }
  if(fixtuuriTyyppi1 == 5) { fixtuuriTyyppi = "flood"; }
  if(fixtuuriTyyppi1 == 6) { fixtuuriTyyppi = "linssi"; }
  if(fixtuuriTyyppi1 == 7) { fixtuuriTyyppi = "haze"; }
  if(fixtuuriTyyppi1 == 8) { fixtuuriTyyppi = "fan"; }
  if(fixtuuriTyyppi1 == 9) { fixtuuriTyyppi = "strobe"; }
  if(fixtuuriTyyppi1 == 10) { fixtuuriTyyppi = "freq"; }
  if(fixtuuriTyyppi1 == 11) { fixtuuriTyyppi = "fog"; }
  if(fixtuuriTyyppi1 == 12) { fixtuuriTyyppi = "pinspot"; }
  if(fixtuuriTyyppi1 == 13) { fixtuuriTyyppi = "MHdim"; }
  if(fixtuuriTyyppi1 == 14) { fixtuuriTyyppi = "MHpan"; }
  if(fixtuuriTyyppi1 == 15) { fixtuuriTyyppi = "MHtilt"; }
  fill(255, 255, 255);
  stroke(255, 255, 0);
  rect(0, 0, 60, -51);
  stroke(0, 0, 0);
  fill(0, 255, 0);
  rect(0, -40, 60, -15);
  fill(0, 0, 0);
  text(str(numero)+":"+str(numero2)+fixtuuriTyyppi, 2, -44);
  fill(0, 0, 255);
  rect(0, 0, 10, (map(dimmi, 0, 255, 0, 30))*(-1));
  fill(255, 255, 255);
  rect(10, 0, 49, -15);
  fill(0, 0, 0);
  text("Go", 12, -3);
  fill(255, 255, 255);
  rect(10, -15, 49, -15);
  fill(0, 0, 0);
  text("Toggle", 12, -18);
  fill(255, 255, 255);
  
  if(numero3 <= channels/2) {
  if(mouseX > 65*numero3+10 && mouseX < 65*(numero3+1)) {
    
    if(mouseY > height-(200+15) && mouseY < height-110) {
          if(mousePressed == true && mouseButton == RIGHT) {
            toChangeFixtureColor = true; toRotateFixture = true; changeColorFixtureId = numero2-2;
          }
    }
      if(mouseY > height-(100+15) && mouseY < height-100) {
        if(mouseClicked == true) {
          if(numero3-1 >= 0 && numero3-1 <= fixtureIdNow.length) {
            dim[(-1)+fixtureChannelNow[fixtureIdNow[numero3-1]]+1] = 255; 
          }      
        }
        else if(mouseReleased == true){
          mouseReleased = false;
          dim[(-1)+fixtureChannelNow[fixtureIdNow[numero3-1]]+1] = 0;
        }
      }
    }
  }
  else {
    
    if((mouseX > 65*(numero3-(channels/2))+10) && (mouseX < 65*(numero3+1-(channels/2)))) {
      if(mouseY > height-(100+15) && mouseY < height-10) {
          if(mousePressed == true && mouseButton == RIGHT) {
            toChangeFixtureColor = true; toRotateFixture = true; changeColorFixtureId = numero2-1;
          }
    }
      if(mouseY > height-(100+15-65) && mouseY < height-110) {
      }
          if(mouseY > height-(100+15-65) && mouseY < height-(100-65)) {
            if(mouseClicked == true) {
                dim[fixtureChannelNow[fixtureIdNow[numero3-1]]+1] = 255;
            }
            else if(mouseReleased == true){
              mouseReleased = false;
              dim[fixtureChannelNow[fixtureIdNow[numero3-1]]+1] = 0;
            }
          }
        }
      }
      
      if(numero3 <= channels/2) {
  if(mouseX > 65*numero3+10 && mouseX < 65*(numero3+1)) {
      if(mouseY > height-(100+30) && mouseY < height-(100+15)) {
        if(mouseClicked == true) {
          if(mouseReleased == true) {
          if(dim[(-1)+fixtureChannelNow[fixtureIdNow[numero3-1]]+1] == 255) {
                dim[(-1)+fixtureChannelNow[fixtureIdNow[numero3-1]]+1] = 0;
                print(numero2);
                print(":");
                println(0);
              }
              else {
                dim[(-1)+fixtureChannelNow[fixtureIdNow[numero3-1]]+1] = 255;
                print(numero2);
                print(":");
                println(255);
              }
              mouseReleased = false;
          }
        }
      }
    }
  }
  else {
    if((mouseX > 65*(numero3-(channels/2))+10) && (mouseX < 65*(numero3+1-(channels/2)))) {
          if(mouseY > height-(100+30-65) && mouseY < height-(100-65+15)) {
            if(mouseClicked == true) {
              if(mouseReleased == true) {
              if(dim[fixtureChannelNow[fixtureIdNow[numero3-1]]+1] == 255) {
                dim[fixtureChannelNow[fixtureIdNow[numero3-1]]+1] = 0;
              }
              else {
                dim[fixtureChannelNow[fixtureIdNow[numero3-1]]+1] = 255;
              }
              mouseReleased = false;
              }
            }
          }
        }
      }
      
      
      if(numero3 <= channels/2) {
  if(mouseX > 65*numero3 && mouseX < 65*(numero3)+10) {
      if(mouseY > height-(100+30) && mouseY < height-100) {
        if(mouseClicked == true) {
          dim[(-1)+fixtureChannelNow[fixtureIdNow[numero3-1]]+1] = round(map(mouseY, height-100, height-(100+30), 0, 255));
          
        }
        else if(mouseReleased == true) {
          mouseReleased = false;
        }
      }
    }
  }
  else {
    if((mouseX > 65*(numero3-(channels/2))) && (mouseX < 65*(numero3-(channels/2))+10)) {
          if(mouseY > height-(100+30-65) && mouseY < height-(100-65)) {
            if(mouseClicked == true) {
              dim[fixtureChannelNow[fixtureIdNow[numero3-1]]+1] = round(map(mouseY, height-(100-65), height-(100+30-65), 0, 255));
            }
            else if(mouseReleased == true) {
              mouseReleased = false;
            }
          }
        }
      }
}
