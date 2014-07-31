class Squiggle {
  int ix, w, h, density;
  String cl;

  PGraphics buf;
  PImage img;
  float curvePointX = 0; 
  float curvePointY = 0;
  float x, y;
  float x1, y1, addx, addy;

  Squiggle(int aix, int aw, int ah, int adensity, String acl) {
    ix = aix;
    w = aw;
    h = ah;
    density = adensity;
    cl = acl;

    buf = createGraphics(w+10, h+10, P3D);
    x = w/2.0;
    y = h/2.0;
    x1 = x;
    y1 = y;
  }

  void render() {
    buf.beginDraw();
    buf.background(0);
    buf.noFill();
    buf.strokeWeight(2);
    buf.stroke(clr.get(cl));

    for (int j=0; j<int(random(2, density+2)); j++) {
      buf.beginShape();
      buf.curveVertex(x1, y1);
      buf.curveVertex(x1, y1);
      for (int i = 0; i < int(random(3, 13)); i++) {
        if (x1<x) addx = random(w/2);
        else addx = random( (w/2) * -1 );
        if (y1<y) addy = random(h/2);
        else addy = random( -h/2 );
        curvePointX = constrain( x1 + addx, x-(w/2.0)+10, x+(w/2.0) );
        curvePointY = constrain( y1 + addy, y-(h/2.0)+10, y+(h/2.0) );
        buf.curveVertex(curvePointX, curvePointY);
      }
      buf.curveVertex(curvePointX, curvePointY);
      buf.endShape();
      x1 = curvePointX;
      y1 = curvePointY;
    }
    glow(3, 3, buf);

    buf.fill(0);
    buf.noStroke();
    // buf.ellipse(w/2, h/2, 30, 30);
    buf.noFill();
    buf.stroke(0, 255, 0);
    buf.rectMode(CENTER);
    // buf.rect(w/2, h/2, w, h);
    buf.endDraw();

    img = buf.get(0, 0, buf.width, buf.height);
  }
  void drw() {
    image(img, 400, 200);
  }
}

