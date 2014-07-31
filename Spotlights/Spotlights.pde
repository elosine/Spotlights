
import fisica.*;
import oscP5.*;
import netP5.*;

FWorld mundo;

PGraphics bglayer;
PGraphics masklayer;
<<<<<<< HEAD
PGraphics tempbuf;
=======
PGraphics glowl;
>>>>>>> parent of 2f70ecd... Squiggle as classset

float frmrate = 24;
float secperframe = 1.0/frmrate;


int w = 1066;
int h = 600;

float gravityx = 0.0;
float gravityy = 0.0;

int maskalpha = 11;

OscP5 meosc;
NetAddress sc;

int spdeg = 0;

PImage img;
boolean render = false;



void setup() {

  size(w, h, P3D);
  frameRate(frmrate);

  meosc = new OscP5(this, 1231);
  sc = new NetAddress("127.0.0.1", 57120);

  bglayer = createGraphics(w, h, P3D);
  masklayer = createGraphics(w, h, P2D);
<<<<<<< HEAD
  tempbuf = createGraphics(w, h, P3D);
=======
  glowl = createGraphics(w, h, P3D);
>>>>>>> parent of 2f70ecd... Squiggle as classset

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
<<<<<<< HEAD
  
  meosc.plug(squigglez, "mk", "/mksquig");
  meosc.plug(squigglez, "render", "/rndsquig");
  meosc.plug(squigglez, "rmv", "/rmvsquig");
  
=======
>>>>>>> parent of 2f70ecd... Squiggle as classset

  meosc.plug(glowstickz, "mk", "/mkglowstick");
  meosc.plug(glowstickz, "rmv", "/rmvglowstick");
  meosc.plug(glowstickz, "rmvall", "/rmvallglowstick");
  meosc.plug(glowstickz, "update", "/updategs");
  mi();
}



void draw() {
  background(0);



  bglayer.beginDraw(); //////////////////////////////
  //bglayer.background(0, 3);
  bglayer.fill(0, 0, 0, 170);
  bglayer.rectMode(CORNER);
  bglayer.rect(0, 0, width, height);


  bglayer.image(img, 0, 0);
  spots.drwbglayer(); //gives pixel ct

  bglayer.endDraw(); ///////////////////////////////

  masklayer.beginDraw(); //////////////////////////////

  masklayer.background(maskalpha, maskalpha, maskalpha);
  //masklayer.fill(255,255,255);

  mundo.step();
  mundo.draw(masklayer);
  //glow(3,1,masklayer);
  masklayer.endDraw(); ////////////////////////////

  bglayer.mask(masklayer);

  image(bglayer, 0, 0);


  glowstickz.drw();

  //TOP LAYER ////////////////////////////////////
  spots.drwTopLayer();
  setOSticks.drwset();
}//End Draw

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
void keyPressed(){
  mi();
}


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

