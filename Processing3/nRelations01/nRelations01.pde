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
    ellipse( x, y, 10, 10 );
  }
}


class GenParticle extends Particle {
  GenParticle( float th, float r, float ox, float oy ) {
    super( th, r, ox, oy );
  }
}


int num = 36;
GenParticle[] p = new GenParticle[ num ];
int[][] AdjMatrix = new int[ num ][ num ];


void setup() {
  size( 512, 512 );
  noStroke();


  for ( int i = 0; i < p.length; i++ ) {
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
  noFill();

  for ( int i = 0; i < num; i++ ) {
    stroke( 255 ); 
    p[ i ].update(); //<>//
    p[ i ].display();
    
    for ( int j = i; j < num; j++ ) {
      if ( AdjMatrix[ i ][ j ] == 1 && i != j ) {
        stroke( 160, 200, 255 ); 
        //line( p[ i ].x, p[ i ].y, p[ j ].x, p[ j ].y );
        bezierDetail( 1 + 4 );
        bezier( p[ i ].x, p[ i ].y,
                p[ i ].x / 4 + width / 2, p[ i ].y / 4 + height / 2,
                -p[ j ].x / 4 + width / 2, -p[ i ].y / 4 + height / 2,
                p[ j ].x, p[ j ].y );
      }
    }
  }
    
  //saveFrame("nRelations01.####.tif");
}
