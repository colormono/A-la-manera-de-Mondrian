/*
 * TP Parcial: A la manera de Piet Mondrian
 * Obra: Retícula Cósmica
 * Concepto: "Solo cuando estemos en lo real absoluto, el arte no será ya más necesario." P. Mondrian
 * 
 * Informática Aplicada I - IUNA
 * Mariano Rivas (30.591.163)
 * http://colormono.com
 *
 ****************************************************************/

// Definiciones
boolean pintando = false;                                        // Comienza pintando o pensando que pintar?
boolean grid = false;                                            // Muestra la grilla de construccion?
int ciclos = 0;                                                  // Primer ciclo (Duracion = ciclosTotales - ciclos)
int ciclosTotales = 300;                                         // Cantidad de ciclos antes del reinicio
int Principales = 1;                                             // Cantidad de Bloques Principales
int Secundarios = 2;                                             // Cantidad de Bloques Secundarios
int Terciarios = 3;                                              // Cantidad de Bloques Terciarios
int Complementarios = 3;                                         // Cantidad de Bloques Complementarios
Rectangulo[] principal = new Rectangulo[Principales];            // Declaración y creación del array
Rectangulo[] secundarios = new Rectangulo[Secundarios];          // Declaración y creación del array
Rectangulo[] terciarios = new Rectangulo[Terciarios];            // Declaración y creación del array
Rectangulo[] complementarios = new Rectangulo[Complementarios];  // Declaración y creación del array
Transition bgCanvas = new Transition();                          // Declaración y Construccion del Objeto para las transiciones
Transition bgMascara = new Transition();                         // Declaración y Construccion del Objeto para las transiciones

// Variables internas de construccion
float bloque, Xpos, Ypos, BordeAncho, MargenError, margenSup, margenDer, margenInf, margenIzq;
int Ancho, Alto, BordeSuperior, BordeInferior, BordeIzquierdo, BordeDerecho;
color Color, ColorPrincipal, ColorSecundario, ColorTerciario, ColorComplementario, BordeColor, blanco, negro, rojo, amarillo, azul;

void setup(){
  size(512,512);                                                 // Tamaño del lienzo
  colorMode(HSB, 360, 100, 100, 100);                            // Modo de color
  randomSeed(0);                                                 // Fuerza los mismos valores aleatorios
  smooth();                                                      // Filtro antiAlias
  //noCursor();                                                    // Apago el cursor
  //println(frameCount);                                           // Medir FrameRate
}

