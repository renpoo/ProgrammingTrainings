import processing.opengl.*;


class Particle {
  float x, y;
  float originX, originY;
  float theta;
  float radius;

  Particle( float th, float r, float ox, float oy ) {
    radius = r;
    theta = th;
    originX = ox;
    originY = oy;
    x = originX + radius * cos( theta );
    y = originY + radius * sin( theta );;
  }

  void update() {
    theta += 0.01;
    x = originX + radius * cos( theta );
    y = originY + radius * sin( theta );
  }

  void display() {
    fill( 255 );
    ellipse( x, y, 10, 10 );
  }
}


class GenParticle extends Particle {
  GenParticle( float th, float r, float ox, float oy ) {
    super( th, r, ox, oy );
  }
}


int num = 48;
GenParticle[] p = new GenParticle[ num ];
int[][] AdjMatrix = new int[ num ][ num ];
int[][] ColorArray = new int[ num ][ 3 ];


void setup() {
  size( 512, 512 );
  noStroke();


  for ( int i = 0; i < p.length; i++ ) {
    ColorArray[ i ][ 0 ] = int( random( 224, 255 ) );
    ColorArray[ i ][ 1 ] = int( random( 160, 255 ) );
    ColorArray[ i ][ 2 ] = int( random(  64, 128 ) );
    
    for ( int j = 0; j < p.length; j++ ) {
      AdjMatrix[ i ][ j ] = 0;
    }
  }
  
  for ( int i = 0; i < p.length; i++ ) {
    float th = 2 * PI / num * i;
    float r = 200;
    p[ i ] = new GenParticle( th, r, width / 2, height / 2 );
    for ( int j = i; j < p.length; j++ ) {
      AdjMatrix[ i ][ j ] = int( random( 0, 1 ) + 0.1 );
      AdjMatrix[ j ][ i ] = AdjMatrix[ i ][ j ];
    }
  }
}


void draw() { //<>//
  fill( 0, 36 );
  rect( 0, 0, width, height );
  fill( 255, 36 );

  for ( int i = 0; i < num; i++ ) {
    stroke( 255 ); 
    p[ i ].update(); //<>//
    p[ i ].display();
    
    for ( int j = i; j < num; j++ ) {
      if ( AdjMatrix[ i ][ j ] == 1 && i != j ) {
        noFill();
        stroke( ColorArray[ i ][ 0 ], ColorArray[ i ][ 1 ], ColorArray[ i ][ 2 ] ); 
        //line( p[ i ].x, p[ i ].y, p[ j ].x, p[ j ].y );
        float l = 0.2;
        bezierDetail( 1 + 4 );
        bezier( p[ i ].x, p[ i ].y,
                lerp( p[ i ].x, width / 2, l), lerp( p[ i ].y, height / 2, l ),
                lerp( p[ j ].x, width / 2, l), lerp( p[ j ].y, height / 2, l ),
                p[ j ].x, p[ j ].y );
      }
    }
  }
    
  //saveFrame("nRelations02.####.tif");
}
