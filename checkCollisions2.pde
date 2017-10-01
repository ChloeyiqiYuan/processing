void checkCollisions2(){
   if(pos2.x>-200){
    spd.x*=1;
  }
  if(pos2.y>-200){
    pos2.y=-200;
    spd.y*=-0.8;
  }
}