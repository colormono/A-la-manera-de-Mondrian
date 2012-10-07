// Clases
class Transition{
  
  // Campos
  float Alpha = 0;
  float mascara = 0;
  
  // Metodos:

  // Slide
  void slideTo(float Speed, float Hue, float Saturation, float Bright){
    noStroke();
    fill(Hue, Saturation, Bright, 100);
    rect(0, height, width, mascara - height);
    mascara += ciclos * Speed;
    // Reinicia
    if (ciclos == ciclosTotales){
      mascara = 0;
    }
  }
  
  // Fade
  void fadeTo(float Speed, float Hue, float Saturation, float Bright){
    noStroke();
    rectMode(CORNER);
    fill(Hue, Saturation, Bright, Alpha);
    rect(0, 0, width, height);
    Alpha += (Alpha + 1) * Speed;
    // Reinicia
    if (Alpha > 100){
      Alpha = 0;
      ciclos = 0;
      pintando = false;
    }
  }
  
}

