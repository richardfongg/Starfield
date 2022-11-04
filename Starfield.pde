class notAstar extends starstuff {
  notAstar() {
    myW = 50;
    myH = 50;
    myX = 0;
    myY = 0;
    mySpeed = (Math.random())+2;
    myAngle = (Math.random()*2*Math.PI);
    myC1 = 165;
    myC2 = 42;
    myC3 = 42;
  }
}

class starstuff {
  double myH, myW, myX, myY, mySpeed, myAngle, myC1, myC2, myC3;
  starstuff() {
    myW = 5;
    myH = myW;
    myX = 400;
    myY = 400;
    mySpeed = (Math.random()-0.5);
    myAngle = (Math.random()*2*Math.PI);
    myC1 = (Math.random()*256);
    myC2 = (Math.random()*256);
    myC3 = (Math.random()*256);
  }
  void show() {
   fill((int)myC1, (int)myC2, (int)myC3);
   ellipse((float)myX, (float)myY, (float)myW, (float)myH);
   if( (myX > 800) || (myY > 800) || (myX < -50) || (myY < -50) ){
     myX = -50;
     myY = -50;
     mySpeed = mySpeed + 5;
   }
   if(mySpeed > 300){
     background(255);
     textSize(40);
     text("Too fast womp womp womp :(", 100, 400);
   }
     
  }
  void move() {
    myX += mySpeed;
    myY += mySpeed;
    myX = myX + Math.cos(myAngle)*Math.random();
    myY = myY + Math.sin(myAngle)*Math.random();
    
  }
}


starstuff [] dog = new starstuff[500];

void setup() {
  size(800, 800);
  noStroke();
  for (int i = 0; i<dog.length-1; i++)
    dog[i] = new starstuff();
  dog[dog.length-1] = new notAstar();
}
void draw() {
  background(0);
  for (int i = 0; i<dog.length; i++) {
    dog[i].show();
    dog[i].move();
  }
}
