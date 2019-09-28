import processing.sound.*;
SoundFile file;

int[] arrbro = new int[10];
//Triangle[] triangles = new Triangle[10];
ArrayList <Triangle> triangles = new ArrayList <Triangle>();
int f = 0;
int j = 0;
int freq = 9;
int numberOfShapes = 9;
int speed = 1;
float hm = 0;

//Setup
void setup(){
  // Load a soundfile from the /data folder of the sketch and play it back
  file = new SoundFile(this, "sample.mp3");
  file.play();
  
  size(600,600);
  background(31);
  noStroke();
  colorMode(HSB, 100);
//Instantiate triangle objects and store them in the ArrayList
  for(int i=0; i<numberOfShapes; i++){
    triangles.add(new Triangle(speed));
  }
}

void draw(){
  
  background(noise(hm+=0.001)*100, 80, 100, 80);
  translate(width/2, height/2);

//Every certain amount of frames add a new shape to be drawn
  if(frameCount>=f){
    j++;
    f+=width/freq;
    if(j>=numberOfShapes+1){
      j=numberOfShapes;
    }
  }
  
  for(int k=0;k<j;k++){
    triangles.get(k).create();
    triangles.get(k).move();
    triangles.get(k).colorize();
  }
  
  
//Delete old objects (out of bounds) and create new ones
//AKA RESPAWN
  for(int i=0; i<triangles.size()-1;i++){
    if(triangles.get(i).x>width/2+100){
      triangles.remove(i);
      triangles.add(new Triangle(speed));
    }
  }
}
