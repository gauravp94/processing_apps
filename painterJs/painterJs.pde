float px, py, px2, py2;
float angle, angle2;
float radius = 50;
float frequency = 2;
float frequency2 = 2;
float x, x2;
PFont f, flame, sonic, ak, erase;
PFont clear, paw, stamp, saveWork;
PFont colorG, snaky,intr;
PImage st, img,back;
Maxim maxim,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13;
AudioPlayer player,splash,clr,stmp,era,sav,ca,chp,ld,rs,de,sho,buton;
int prev_box=-1;
int prev_row=-1;//variable is used to make the olg config of gun back to red
void setup()
{
  ///
  maxim = new Maxim(this);
  player = maxim.loadFile("snake_sound.wav");
  player.setLooping(false);
  m4 = new Maxim(this);
  era = m4.loadFile("eraser.wav");
  era.setLooping(false);
  m2 = new Maxim(this);
  splash = m2.loadFile("splash_color.wav");
  splash.setLooping(false);
  m3 = new Maxim(this);
  stmp = m3.loadFile("stamping.wav");
  stmp.setLooping(false);
    m5 = new Maxim(this);
  sav = m5.loadFile("saving_work.wav");
  sav.setLooping(false);
     m6 = new Maxim(this);
  ca = m6.loadFile("cat.wav");
  ca.setLooping(false);
     m7 = new Maxim(this);
  clr = m7.loadFile("clear.wav");
  clr.setLooping(false);
   m8 = new Maxim(this);
  chp = m8.loadFile("chirp.wav");
  chp.setLooping(false);
   m9 = new Maxim(this);
  ld = m9.loadFile("lead.wav");
  ld.setLooping(false);
   m10 = new Maxim(this);
  rs = m10.loadFile("flower.wav");
  rs.setLooping(false);
   m11 = new Maxim(this);
  de = m11.loadFile("def.wav");
  de.setLooping(false);
  m12 = new Maxim(this);
  sho = m12.loadFile("gun_shot.wav");
  sho.setLooping(false);
  m13 = new Maxim(this);
   buton = m13.loadFile("button.wav");
  buton.setLooping(false);
  ////
  img = loadImage("asd.png");
  back = loadImage("bck.jpg");
  st = loadImage("smi.png");
  //img.mask(st);
  f = createFont("Arial", 16, true);
  clear = createFont("Arial", 16, true);
  flame = createFont("Arial", 16, true);
  colorG = createFont("Arial", 16, true);
  sonic = createFont("Arial", 16, true);
  ak = createFont("Arial", 16, true);
  erase = createFont("Arial", 16, true);
  paw = createFont("Arial", 16, true);
  snaky = createFont("Arial", 16, true);
  stamp = createFont("Arial", 16, true);
  saveWork = createFont("Arial", 16, true);
  colorG = createFont("Arial", 16, true);
  intr = createFont("Arial", 16, true);
  size(900, 900);
}
int flag2=0;
int flag3=0;
int flag=0;
void draw()
{
  if (flag==0)//introduction page
  {
    
   
    fill(255);
    image(back,0,0,900,900);
    textFont(f, 40);
    fill(0);
    text("Funny Painter", 360, 200);
    textFont(intr, 20);
    fill(0);
    //background(255, 0, 0, 127);
    text("Use different kinds of effects that you can apply to make your own funny picture, which you can save later", 100, 400);
    textFont(intr, 20);
    fill(0);
    //background(255, 0, 0, 127);
    text("Click anywhere to start", 100, 500);
    //background(255);
  }
  if (mousePressed && flag==0)//transisiton
  {
    flag=1;
    ld.cue(0);
    ld.play();
  }
  if (flag==1 &&  flag2==0)//clearing the screen
  {

    image(img, 0, 0, 900, 800);//drawing pad
    fill(255);
    stroke(0);
    rect(0, 800, 900, 100);
    fill(0);
    /* 
     This part of code be shortened by using a loop rather than doing serially
     */
     clr.cue(0);
     clr.play();
    stroke(0);
    fill(255, 0, 0, 75);
    rect(0, 800, 180, 50);
    textFont(clear, 20);
    fill(0);
    text("Clear Screen", 50-5, 820+10);
    fill(0, 0, 255, 75);
    rect(180, 800, 180, 50);
    textFont(colorG, 20);
    fill(0);
    text("Color Gun", 250-10, 820+10);
    fill(0, 0, 255, 75);
    rect(360, 800, 180, 50);
    textFont(flame, 20);
    fill(0);
    text("Flowery", 450-30, 820+10);
    fill(0, 0, 255, 75);
    rect(360+180, 800, 180, 50);
    textFont(sonic, 20);
    fill(0);
    text("AK 47", 450+120, 850-18);
    fill(0, 0, 255, 75);
    rect(360+360, 800, 180, 50);
    textFont(paw, 20);
    fill(0);
    text("Cat paws", 450+320, 850-18);
    //bottom panel of button's just copy paste :p
    fill(0, 0, 255, 75);
    rect(0, 850, 180, 50);
    textFont(snaky, 20);
    fill(0);
    text("Snaky", 50+15, 850+35);
    fill(0, 0, 255, 75);
    rect(180, 850, 180, 50);
    textFont(stamp, 20);
    fill(0);
    text("Stamp", 250-5, 850+35);
    fill(0, 0, 255, 75);
    rect(360, 850, 180, 50);
    textFont(flame, 20);
    fill(0);
    text("Eraser", 450-25, 850+35);
    fill(0, 0, 255, 75);
    rect(360+180, 850, 180, 50);
    textFont(flame, 20);
    fill(0);
    text("Save Your Work", 450+120, 850+35);
    fill(255, 0, 255, 75);
    rect(360+360, 850, 180, 50);
    textFont(flame, 20);
    fill(0);
    text("Default", 450+330, 850+35);
    //end of the panel
    flag2=1;
    flag3=0;
  }
  else if (flag==1 && flag2==1)//normal operation
  {
    if (mousePressed)
    {
      buton.cue(0);
      buton.play();
      //if it is on a button
      if (mouseY>800)
      {
        if (mouseY<850)
        {
          if (mouseX<180)//clearing the screen
          {
            flag2=0;
            fill(0);
            rect(360+360, 850, 180, 50);
            fill(0, 255, 0, 75);
            rect(360+360, 850, 180, 50);
            textFont(flame, 20);
            fill(0);
            text("Cleared", 450+330, 850+35);
            println("clearing");
          }
          else if (mouseX>180 && mouseX<360) {
            println("color gun");
            fill(0, 255, 0, 0);
            rect(180, 800, 180, 50);
            fill(0);
            rect(360+360, 850, 180, 50);
            fill(0, 255, 0, 75);
            rect(360+360, 850, 180, 50);
            textFont(flame, 20);
            fill(0);
            text("Color Gun", 450+330, 850+35);
            flag3=1;
          }
          else if (mouseX>360 && mouseX<540)
          {
            println("flamethrower");
            flag3=2;
            fill(0);
            rect(360+360, 850, 180, 50);
            fill(0, 255, 0, 75);
            rect(360+360, 850, 180, 50);
            textFont(flame, 20);
            fill(0);
            text("flowers", 450+330, 850+35);
          }
          else if (mouseX>540 && mouseX<720)
          {
            println("flamethr4444ower");
            flag3=3;
            fill(0);
            rect(360+360, 850, 180, 50);
            fill(0, 255, 0, 100);
            rect(360+360, 850, 180, 50);
            textFont(flame, 20);
            fill(0);
            text("Machine Gun", 450+330, 850+35);
          }
          else
          {
            fill(0);
            rect(360+360, 850, 180, 50);
            fill(0, 255, 0, 75);
            rect(360+360, 850, 180, 50);
            textFont(flame, 20);
            fill(0);
            text("Cat Paws", 450+330, 850+35);
            println("flamethrow555er");
            flag3=4;
          }
        }
        else if (mouseY>850)
        {
          //bottom panel of buttons
          //println("button press");
          if (mouseX<180)//clearing the screen
          {
            flag3=5;
            println("snaky");
            fill(0);
            rect(360+360, 850, 180, 50);
            fill(0, 255, 0, 75);
            rect(360+360, 850, 180, 50);
            textFont(flame, 20);
            fill(0);
            text("Wavy pattern", 450+330, 850+35);
          }
          else if (mouseX>180 && mouseX<360) {
            println("stamp erun");
            flag3=6;
            fill(0);
            rect(360+360, 850, 180, 50);
            fill(0, 255, 0, 75);
            rect(360+360, 850, 180, 50);
            textFont(flame, 20);
            fill(0);
            text("Stamp", 450+330, 850+35);
          }
          else if (mouseX>360 && mouseX<540)
          {
            println("eraser hrower");
            flag3=7;
            fill(0);
            rect(360+360, 850, 180, 50);
            fill(0, 255, 0, 75);
            rect(360+360, 850, 180, 50);
            textFont(flame, 20);
            fill(0);
            text("Eraser", 450+330, 850+35);
          }
          else if (mouseX>540 && mouseX<720)
          {
            println("flsaving4444ower");
            flag3=8;
            fill(0);
            rect(360+360, 850, 180, 50);
            fill(0, 255, 0, 75);
            rect(360+360, 850, 180, 50);
            textFont(flame, 15);
            fill(0);
            text("Saving...Done!", 450+330, 850+35);
            sav.cue(0);
          sav.play();
          }
          else
          {
            println("flamethrow555er");
            flag3=9;
            fill(0);
            rect(360+360, 850, 180, 75);
            fill(0, 255, 0, 100);
            rect(360+360, 850, 180, 50);
            textFont(flame, 15);
            fill(0);
            chp.cue(0);
            chp.play();
            text("It is not a button!!", 450+330, 850+35);
          }
        }
      }

      //or else draw according to the configuration
      else
      {
        if (flag3==1)//color gun
        {
          splash.cue(0);
          splash.play();
          strokeWeight(20);
          stroke(255, 0, 0);
          point(mouseX + random(-20, 20), mouseY + random(-20, 20) );
          stroke(0, 0, 255);
          point(mouseX + random(-20, 20), mouseY + random(-20, 20) );
          stroke(0, 255, 0);
          point(mouseX + random(-20, 20), mouseY + random(-20, 20) );
          stroke(0);
          strokeWeight(1);
        }
        else if (flag3==2)//flamethrower turned out to be flower like
        {
          rs.cue(0);
          rs.play();
          fill(255, 0, 0, 75);
          stroke(255, 0, 0);
          strokeWeight(2);
          int radius=20;
          for (float ct=0;ct<TWO_PI;ct++)
          {
            //println("inside");
            ellipse(mouseX+radius*sin(ct), mouseY + radius*cos(ct), 30, 30);
          }
          strokeWeight(7);
          stroke(0);
          point(mouseX, mouseY);
          stroke(0, 255, 0, 50);
          stroke(0);
          strokeWeight(1);
        }
        else if (flag3==3)//ak47
        {
          strokeWeight(4);
          stroke(0);
          sho.cue(0);
          sho.play();
          
          for (int i=0;i<15;i++)
          {
            point(mouseX + random(-20, 20), mouseY + random(-20, 20));
          }
          strokeWeight(1);
          stroke(0);
          strokeWeight(1);
        }
        else if (flag3==4)//cat paws
        {
          //implement the equation of a line and just shift it up and down to create three paws
          //reflect the eqn wrt y axis to get a simmilar pattern
          //here x + y = alpha taken by default as the eqn.
          ca.cue(0);
          ca.play();
          strokeWeight(5);
          line(mouseX + 20+50 , mouseY + 10+90, mouseX+50,mouseY);
          line(mouseX + 30+30+50 , mouseY + 10+90, mouseX+10+30+50,mouseY);
          line(mouseX + 40+50+50 , mouseY + 10+90, mouseX+20+50+50,mouseY);
          
          stroke(0);
          strokeWeight(1);
        }
        else if (flag3==5)//snaky 
        {
          //for this just a sin wave is drawn for random length
          //int i ;
          float  r=random(100, 200);
          strokeWeight(2);
          player.cue(0);
          player.play();
          // draw static curve - y = sin(x)
          for (int i = 0; i< width; i++) {
            px2 = mouseX + cos(radians(angle2))*(radius);
            py2 = mouseY +sin(radians(angle2))*(radius);
            stroke(random(0, 255), random(0, 255), random(0, 255));
            point(mouseX+i, py2+random(0, 10) );
            angle2 -= frequency2;
          }
          stroke(0);
          strokeWeight(1);

          strokeWeight(1);
        }
        else if (flag3==6)//stamp
        {
          if (mousePressed)
          {
            stmp.cue(0);
            stmp.play();
            image(st, mouseX, mouseY, 50, 50);
          }
          stroke(0);
          strokeWeight(1);
        }
        else if (flag3==7)//eraser
        {

          strokeWeight(50);
          fill(255);
          stroke(255);
          if(mousePressed)
          {
            era.cue(0);
            era.play();
          point(mouseX, mouseY);
          }
          strokeWeight(1);
          stroke(0);
        }
        else if (flag3==8)//save your workd
        {
          
          save("mycreation.png");
        }

        else
        {
          strokeWeight(10);
          stroke(random(120, 200), random(120, 200), random(120, 200));
          point(mouseX, mouseY);
          stroke(0);
          de.cue(0);
          de.play();
          strokeWeight(1);
        }
        println("draw");
      }
    }
  }
}

