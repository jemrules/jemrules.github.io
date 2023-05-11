// John McCullough | 8-30-2022 | Pong

int xd, yd;
int speed;
int cx,cy;
int wx,wy;
int wh;
int mx, my;
int score;
void setup() {
  size(1500,1000);
  frameRate(69);
  wx = width/8;
  wy = 0;
  wh = 200;
  cx = width/2;
  cy = height/2;
  xd = 1;
  yd = 1;
  speed = 5;
  score = 0;
}
void draw()  {
  wy = constrain(mouseY,wh/2,height-(wh/2));
  background(0);
  stroke(0,125,0);
  strokeWeight(4);
  line(wx,wy+(wh/2),wx,wy-(wh/2));
  line(width-wx,cy+(wh/2),width-wx,cy-(wh/2));
  if (cx > width-wx) {
    xd = -1;
  }
  if (cy > height) {
    yd = -1;
  }
  if (cx < wx+10 && cx > wx-10 && cy < wy+(wh/2) && cy > wy-(wh/2)) {
    xd = 1;
    score += 1;
  }
  if (cy < 0) {
    yd = 1;
  }
  if (cx < 0) {
    cx = width/2;
    cy = height/2;
    xd = 1;
    yd = 1;
    score = 0;
    //speed = 5+score*4;
    frameRate(69+score*20);
  }
  cx += xd*speed;
  cy += yd*speed;
  strokeWeight(0);
  ellipse(cx,cy,10,10);
  textSize(50);
  textAlign(CENTER);
  text("Score: " + score, width/2, height/8);
}
