//when bounce the side, speed++
int circleX;
int circleY;
int GAP=50;
int dirX;//direction
int dirY;
int speedX=2; //absolute value of speed
int speedY=2;
int curr_speedY;
int curr_speedX;
boolean save_current_speedX=true;
boolean save_current_speedY=true;

void setup() {
  size(400, 400);
  circleX=(int)random(1, width);
  circleY=(int)random(1, 50);
  dirX=1;
  if(random(0,1)<0.5){//50% random
  dirX=-1;
  }
  dirY=1;
 
 //dirX=-1;
 //dirY=0;/test horizontally
}
void draw() {
  background(150);
  stroke(0);
  display();
  bounce();
  move();
}

void display() {
  //dispaly the ball with random color
  fill(random(255), random(255), random(255));
  circle(circleX, circleY, 20);
  
}

void bounce() {
 
if(circleX!=0&&circleX<speedX){
save_current_speedX=false;
speedX=circleX;
}
if(circleX!=width&&circleX>width-speedX){
  //when the ball is close to the side, stop keep tracking the current speed 
  //and change speed temporarily
save_current_speedX=false;
speedX=width-circleX;
}
if(save_current_speedX){
  //keep track of current speed when the ball is not between the side and current speed
curr_speedX=speedX;
}
if(circleX==0||circleX==width){
  //get back to the previous speed
speedX=curr_speedX;
speedX++;
dirX*=-1;
save_current_speedX=true;
}//X part bouncing

if(circleY!=0&&circleY<speedY){
save_current_speedY=false;
speedY=circleY;
}
if(circleY!=height&&circleY>height-speedY){
save_current_speedY=false;
speedY=height-circleY;
}
if(save_current_speedY){
curr_speedY=speedY;
}
if(circleY==0||circleY==height){
speedY=curr_speedY;
speedY++;
dirY*=-1;
save_current_speedY=true;
}//Y part bouncing

}

void move() {
  //print(dirX);
  //println(dirY);
  circleX+=speedX*dirX;
  circleY+=speedY*dirY;
}
