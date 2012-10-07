class Rectangulo {
  color Color, BordeColor;
  float Xpos, Ypos, BordeAncho, MargenError, margenSup, margenDer, margenInf, margenIzq;
  int Ancho, Alto, BordeSuperior, BordeInferior, BordeIzquierdo, BordeDerecho;

  Rectangulo(color tempColor, float tempXpos, float tempYpos, int tempAncho, int tempAlto, color tempBordeColor, 
  float tempBordeAncho, int tempBordeSuperior, int tempBordeDerecho, int tempBordeInferior, 
  int tempBordeIzquierdo, float tempMargenError) {
    Color = tempColor;
    Xpos = tempXpos;
    Ypos = tempYpos;
    Ancho = tempAncho;
    Alto = tempAlto;
    BordeColor = tempBordeColor;
    BordeAncho = tempBordeAncho;
    BordeSuperior = tempBordeSuperior;
    BordeInferior = tempBordeInferior;
    BordeIzquierdo = tempBordeIzquierdo;
    BordeDerecho = tempBordeDerecho;
    MargenError = random(0,tempMargenError);
  }

  void mostrar() {
    noStroke();
    fill(Color);
    rectMode(CORNER);
    rect(bloque * Xpos, bloque * Ypos, bloque * Ancho, bloque * Alto);
    if(BordeAncho != 0){
      stroke(BordeColor);
      strokeWeight(BordeAncho);
      margenSup = (bloque * BordeSuperior) - MargenError;
      margenDer = (bloque * BordeDerecho) - MargenError;
      margenInf = (bloque * BordeInferior) - MargenError;
      margenIzq = (bloque * BordeIzquierdo) - MargenError; 
      line(bloque * Xpos - margenIzq, bloque * Ypos, bloque * (Xpos + Ancho) + margenDer , bloque * Ypos); // Border Superior
      line(bloque * Xpos - margenIzq, bloque * (Ypos + Alto), bloque * (Xpos + Ancho) + margenDer , bloque * (Ypos + Alto)); // Border Inferior
      line(bloque * (Xpos + Ancho), bloque * Ypos - margenSup, bloque * (Xpos + Ancho),  bloque * (Ypos + Alto) + margenInf); // Border Derecho
      line(bloque * Xpos, bloque * Ypos - margenSup, bloque * Xpos,  bloque * (Ypos + Alto) + margenInf); // Border Izquierdo
    }    
  }

}
