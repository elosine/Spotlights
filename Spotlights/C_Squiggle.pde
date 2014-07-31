// DECLARE/INITIALIZE CLASS SET
SquiggleSet squigglez = new SquiggleSet();

class Squiggle {
  int ix, x, y, w, h, density;
  String cl;

  float l, r, t, b, m, c;
  PImage img;
  PG
  float curvePointX = 0; 
  float curvePointY = 0;
  float x1, y1, addx, addy;

  Squiggle(int aix, int ax, int ay, int aw, int ah, int adensity, String acl) {
    ix = aix;
    x = ax;
    y = ay;
    w = aw;
    h = ah;
    density = adensity;
    cl = acl;
    
    l = x;
    r = l+w;
    t = y;
    b = y+h;
    

    m = w/2.0;
    c = h/2.0;
    x1 = m;
    y1 = c;
  }

  void render() {
    tempbuf.beginDraw();
    tempbuf.background(0);
    tempbuf.noFill();
    tempbuf.strokeWeight(2);
    tempbuf.stroke(clr.get(cl));

    for (int j=0; j<int (random (2, density+2)); j++) {
      tempbuf.beginShape();
      tempbuf.curveVertex(x1, y1);
      tempbuf.curveVertex(x1, y1);
      for (int i = 0; i < int (random (3, 13)); i++) {
        if (x1<m) addx = random(w/2);
        else addx = random( (w/2) * -1 );
        if (y1<c) addy = random(h/2);
        else addy = random( -h/2 );
        curvePointX = constrain( x1 + addx, m-(w/2.0)+10, m+(w/2.0) );
        curvePointY = constrain( y1 + addy, c-(h/2.0)+10, c+(h/2.0) );
        tempbuf.curveVertex(curvePointX, curvePointY);
      }
      tempbuf.curveVertex(curvePointX, curvePointY);
      tempbuf.endShape();
      x1 = curvePointX;
      y1 = curvePointY;
    }
    glow(3, 3, tempbuf);

    tempbuf.fill(0);
    tempbuf.noStroke();
    // tempbuf.ellipse(w/2, h/2, 30, 30);
    tempbuf.noFill();
    tempbuf.stroke(0, 255, 0);
    tempbuf.rectMode(CENTER);
    // tempbuf.rect(w/2, h/2, w, h);
    tempbuf.endDraw();

   // img = tempbuf.get(int(l), int(t), w, h);
  }
  
  void drw(PGraphics rbuf) {
   // rbuf.image(img, x, y);
  }
}





class SquiggleSet {
  ArrayList<Squiggle> cset = new ArrayList<Squiggle>();

  // Make Instance Method //
  void mk(int ix, int x, int y, int w, int h, int dens, String cl) {
    cset.add( new Squiggle(ix, x, y, w, h, dens, cl) );   
  } //end mk method
  

  // Remove Instance Method //
  void rmv(int ix) {
    for (int i=cset.size ()-1; i>=0; i--) {
      Squiggle inst = cset.get(i);
      if (inst.ix == ix) {
        cset.remove(i);
        break;
      }
    }
  } //End rmv method


  // Remove All Method //
  void rmvall() {
    cset.clear();
  } //End rmvall method



  // Draw Set Method //
  void drw(PGraphics rbuf) {
    for (int i=cset.size ()-1; i>=0; i--) {
      Squiggle inst = cset.get(i);
      inst.drw(rbuf);
    }
  }//end drw method



  // Draw Set Method //
  void render() {
    for (int i=cset.size ()-1; i>=0; i--) {
      Squiggle inst = cset.get(i);
      inst.render();
    }
  }//end drw method

  //
  //
}

