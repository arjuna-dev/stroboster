int[] arrbro = new int[10];
//Triangle[] triangles = new Triangle[10];
ArrayList <Triangle> triangles = new ArrayList <Triangle>();
int f = 0;
int j = 0;
int objectsInScreenAtOneGivenMoment = 4;
int numberOfShapes = 7;
int speed = 1;

//Setup
void setup(){
  size(500,500);
  background(31);
  noStroke();
  colorMode(HSB, 100);
//Instantiate triangle objects and store them in the ArrayList
  for(int i=0; i<numberOfShapes; i++){
    triangles.add(new Triangle(speed));
  }
}

void draw(){
  background(31);
  translate(width/2, height/2);

//Every certain amount of frames add a new shape to be drawn
  if(frameCount>=f){
    j++;
    f+=width+100;
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
