int num = 20;

float r = 15.0;

float[] vx = new float[ num ];
float[] vy = new float[ num ];
float ax = 0.0;
float ay = 0.098;

float[] x = new float[ num ];
float[] y = new float[ num ];

int i = 0;

void setup() {
  size( 512, 512 );
  noStroke();
  ellipseMode( RADIUS );

  for ( int j = 0; j < num; j++ ) {
    x[ j ] = random( r, 512 - r );
    y[ j ] = height - r + random( -5.0, 0.0 );
    vx[ j ] = 0.0;
    //vx[ j ] = random( -1.0, 1.0 );
    vy[ j ] = random( -9.0, 0.0 );
  }
}


void draw() {
  fill( 0, 10 );
  rect( 0, 0, width, height );
  fill( 255 );

  for ( int j = 0; j < num; j++ ) {
    ellipse( x[ j ], y[ j ], r, r );
  
    if ( x[ j ] > width - r ) {
      x[ j ] -= width;
    } else if ( x[ j ] < r ) {
      x[ j ] += width;
    }
  
   if ( y[ j ] > height - r ) {
      vy[ j ] *= -1.0;     
      y[ j ] = height - r;
      break;
    } else if ( y[ j ] < r ) {
      vy[ j ] *= -1.0;     
    }

    vx[ j ] += ax;
    x[ j ] += vx[ j ];
    
    vy[ j ] += ay;
    y[ j ] += vy[ j ];    
  }

  //saveFrame("junmpingBall.####.tif");
  
  //println("vy : " + vy );
}
