PImage [] background = new PImage [2];
PImage [] earthImages = new PImage [2];
PImage [] moonImages = new PImage [2];
int earthradius = 50;
int moonradius = 25;

int pft, pfl;
float angleT, angleL;

void setup(){
  size(1340, 680);
  //fondo
  background [0] = loadImage("images/stars.png");
  background [1] = loadImage("images/sun_orange.png");
  //Tierra
  earthImages[0] = loadImage("images/earth1.png");
  earthImages[1] = loadImage("images/earth2.png");
  //Luna
  moonImages[0] = loadImage("images/moon1.png");
  moonImages[1] = loadImage("images/moon2.png");
  //moonImages[2] = loadImage("images/moon3.png");
  //moonImages[3] = loadImage("images/moon4.png");
}

void draw(){
  image(background[0],0,0,width,height);
  image(background[1],width/2+width/4,height/2,100,100);
  text("center",width/2, height/2);
  
  //Trayectoria tierra
  float txpos = int((width/2)+ 3*(width/8)*cos(angleT));
  float typos = int(-(height/2)+(height/3)*sin(angleT));
  print("EARTH: xpos: "+txpos+" ypos: "+typos+" angleT: "+angleT+" angleL: "+angleL+" \n");
  
  //Trayectoria de la luna
  float lxpos = txpos-((6/5)*(earthradius))+((2.3*(earthradius))*cos(angleL));
  float lypos = typos+(2*earthradius*sin(angleL));
  
  image(earthImages[pft],txpos,-typos, earthradius, earthradius);
  image(moonImages[pfl],lxpos,-lypos, moonradius, moonradius);
  //Número de fotogramas, se reinicia cuando ha pasado por todos
  if(++pft>1) pft=0;
  if(++pfl>1) pfl=0;
  //Velocidad y avance
  if((angleT +=radians(3))> radians(355)) angleT = 0;
  if((angleL +=radians(10))> radians(355)) angleL = 0;
  delay(60);
 
}
