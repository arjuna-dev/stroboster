import processing.sound.*;
SoundFile file;

ArrayList <Triangle> triangles = new ArrayList <Triangle>();
int f = 0;
int j = 0;
int freq = 4;
int speed = 1;
float hm = 0;
int minFreq=20;
int maxFreq=30;
float y = 0;

//Setup
void setup(){
 
  // Load a soundfile from the /data folder of the sketch and play it back
  file = new SoundFile(this, "sample.mp3");
  file.play();
  
  //normal stuff
  size(600,600);
  background(31);
  noStroke();
  colorMode(HSB, 100);
  
  println(sin(180));
  println(sin(180));
  println(sin(180));
}

void draw(){
  
  background(noise(hm+=0.001)*100, 80, 100, 80);
  translate(width/2, height/2);

//Every certain amount of frames add a new shape to be drawn
  if(frameCount>=f){
    triangles.add(new Triangle(speed));
    f+=int(map(cos(y),cos(180),cos(0), 1000/minFreq, 1000/maxFreq));
    y++;
    println(f);
  }
  
  
  
  for(int k=0;k<triangles.size();k++){
    triangles.get(k).create();
    triangles.get(k).move();
    triangles.get(k).colorize();
  }
  
  
//Delete old objects (out of bounds) and create new ones
//AKA RESPAWN
  for(int i=0; i<triangles.size()-1;i++){
    if(triangles.get(i).x>width/2+100){
      triangles.remove(i);
    }
  }
}
