void setup(){
  fullScreen();
  background(255);
  x = width / 2;
  y = height / 2;
  hour = hour();
  r = random(255);
  g = random(255);
  b = random(255);
  
}

float x,y,px,py;
int hour;
float length = 4;
float r,g,b;

void draw(){
  px = random(length) - length / 2;
  py = random(length) - length / 2;
  while(x < 0 && x + px < 0||x > width&&x + px > width){
    px = random(length) - length / 2;
  }
  while(y < 0 && y + py < 0||y > height&&y + py > height){
    py = random(length) - length / 2;
  }
  r += random(minute()) - minute() / 2;
  if(r < 0) r = 0;
  else if(r > 255) r = 255;
  g += random(minute()) - minute() / 2;
  if(g < 0) g = 0;
  else if(g > 255) g = 255;
  b += random(minute()) - minute() / 2;
  if(b < 0) b = 0;
  else if(b > 255) b = 255;
  stroke(r,g,b);
  line(x,y,x + px,y + py);
  x += px;
  y += py;
  if(hour != hour()){
    save();
    hour = hour();
    length = hour() * 3;
    reset();
  }
}

void keyPressed(){
  if(key == 's' || key == 'S'){
    save();
  }else if(key == 'r' || key == 'R'){
    reset();
  }
}

void save(){
  String path  = System.getProperty("user.home") + "/デスクトップ/screenshot/" + year() + month() + day() + hour() + minute() + second() + ".jpg";
  save(path);
}

void reset(){
  setup();
}