//Tässä välilehdessä luetaan tietokoneen omia syöttölaitteita, eli näppäimistöä ja hiirtä

void keyReleased() {
  keyReleased = true;
}
void keyPressed() {
  if(key==27) { key=0; } //Otetaan esc-näppäin pois käytöstä. on kumminkin huomioitava, että tämä toimii vain pääikkunassa
  if(key == 'm') {
    if(move == true) { move = false; moveLamp = false; delay(10); }
    else { zoom = 100; x_siirto = 0; y_siirto = 0; move = true; delay(10); }
  }
  if(key == '1') { lampToMove = 1; }
  if(key == 's') { saveAllData(); }
  if(key == 'l') { loadAllData(); }

  if(key == 'u') {
      if(upper == true) { enttecDMXplace = enttecDMXplace - 1; upper = false; }
      else { enttecDMXplace = enttecDMXplace + 1; upper = true; }
  } 
  
}


void mousePressed() {
  mouseClicked = true;
}
void mouseReleased() {
  mouseClicked = false;
  mouseReleased = true;
}
