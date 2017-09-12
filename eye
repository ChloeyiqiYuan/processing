One[] one;
int n=10;


void setup() {
  size(800, 600);
  one=new One[n];

  for (int i=0; i<n; i++) {
    one[i]=new One(50+20*4*sqrt(0.6*(i+1)), 0.01*i+0.01);
  }
}




void draw() {
  //background(0);
  line();
  //frameRate(10);
  for (int i=0; i<n; i++) {
    one[i].center();
  }
}


class One {
  float s;
  float r;
  float z=0.1;
  One(float tr, float ts) {
    s=ts;
    r=tr;
  }

  void center() {
    if ((z>2*PI)||(z<0)) {
      s*=-1;
    }
    fill(255);
    stroke(255);
    strokeWeight(3);
    strokeJoin(ROUND);
    noFill();
    arc(400, 300, r-20, r-20, PI, PI+z);
    z+=s;
  }
}


void line() {
  noStroke();
  fill(100, 149, 237, 5);//blue
  ellipse(400, 300, 400, 400);
  fill(240,230,140,10);//yellow
  ellipse(450,250,300,300);
  fill(100, 149, 237,3);//light blue
  ellipse(400,300,500,500);
  fill(240,255,255);//
  ellipse(random(0, 800), random(0, 600), 20, 20);
  //fill(240,255,255);
  rect(random(100, 700), random(100, 500), 20, 20);
  fill(0, 0, 139);//deep blue
  ellipse(random(350, 450), random(250, 350), 20, 20);
 

  strokeWeight(10);
}
