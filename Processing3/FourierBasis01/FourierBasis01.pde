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
    w = float( i + 1 ) / N;
    float r = w * rDiff + rMin;
    w *= -1.0;
    circle( r * cos( w * t ) + width/2, r * sin( w * t ) + height/2, 10 );  
  }
  t += dt;

  saveFrame("FourierBasis01.####.png");

  if ( t > 600 ) exit();
}
