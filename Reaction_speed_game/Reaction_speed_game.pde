import controlP5.*;

ControlP5 cp;

boolean pause = true;
boolean text = true;
int tussentijd = 0;
int voortijd = 0;
int natijd = 0;
int count = 0;
int tijd = 0;
float X = 200;
float Y = 200;

Button a;

Button b;

void setup() {
  size(500, 500);
  cp = new ControlP5(this);
  a = cp.addButton("Yes")
    .setPosition(-180, -200)
    .setSize(50, 50)
    .setCaptionLabel("Yes");
  b = cp.addButton("No")
    .setPosition(-180, -200)
    .setSize(50, 50)
    .setCaptionLabel("No");
  //rect(mouseX, mouseY, 100, 100);
  fill(100, 100);
}

void draw() {
  background(0, 150, 250);
  cp = new ControlP5(this);
  voortijd = natijd;
  natijd = millis();

  tussentijd = natijd - voortijd;

  if (pause == false) {
    tijd += tussentijd;
    println(tijd);
  }

  rect(X, Y, 100, 100);
  fill(100, 100);

  if (text == true) {
    textSize(25);
    text("Press the Cube to start", 140, 180);
  }
  if (tijd > 10000) {
    pause = true;
    X=-100;
    Y=-100;
    println("time's Up!");
    println(count - 1);
    textSize(40);
    text(count - 1, 400, 400);

    a.setPosition(180, 200);

    b.setPosition(280, 200);


    fill(100, 100, 100);
    textSize(20);
    text("Would you like to try again?", 140, 150);
  }
  fill(100, 100);
}

void Yes() {
  pause = false;
  tijd = 0;

  X = 100;
  Y = 100;

  a.setPosition(-100, -100);

  b.setPosition(-280, -200);
  
  count = 1;
}

void No() {
  stop();
}

void mousePressed() {
  if (mouseX > X && mouseX < X + 100) {
    if (mouseY > Y && mouseY < Y + 100) {
      if (pause == true)
        tijd = 0;
      X=mouseX;
      Y=mouseY;
      X=random(400);
      Y=random(400);
      text = false;
      pause = false;
      fill(100, 100);
      count++;
    }
  }
}


//void keyPressed() {
//  if (keyCode == 80) {
//  if (pause == false)
//{
//      println("pauze");
//println(tijd);
// pause = true;
//  } else {
//
//      println("test");
//      pause = false;
//}
// }
//}
