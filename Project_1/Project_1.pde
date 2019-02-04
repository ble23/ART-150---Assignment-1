PImage cursor;
PImage BSOD;
PImage kirby;

float distort = 0;

int time = 0;

boolean cursorEnable = true;
int cursorMode = 1;

void setup(){

   fullScreen();
   
   cursor = loadImage("cursor.png");
   BSOD = loadImage("bsod.jpg");
   kirby = loadImage("kirby.png");
   
   background(255);
   for (int i = 0; i < 10; i++)
     image (kirby, random(width - kirby.height), random(height-kirby.height));
   textSize(50);
   fill (0);
   text ("Hold left click and connect the Kirbys you see on screen.", 100, 100);
    
}

void draw(){

  if (mousePressed){
    if(cursorEnable && cursorMode == 1) 
      ink();
    if (cursorEnable && cursorMode == 2)
      image(cursor, mouseX, mouseY, 24, 38);
    time++;
  }
  
  if (time == 120)
    cursorMode = 2;
  
  if (time >= 300){
    cursor(WAIT);
    cursorEnable = false;
    time++;
  }
  if (time >= 400){
    noCursor();
    image (BSOD, 0, 0, width, height);
  }
}

void ink(){
  noStroke();
  ellipse(mouseX, mouseY, 5, 5);
  fill (0);
}
