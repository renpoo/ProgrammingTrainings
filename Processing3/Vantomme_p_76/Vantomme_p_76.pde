import processing.opengl.*;

float n;

int k = 0;

void setup()
{
  size( 640, 480, OPENGL );
  n = 0.0f;
}


void draw()
{
  hint( ENABLE_DEPTH_TEST );
  n += 0.01;
  background( 255 );
  lights();
  
  noStroke();
  fill( 255, 128, 0 );
  
  pushMatrix();
  for ( int i = 0; i < 17; i++ ) {
    for ( int j = 0; j < 13; j++ ) {
      pushMatrix();
      fill( i * 15, 0, j * 19 );
      translate( i * 40, j * 40 );
      rotateY( radians( i * 10 + frameCount ) );
      rotateZ( radians( i * 10 + frameCount ) );
      box( noise( i, j, n ) * 40 );
      popMatrix();
    }
  }
  popMatrix();
 
  
  //save("V_p_76_img." + k++ + ".tif" );
}
