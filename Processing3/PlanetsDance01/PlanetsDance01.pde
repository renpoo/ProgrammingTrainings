float r1 = 1.0 * 240;
float r2 = 0.7233 * r1;
float k = 1.6255;
float T = 8;
float step = 9;
int num = int( 360 / step * T );
float[] t = new float[ num ];
float dt = 2 * PI / 360 * step;
int j = 0;

void setup()
{
  size( 500, 500 );
  smooth();
  background( 255 );

  for ( int i = 0; i < num; i++ ) {
    t[ i ] = dt * i;
  }
}

void draw()
{   //<>//
  stroke( 160, 200, 255 ); 

  if ( j >= num ) {
    //j -= num;
    delay( 1000 ); //<>//
    //background( 255 );
    exit();
  } else {
    line( r1 * cos(t[j]) + width/2, r1 * sin(t[j]) + height/2, r2 * cos(k * t[j]) + width/2, r2 * sin(k * t[j]) + height/2 );
    j++;
    //save("img" + j + ".tif");
  }
}
