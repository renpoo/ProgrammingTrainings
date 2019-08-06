int numA = 10;
int numB = 6;
float ratio = (float) numB / numA;
float thr = 160;
float eps = 0.1;


void setup()
{
  size( 500, 500 );
  colorMode( HSB, 1 );
  println( "numA =", numA, "numB =", numB,"thr =", thr );
  divSquare( 0, 0, width );
}


void mouseClicked()
{
  numA = int( random( 1, 100 ) );
  numB = int( random( 1, 100 ) );
  while ( numA == numB ){
    numB = int( random( 1, 100 ) );
  }
  thr = int( random( 10, 300 ) );
  println( "numA =", numA, "numB =", numB,"thr =", thr );
  ratio = (float) numA / numB;

  size( 10 * numA, 10 * numB );

  background( 0, 0, 1 );
  divRect( 0, 0, width );

  //saveFrame("Euclid.####.jpg");
}


void draw()
{
}


void divSquare( float xPos, float yPos, float wd )
{
  int itr = 0;
  float xEndPos = wd + xPos;
  float yEndPos = wd + yPos;
  fill( color( (xPos + yPos) / width / 2 * 0.3, 0.3, 1 ) );
  println( "xPos =", xPos, "yPos =", yPos );
  rect( xPos, yPos, wd, wd );
  while ( wd > thr ){
    itr++;
    if ( itr % 2 == 1 ) {
      while ( xPos + wd * ratio < xEndPos + eps ) {
        divRect( xPos, yPos, wd * ratio );
        xPos += wd * ratio;
      }
      wd = xEndPos - xPos;
    } else {
      while ( yPos + wd / ratio < yEndPos + eps ) {
        divRect( xPos, yPos, wd );
        yPos += wd / ratio;
      }
      wd = yEndPos - yPos;
    }
  }
}


void divRect( float xPos, float yPos, float wd ) 
{
  int itr = 0;
  float xEndPos = xPos + wd;
  float yEndPos = yPos + wd / ratio;
  fill( color( (xPos + yPos) / width / 2 * 0.3, 0.3, 1 ) );
  println( "xPos =", xPos, "yPos =", yPos );
  rect( xPos, yPos, wd, wd / ratio );
  while ( wd > thr ) {
    itr++;
    if ( itr % 2 == 0 ) {
      while ( xPos + wd < xEndPos + eps ) {
        divSquare( xPos, yPos, wd );
        xPos += wd;
      }
      wd = xEndPos - xPos;
    } else {
      while ( yPos + wd < yEndPos + eps ) {
        divSquare( xPos, yPos, wd );
        yPos += wd;
      }
      wd = yEndPos - yPos;
    }
  }
}
