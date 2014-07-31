
import fisica.*;
import oscP5.*;
import netP5.*;

FWorld mundo;

PGraphics bglayer;
PGraphics masklayer;

float frmrate = 24;
float secperframe = 1.0/frmrate;

int w = 1066;
int h = 600;

float gravityx = 0.0;
float gravityy = 0.0;

int maskalpha = 11;

OscP5 meosc;
NetAddress sc;

PImage img;
boolean gosqig = false;
int[] sqigA = {
  100, 50, 50, 50, 50, 14
};
String sqigClTemp = "orange";



void setup() {

  size(w, h, P3D);
  frameRate(frmrate);

  meosc = new OscP5(this, 1231);
  sc = new NetAddress("127.0.0.1", 57120);

  bglayer = createGraphics(w, h, JAVA2D);
  masklayer = createGraphics(w, h, JAVA2D);

  Fisica.init(this);
  mundo = new FWorld();
  mundo.setEdges();
  mundo.setGravity(gravityx, gravityy);

  mundo.top.setName("edg_t");
  mundo.bottom.setName("edg_b");
  mundo.left.setName("edg_l");
  mundo.right.setName("edg_r");

  meosc.plug(spots, "mkinst", "/mkspot");
  meosc.plug(spots, "rmv", "/rmvspot");
  meosc.plug(spots, "hit", "/hit");
  meosc.plug(spots, "push", "/push");
  meosc.plug(spots, "sizesawon", "/sawon");
  meosc.plug(spots, "sizesawoff", "/sawoff");
  meosc.plug(spots, "chgSAtype", "/chgShortAttack");
  meosc.plug(spots, "halt", "/haltspot");
  meosc.plug(spots, "haltall", "/haltall");
  meosc.plug(spots, "go2", "/goto");
  meosc.plug(spots, "lift", "/lift");
  meosc.plug(spots, "liftall", "/liftall");
  meosc.plug(spots, "setvelocity", "/setvel");
  meosc.plug(spots, "setbounce", "/setbounce");
  meosc.plug(spots, "go", "/go");
  meosc.plug(spots, "goall", "/goall");

  meosc.plug(setOSticks, "mk", "/mkstick");
  meosc.plug(setOSticks, "rmv", "/rmvstick");

  meosc.plug(this, "setgravity", "/setgravity");

  //meosc.plug(this, "mksqig", "/mksqig"); 
  meosc.plug(squigglez, "mk", "/mksqig");

}



void draw() {
  background(0);



  bglayer.beginDraw(); //////////////////////////////
  bglayer.fill(0, 0, 0, 170);
  bglayer.rectMode(CORNER);
  bglayer.rect(0, 0, width, height);

  squigglez.drw(bglayer);
  spots.drwbglayer(); //gives pixel ct
  bglayer.endDraw(); ///////////////////////////////


  masklayer.beginDraw(); //////////////////////////////
  masklayer.background(maskalpha, maskalpha, maskalpha);

  mundo.step();
  mundo.draw(masklayer);
  masklayer.endDraw(); ////////////////////////////


  bglayer.mask(masklayer);

  image(bglayer, 0, 0);

  //TOP LAYER ////////////////////////////////////
  spots.drwTopLayer();
  setOSticks.drwset();
  //squigglez.drw(g); //'g' is global variable to refer to the man PApplet's PGraphics


  if (gosqig) {
    gosqig = false;
    squigglez.mk(sqigA[0], sqigA[1], sqigA[2], sqigA[3], sqigA[4], sqigA[5], sqigClTemp);
  }
  //
  //
  //
}//End Draw
/*
void mi() {
 glowl.beginDraw();
 glowl.background(0);
 glowl.noStroke();
 glowl.fill(80, 255, 0);
 glowl.pushMatrix();
 
 glowl.rectMode(CENTER);
 //ellipseMode(CENTER);
 glowl. translate(300, 300);
 glowl.rotate(radians(spdeg));
 glowl.rect(0, 0, 140, 16);
 spdeg+=35;
 glow(3, 1, glowl);
 
 glowl.popMatrix();
 glowl.endDraw();
 
 
 img = glowl.get(0, 0, glowl.width, glowl.height);
 }
 */


void contactResult(FContactResult c) {
  boolean sp1b = false;
  boolean sp2b = false;
  FBody obs = c.getBody1();
  for (int i=spots.clset.size ()-1; i>=0; i--) {
    Spotlight inst = spots.clset.get(i);
    //if body 1 is a spotlight then store spotlight in local variable
    if (c.getBody1() == inst.sl) {
      inst.hit(c.getBody2().getName(), c.getNormalImpulse());
    } 

    if (c.getBody2() == inst.sl) {
      inst.hit(c.getBody1().getName(), c.getNormalImpulse());
    }
  }
}



void setgravity(float gx, float gy) {
  mundo.setGravity(gx, gy);
}


void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.isPlugged()==false) {
    println("### received an osc message.");
    println("### addrpattern\t"+theOscMessage.addrPattern());
    println("### typetag\t"+theOscMessage.typetag());
  }
}


void mksqig(int ix, int x, int y, int w, int h, int d, String cl) {
  sqigA[0] = ix;
  sqigA[1] = x;
  sqigA[2] = y;
  sqigA[3] = w;
  sqigA[4] = h;
  sqigA[5] = d;
  sqigClTemp = cl;

  gosqig = true;
}

