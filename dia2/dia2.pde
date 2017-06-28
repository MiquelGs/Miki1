int seleccion = 0;
int x,y,ymove,xmove;
int xvelocidad=0,yvelocidad=0;
PImage[]tiles = new PImage [4];

void setup() {
size(1280,600);
background(0,90,255);
tiles[0] = loadImage ("cesped.png");
tiles[1] = loadImage ("cesped2.png");
tiles[2] = loadImage ("piedra.png");
tiles[3] = loadImage ("tierra.png");

//xmove = 127;
//ymove = 575;

xmove = 0;
ymove = 0;

}

void draw() {
  int[][]map = {{0,0,0,0,0,0,0,0,3,2,2,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                {0,1,0,0,1,0,0,0,3,2,2,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                {0,0,0,1,0,0,0,0,3,2,2,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                {0,0,1,0,1,0,0,0,3,2,2,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                {0,1,0,0,0,0,0,0,3,2,2,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                {0,0,0,0,0,0,0,0,3,2,2,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                {0,0,3,3,3,3,3,3,3,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3},
                {0,0,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2},
                {0,0,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2},
                {0,0,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2},
                {0,0,3,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,2,2,3,3,3,3,3,3,3,3,3,3,3},
                {0,0,3,2,2,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,2,2,2,3,0,0,0,0,0,0,0,0,0,0},
                {0,0,3,2,2,2,3,0,0,1,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,2,2,2,3,0,0,0,0,0,0,0,0,0,0},
                {0,0,3,2,2,2,3,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,2,2,2,3,0,0,0,0,0,0,0,0,0,0},
                {0,0,3,2,2,2,3,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,2,2,2,3,0,0,0,0,0,0,0,0,0,0},
                {0,0,3,2,2,2,3,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,2,2,2,3,0,0,0,0,0,0,0,0,0,0},
                {0,0,3,2,2,2,3,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,2,2,2,3,0,0,0,0,0,0,0,0,0,0},
                {0,0,3,2,2,2,3,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,2,2,2,3,0,0,0,0,0,0,0,0,0,0},
                {0,0,3,2,2,2,3,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,2,2,2,3,0,0,0,0,0,0,0,0,0,0},
                {0,0,3,2,2,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,2,2,2,3,0,0,0,0,0,0,0,0,0,0}};
                
  for(int y=0;y<19;y=y+1){
    for(int x=0; x<40; x=x+1){
      seleccion = map[y][x];
      image(tiles[seleccion],0+x*32,0+y*32);
    }
   }
   fill(0,180,255);
   rect(xmove,ymove,32,32);
   
   fill(255,255,255);
   text(map[(ymove+16)/32][(xmove+16)/32],xmove,ymove);
   
}

void keyPressed() {
  if (keyCode == UP){
      ymove = ymove-32;
  }
  if (keyCode == DOWN){
      ymove = ymove+32;
  }
  if (keyCode == LEFT){
      xmove = xmove-32;
  }
  if (keyCode == RIGHT){
      xmove = xmove+32;
  }
  //println("Estás en la posición: X = "+xmove/32+" Y = "+ymove/32);
}

void keyReleased() {
}