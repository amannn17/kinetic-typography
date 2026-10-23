import netP5.*;
import oscP5.*;



OscP5 oscP5;

PGraphics pg;
PFont font;

void setup () {
  font= createFont("Chromate", 600);
  size(800, 800, P2D);
  pg = createGraphics(800, 800, P2D);
  

}  

void draw () {
   background (0);
   
   pg.beginDraw ();
   pg.background(0);
   pg.fill (255);
   pg.textFont (font);
   pg.pushMatrix();
   pg.translate(width/2,height/2-110);
   pg.textAlign(CENTER,CENTER);
   pg.text("A",0,0);
   pg.popMatrix();
   pg.endDraw();
   
   

int tilesX = 8;
int tilesY = 8;

int tileW = int(width/tilesX); 
int tileH = int(height/tilesY);

for(int y = 0; y < tilesY; y++) {
  for (int x = 0; x<tilesX; x++) { int wave = int(sin(frameCount * 0.015 +  (x*y)) * 30);
    
   // int wave = int(sin(frameCount* 0.05 * (x*y))* 100); 
    
    int sx = x*tileW + wave;
    int sy = y*tileH;
    int sw = tileW;
    int sh = tileH;


int dx = x*tileW;
int dy = y*tileH;
int dw = tileW;
int dh = tileH;

copy(pg, sx,sy, sw, sh,dx,dy,dw,dh);




  }
}


}
   
