// Code by Rupert Russell 14 May 2018
// As allways this may contain bugs, and it's as elegant as it could be.
// MIT License
// Islamic Pattern 001
// https://github.com/rupertrussell/Islamic_001
// see: Muslim rule and compass: the magic of Islamic geometric design
// https://www.theguardian.com/science/alexs-adventures-in-numberland/2015/feb/10/muslim-rule-and-compass-the-magic-of-islamic-geometric-design
// Artwork at Redbubble https://www.redbubble.com/people/rupertrussell/works/31723948-islamic-pattern-001

boolean noLooping = true;
int hexSize = 120; //  100 no overlap
int counter = 0;
float startX;
float startY;
float endX;
float endY;
float x;
float y;
float h = 150; 
float k = 150;
float r = 40;
boolean start = true;
int count = 0;
double step;
float yGap = 161;  // 160

// 2875 x 3900 T-Shirt
// 3502 x 2385 Journal
// 1765 x 2481 notebook
// 2475 x 2475 poster 
// 2940 x 2940 clock
// 5748 x 5748 scarves
// 6310 x 6230 A-Line Dress
// 7632 x 6480 Tapestries
// 2376 x 2024 Travel Mug
// 2700 x 1624 Tall Mug
// 9144 x 6096 extra large print
// 7632 x 6480 Duvet Covers
// 2875 x 3900 Long T-Shirt
// 2696 x 3305 iPad Case
// 4600 x 3000 laptop Skin
// 4600 x 3000 Phone Cases & Skins
// 4625 × 4625 Floor Pillow 36″×36″
// 2788 × 2788 pixels for the large pillow
// 2950 × 2950 Large tote bag
// 4600 × 3000 Pouch
// 3060 × 3060 Art Board Square

int widthSize = 2700; 
int heightSize = 1624;

int repeatXtimes = floor(widthSize / 144) - 1; // width
int repeatYtimes = floor(heightSize / 164) - 1; // height

//int repeatXtimes;
//int repeatYtimes;
int heightOffset = heightSize - 500; // height - smaller moves down more

int widthOffset = 140;
float leftMargin;

// How to calculate points on a circle
// Based on code from http://www.mathopenref.com/coordcirclealgorithm.html

void setup() {
  leftMargin = 1;

  strokeWeight(9); 
  size(2700, 1624); // width x height
  smooth();
  if(noLooping == true){
  noLoop();
  }
  else
  {
    loop();
  }
  
  strokeCap(ROUND);
}

void draw() {
  repeatYtimes = repeatYtimes -1;
  repeatXtimes = repeatXtimes -0;

  background(0);
  println("repeatXtimes = " + repeatXtimes);
  println("repeatYtimes = " + repeatYtimes);
  for (int i = 0; i <= repeatXtimes; i++) {
    if (isEven(i)) {
      stack(leftMargin + i * widthOffset, heightOffset, repeatYtimes );
    } else {
      stack(leftMargin + i * widthOffset, heightOffset + 80, repeatYtimes + 1);
    }
  }

  save("tall-mug-" + hexSize + ".png");
  hexSize = hexSize + 10;
  if (counter > 150) {
    exit();
  }
  counter = counter + 10;

  if (noLooping == true) {
    exit();
  }
} // end draw


void hexagon(int radius) {
  count = 0;
  start = true;

  step = 2 * PI/6; 
  for (float theta=0; theta < 2 * PI; theta += step) {
    x = h + radius * cos(theta);
    y = k - radius * sin(theta); //note 2.
    point(x, y);

    if (start == true) {
      startX = x;
      startY = y;
      if (count != 0) {
        line(endX, endY, startX, startY);
      }
    }

    if (start == false) {
      endX = x;
      endY = y;

      line(startX, startY, endX, endY);
    }
    count ++;
    if (start == true) {
      start = false;
    } else {
      start = true;
    }
  } // end void hexagon
}

void stack(float transX, float transY, int num) { 
  pushMatrix();
  translate(transX, transY);
  for (int i = 0; i < num; i++) {
    hex();
    translate(0, -yGap);
  }
  popMatrix();
} // end void stack

void hex() {
  stroke(255);
  hexagon(hexSize);
} // end void hex

boolean isEven(int n) {
  return n % 2 == 0;
}

boolean isOdd(int n) {
  return n % 2 != 0;
}
