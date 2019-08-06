float r = 15.0;

float vx = 1.0;
float vy = -9.0;
float ax = 0.0;
float ay = 0.098;

float x = 0.0;
float y = 0.0;

int i = 0;

void setup() {
  size( 512, 512 );
  noStroke();
  ellipseMode( RADIUS );

  x = r;
  y = height - r;
}


void draw() {
  fill( 0, 10 );
  rect( 0, 0, width, height );
  fill( 255 );
  ellipse( x, y, r, r );

  vx += ax;
  x += vx;
  
  vy += ay;
  y += vy;
  
  if ( x > width - r ) {
    delay( 10000 );
  } else if ( x < r ) {
    //delay( 10000 );
  }

 if ( y > height + r ) {
    vy *= -1.0;
  } else if ( y < r ) {
    vy *= -1.0;
  }
  
  saveFrame("junmpingBall." + i++ + "-#####.tif");
  
  //println("vy : " + vy );
}