void draw(){

  // Si no esta pintando, piensa que tiene que pintar
  if (pintando == false){

    // Parametros Globales
    bloque = width / 32;                                        // Grilla: 32 x 32 bloques
    blanco = color(39, 13, 95, 100);                            // Color Blanco
    negro = color(348, 83, 7, 100);                             // Color Negro
    rojo = color(8, 88, 88, 100);                               // Color Rojo
    amarillo = color(53, 99, 93, 100);                          // Color Amarillo
    azul = color(222, 65, 61, 100);                             // Color Azul
    BordeAncho = round(random(5,8));                            // Grosor del borde
    BordeSuperior = 2 * round(random(4, 24) % 16);              // Continuacion del borde superior
    BordeInferior = 2 * round(random(4, 24) % 16);              // Continuacion del borde inferior
    BordeIzquierdo = 2 * round(random(4, 24) % 16);             // Continuacion del borde izquierdo
    BordeDerecho = 2 * round(random(4, 24) % 16);               // Continuacion del borde derecho
    MargenError = round(random(0, 5));                          // Aberraciones en las terminaciones            
    strokeCap(SQUARE);                                          // Tipo de borde 
    int defineColor = round(random(0,3));                       // Paleta a utilizar
    switch(defineColor){
    case 0:
      ColorPrincipal = rojo;
      ColorSecundario = azul;
      ColorTerciario = amarillo;
      ColorComplementario = negro;
      BordeColor = negro;
      break;
    case 1:
      ColorPrincipal = azul;
      ColorSecundario = rojo;
      ColorTerciario = amarillo;
      ColorComplementario = negro;
      BordeColor = negro;
      break;
    case 2:
      ColorPrincipal = amarillo;
      ColorSecundario = rojo;
      ColorTerciario = azul;
      ColorComplementario = negro;
      BordeColor = negro;
      break;
    default:
      ColorPrincipal = blanco;
      ColorSecundario = blanco;
      ColorTerciario = azul;
      ColorComplementario = rojo;
      BordeColor = amarillo;
      break;
    }

    // Bloques Principales
    for (int i = 0; i < principal.length; i++) {
      Xpos = 2 * round(random(0, 16) % 8);
      Ypos = 2 * round(random(0, 16) % 8);
      Ancho = 2 * round(random(4, 8));
      Alto = 2 * round(random(4, 8));
      principal[i] = new Rectangulo(ColorPrincipal, Xpos, Ypos, Ancho, Alto, BordeColor, BordeAncho, BordeSuperior, BordeDerecho, BordeInferior, BordeIzquierdo, MargenError);
      println(Xpos + ", " + Ypos + ", " + Ancho + ", " + Alto);
    }

    // Bloques Secundarios
    for (int i = 0; i < secundarios.length; i++) {
      Xpos = 2 * round(random(0, 16) % 16);
      Ypos = 2 * round(random(0, 16) % 16);
      Ancho = 2 * round(random(3, 5));
      Alto = 2 * round(random(3, 5));
      secundarios[i] = new Rectangulo(ColorSecundario, Xpos, Ypos, Ancho, Alto, BordeColor, BordeAncho, BordeSuperior, BordeDerecho, BordeInferior, BordeIzquierdo, MargenError);
    }

    // Bloques Terciarios
    for (int i = 0; i < terciarios.length; i++) {
      Xpos = 2 * round(random(0, 16) % 32);
      Ypos = 2 * round(random(0, 16) % 32);
      Ancho = 2 * round(random(1, 3));
      Alto = 2 * round(random(1, 3));
      terciarios[i] = new Rectangulo(ColorTerciario, Xpos, Ypos, Ancho, Alto, BordeColor, BordeAncho, BordeSuperior, BordeDerecho, BordeInferior, BordeIzquierdo, MargenError);
    }

    // Bloques Complementarios
    for (int i = 0; i < complementarios.length; i++) {
      Xpos = 2 * round(random(0, 16) % 8);
      Ypos = 2 * round(random(0, 16) % 8);
      Ancho = 2 * round(random(0, 2));
      Alto = 2 * round(random(0, 2));
      BordeAncho = 0;
      complementarios[i] = new Rectangulo(ColorComplementario, Xpos, Ypos, Ancho, Alto, BordeColor, BordeAncho, BordeSuperior, BordeDerecho, BordeInferior, BordeIzquierdo, MargenError);
    }

    pintando = true;

    // Sino, se pone manos a la obra
  } 
  else {

    // Si le queda tiempo sigue pintando
    if (ciclos <= ciclosTotales){

      // Color del lienzo
      background(blanco);

      // Grilla de construccion
      if (grid == true){
        for (float x = 0; x < height; x += bloque ) {
          for (float y = 0; y < width; y += bloque ) {
            stroke(negro, 1);
            strokeWeight(1);
            line(x, 0, x, height);
            line(0, y, width, y);
          }
        }
      }

      // Dibuja Bloques
      for (int i = 0; i < complementarios.length; i++) {
        complementarios[i].mostrar();
      }
      for (int i = 0; i < terciarios.length; i++) {
        terciarios[i].mostrar();
      }
      for (int i = 0; i < secundarios.length; i++) {
        secundarios[i].mostrar();
      }
      for (int i = 0; i < principal.length; i++) {
        principal[i].mostrar();
      }

      // Mascara de Entrada
      bgMascara.slideTo(0.05, 39, 13, 95); // Pasando: Velocidad (0 a 1), Tono (1 a 360), Saturacion (0 a 100), Brillo (0 a 100)

      ciclos ++;

      // Sino reinicia  
    } 
    else {
      bgCanvas.fadeTo(0.08, 39, 13, 95); // Pasando: Velocidad (0 a 1), Tono (1 a 360), Saturacion (0 a 100), Brillo (0 a 100)
    }

  } // FIN

}

