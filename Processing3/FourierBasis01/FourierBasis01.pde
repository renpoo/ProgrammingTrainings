int rMin = 16;
int rMax = 256;
int rDiff = rMax - rMin;
int N = 32;
float t = 0;
float dt = 0.1;
float w = 1.0;

void setup()
{
  size( 512, 512 );
}


void draw()
{
  clear();
  for ( int i = 0; i < N; i++ ) {
    float r = rDiff / N * ( i + 1 );
    w = -1.0 / N * ( i + 1 );
    circle( ( r + rMin ) * cos( w * t ) + width/2, ( r + rMin ) * sin( w * t ) + height/2, 10 );  
  }
  t += dt;

  //saveFrame("FourierBasis01.####.tif");
  
  //if ( t > 500 ) exit();
}
