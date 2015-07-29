// Manuale di Programmazione Cinematografica
// Daniele Olmisani, 2015

// Batman

// See also:
// "Batman Curve" 
// http://mathworld.wolfram.com/BatmanCurve.html

final color PAPER = color(244, 243, 242);
final color INK1 = color(32, 32, 32);
final color INK2 = color(255, 255, 0);

void setup() {
  size(480, 640);
  noLoop();
}

void draw() {
  
  translate(width/2.0, height/2.0);
  scale(25, -25);

  background(PAPER);  

  fill(INK2);
  stroke(INK1);
  strokeWeight(0.5);
  
  ellipseMode(CENTER);
  ellipse(0, 0, 16, 8);
  
  fill(INK1);
  noStroke();
  
  beginShape();
  for (float x=-7.0; x<=7.0; x+=0.05) {
    vertex(x, abs(x)<3 ? g(x) : f(x));
  }
  for (float x=7.0; x>=-7.0; x-=0.05) {
    vertex(x, (abs(x)<4 ? h(x) : -f(x)));
  }  
  endShape();
  
  beginShape();
  vertex(-1.00, 1.00); vertex(-0.75, 3.00);
  vertex(-0.50, 2.25); vertex( 0.50, 2.25);
  vertex( 0.75, 3.00); vertex( 1.00, 1.00);
  endShape();
  
  save("batman.png");
}

float f(float x) {
  return 3*sqrt(-sq((x/7))+1);
}

float g(float x) {
  return 1.5-abs(x/2)-1.35*(sqrt(3-sq(x)+2*abs(x))-2);
}

float h(float x) {
  return abs(x/2)-0.09*sq(x)-3+sqrt(1-sq((abs(abs(x)-2)-1)));
}
