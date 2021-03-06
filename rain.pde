ArrayList<Particle> particles;
PVector spd=new PVector(0.7,0.4);
PVector spd2=new PVector(3,0.5);
PVector pos=new PVector();//null pointer at this
PVector pos2=new PVector();
PVector pos3=new PVector();
PVector phys;
PVector phys2;

void setup() {
  size(800, 600);
  ellipseMode(RADIUS);
  noFill();
  particles = new ArrayList<Particle>();
  
  pos.x=-400;
 //give a value other than default value
  pos.y=-400;
  pos2.x=-400;
  pos2.y=-400;
  pos3.x=-300;
  pos3.y=-300;
  phys=new PVector(2,0.1);//(grav,fric)
  phys2=new PVector(1,0.5);
}

void draw() {
  //background(238,232,170);
 // backGround();
 
  backGround();
  fill(random(50,100),149,random(200,240),10);
  if (particles.size() < 200) 
  particles.add(new Particle());
  for (Particle p : particles) {
    p.update();
    p.display();
    
  }
  
  //translate(550, 450);
   //flower(50,14,550,450);
  
  flower();
  
  //flower(40,10,450,600);
  leap();
  mountain();
  
  

  //backGround();
  //flower(40,10,450,300);
  //road();
}


void backGround(){
  fill(135,206,235,20);//lake blue
  noStroke();
  ellipse(300,600,random(0,500),random(0,300));
  fill(173,216,230,20);//sky blue
  noStroke();
  fill(255,random(200,255),0,20);//sun
  //ellipse(random(750,800),random(0,50),50,50);
  //rect(500,100,800,300);
 // ellipse(random(0,800),random(300,600),10,10);
  
}


void flower(){
  translate(550, 500);
  //background(55);
  //fill(255,20,147);
  noStroke();
  fill(255,105,180);
  int K = 50, n=12;
  beginShape();
  for (float i=0; i<TWO_PI; i+=.01) {
    float r = K * cos(n*i);
    float x1 = r * cos(3*i);
    float y1 = r * sin(i); 
       if (y1<0){
         vertex(x1, y1);
       }
  }
  endShape();
 
  
 }
 



void leap(){
  fill(85,107,47,15);
  ellipse(20, 10,50,10);
  ellipse(-50,50,100,30);
  ellipse(-250,-50,70,30);
  }
  
void bird(){
  fill(0);
  noStroke();
  ellipse(pos3.x,pos3.y,20,20);
  //pos3.add(spd2);
   pos3.x=pos3.x-spd2.x;
   pos3.y=pos3.y+spd2.y;
  
}
void mountain(){
  fill(128,128,128,50);
  //noStroke();
  ellipse(pos.x,pos.y,40,40);
  ellipse(pos2.x,pos2.y,40,40);
//ong hand form
  pos.x=pos.x-spd.x;
  pos.y=pos.y+spd.y;//operation right to left
//pos+=spd; what we would do in c++
//more efficient form
  spd.y+=phys.y;//change movement speed and accerate
  pos2.add(spd);
  checkCollisions();
  checkCollisions2();
  
}
  





class Particle {//rain
  float xp, yp, vy, ty, r, tr, w;
  Particle() {
    reset();
  }
  void reset() {
    xp = random(width);
    yp = random(-250, 0);
    vy = random(2, 4);
    ty = yp + height;
    r = 0;
    tr = 50;
    w = random(.1, 2);
  }
 
  void update() {
    if (yp < ty) {
      yp += vy;
    } else {
      r++;
    }
    if (r > tr) reset();
  }
  void display() {
    strokeWeight(w);
    //fill(100,149,237);//rain
    if (yp < ty) {
      stroke(255);
      point(2*xp, yp);
    } else {
      stroke(255, map(r, 0, tr, 255, 0));
      ellipse(xp, yp, r, r*.5);
    }
  }
}