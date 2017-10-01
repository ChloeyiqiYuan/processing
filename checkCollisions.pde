void checkCollisions(){
  if(pos.x>-100){
    spd.x*=1;
  }
  if(pos.y>-100){
    pos.y=-100;
    spd.y*=-0.8;
  }
}