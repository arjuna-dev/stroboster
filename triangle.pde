class Triangle{
  
  float x;
  float noisecalator;
  float noiseval;
  float figNumber;
  float speed;
  float squeak;
  float numberOfFigs;
  float rndmy;
  
  Triangle(float speedInput){
    x = 0;
    noisecalator = random(5)*0.001;
    noiseval = 0;
    figNumber = random(3, 10);
    speed = speedInput;
    squeak = random(1000);
    numberOfFigs  = random(6, 21);
    rndmy = int(random(2));
  }
  
  void create(){
    fill(noise(noiseval)*100, 80, 100, 80);
    for (float c=-TWO_PI; c<TWO_PI; c+=TWO_PI/numberOfFigs) {
      pushMatrix();
      rotate(c+squeak);
      if (rndmy==0.0){
      triangle(x, 0, 50+x, -50, 50+x, 50);
      } else {
      circle(x, x, 50);
      }
      popMatrix();
      }
  }
  
  void move(){
    x+=speed;
  }
  
  void colorize(){
    noiseval = noiseval + noisecalator;
  }

}
