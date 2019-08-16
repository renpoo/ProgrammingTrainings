// Customized from Jean-no's work by renpoo.
// http://www.openprocessing.org/sketch/343974


int x, y, n, nn;
int[][] sens;
int[][] moves;

int fontSize = 8;


void setup()
{
  size( 1024, 1024 );
  background( 255 );


  PFont font;
  
  //String[] fontList = PFont.list();
  //printArray( fontList );
  
  font = createFont( "Ubuntu Light", fontSize );
  textFont( font ); 
  
  textSize( fontSize );


  x = width / 2;
  y = height / 2;

  n = 0;
  nn = 1;

  sens = new int[4][2];
  moves = new int[0][0];

  int[] i1 = {  fontSize,         0 };  sens[0] = i1;
  int[] i2 = {         0, -fontSize };  sens[1] = i2;
  int[] i3 = { -fontSize,         0 };  sens[2] = i3;
  int[] i4 = {         0,  fontSize };  sens[3] = i4; 

}


void draw()
{
  for( int a = 0; a < 50; a++ ) {
    avance();
  }

  saveFrame("UlamSpiral01.full.tif");  
}


void avance()
{
  if ( moves.length == 0 ) {
    for ( int i = 0; i < 2; i++ ) {
      for ( int a = 0; a < nn; a++ ) {
        moves = (int[][]) append( moves, sens[0] );
      }
      sens = (int[][]) append( sens, sens[0] );
      sens = (int[][]) subset( sens, 1 ); 
    }
    nn++;
  } else {
    int[] togo = moves[0];
    moves = (int[][]) subset( moves, 1 );
    x += togo[ 0 ];
    y += togo[ 1 ];
    if( isPrime( n ) ) {
      if ( isLegendre( n ) )
        fill( 255, 0, 0 );
      //else if  ( isEuler( n ) )
      //  fill( 0, 0, 255 );
      else
        fill( 0, 0, 0 );
      //point( x, y );
      text( n, x, y );
    }
    n++;
  }
  if( x < 0 && y < 0 ) {
    noLoop();
  }
}


boolean isPrime( int n )
{
  boolean toreturn = true;
  for( int i = 2; i < ((n/2)-1); i++ ) {
    if( n % i == 0 ) {
      toreturn = false;
      break;
    }
  }
  return toreturn; 
}


boolean isLegendre( int n )
{
  boolean toreturn = false;

  for( int i = 2; i < ((n/2)-1); i++ ) {
    if ( n == i * ( i + 1 ) + 41 ) {
      toreturn = true;
      println( n );
    }
  }
  return toreturn; 
}


boolean isEuler( int n )
{
  boolean toreturn = false;

  for( int i = 2; i < ((n/2)-1); i++ ) {
    if ( n == i * ( i - 1 ) + 41 ) {
      toreturn = true;
      println( n );
    }
  }
  return toreturn; 
}
