/**
 Plot of a flatten helix
 
 using 
 https://github.com/extrapixel/gif-animation/
        raw/master/distribution/gifAnimation.zip
 Codes Modified from:
 * 2016-11-23
 * Jeremy Douglass
 * Processing 3.2.3
 * forum.processing.org/two/discussion/19180/plot-graph
 */

import gifAnimation.*;
import processing.opengl.*;

GifMaker gifExport;

 
PVector origin;
ArrayList<PVector> curve;
PShape curveshape;
int scale;
int tick;
 
void setup(){
  size(800,800,P3D);
  origin = new PVector(width/2, height/2, 0);
  scale = 20;
  tick = 3;
  // compute points for curve 
  curve = helixPoints(2, 3);
 
  // load points into PShape
  curveshape = createShape();
  curveshape.beginShape();
  curveshape.fill(0,0);
  curveshape.stroke(0,0,255);
  curveshape.strokeWeight(2);
  for(PVector v : curve){
    curveshape.vertex(v.x * scale, v.y * scale, v.z * scale);
  }
  curveshape.endShape();


  println("gifAnimation " + Gif.version());
  gifExport = new GifMaker(this, "flatHelix.gif");
  gifExport.setRepeat(0); // make it an "endless" animation


}
 
void draw(){
  float n = mouseX;
  float m = mouseY;

  
  translate(origin.x, origin.y, 0);
  scale(1, -1);
  
  //rotateX(n/4);
  rotateX(-PI/4);
//  rotateY(PI/4);
  rotateZ(PI/4);
  rotateZ(0+n/4);
  translate(0,0,100-m/2);
  
  background(255);

 
  stroke(255,0,0);
  strokeWeight(2);
 
 
  // draw axes
  line(-origin.x,0, 0,origin.x,0, 0);
  line(0,origin.y,0, 0,-origin.y, 0);
  line(0, 0, -300,0, 0,300);
 
  // draw axis ticks
  for(int x=0; x<origin.x; x=x+scale){
    line( x,  tick, 0 , x, -tick, 0);
    line(-x,  tick, 0, -x, -tick, 0);
  }
  for(int y=0; y<origin.y; y=y+scale){
    line( tick,  y, 0, -tick,  y, 0);
    line( tick, -y, 0, -tick, -y, 0);
  }
  for(int z=0; z<origin.z; z=z+scale){
    line(0, tick, z,  0, -tick, z);
    line(0, tick, -z , 0, -tick, -z);
  }
 
  stroke(0);
 
  shape(curveshape);
  gifExport.setDelay(1);
  gifExport.addFrame();

}


ArrayList<PVector> helixPoints (float a, float b){
  float z = 0;
  float y = 0;
  float x = 0;
  ArrayList<PVector> pvlist = new ArrayList<PVector>();
  for (float k = -100; k < 100; k=k+0.01) {
    z = k/10;
    x = a*cos(k);
    y = b*sin(k);
    pvlist.add(new PVector(x,y,z));
  }
  return(pvlist);
}

void keyPressed() {
  gifExport.finish();
  println("gif saved");
}
