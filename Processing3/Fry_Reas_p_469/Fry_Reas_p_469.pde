class Particle {
  float x, y;
  float vx, vy;
  float radius;
  float gravity = 0.1;

  Particle( int xpos, int ypos, float velx, float vely, float r ) {
    x = xpos;
    y = ypos;
    vx = velx;
    vy = vely;
    radius = r;
  }

  void update() {
    vy += gravity;
    y += vy;
    x += vx;
  }

  void display() {
    ellipse( x, y, radius*2, radius*2 );
  }
}


class GenParticle extends Particle {
  float originX, originY;

  GenParticle( int xpos, int ypos, float velx, float vely, float r, float ox, float oy ) {
    super( xpos, ypos, velx, vely, r );
    originX = ox;
    originY = oy;
  }

  void regenerate() {
    if (( x > width + radius ) || ( x < -radius ) ||
      ( y > height + radius ) || ( y < -radius )) {
      x = originX;
      y = originY;
      vx = random( -1.0, 1.0 );
      vy = random( -4.0, -2.0 );
    }
  }
}



int numParticles = 300;
GenParticle[] p = new GenParticle[ numParticles ];


void setup() {
  size( 512, 512 );
  noStroke();

  for ( int i = 0; i < p.length; i++ ) {
    float velX = random( -1, 1 );
    float velY = -1;
    p[ i ] = new GenParticle( width / 2, height / 2, velX, velY, 5.0, width / 2, height / 2 - 128 );
  }
}


void draw() {
  fill( 0, 36 );
  rect( 0, 0, width, height );
  fill( 255, 60 );

  for ( GenParticle part : p ) {
    part.update();
    part.regenerate();
    part.display();
  }
  
  
  //saveFrame("GenParticle.####.tif");
}
