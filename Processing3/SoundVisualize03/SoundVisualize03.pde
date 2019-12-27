// References:
// http://mslabo.sakura.ne.jp/WordPress/make/processing%E3%80%80逆引きリファレンス/bgmの周波数を分析する（minim編）/
// https://junkiyoshi.com/openframeworks20191222/
// https://yoppa.org/teu_media17/8363.html



import ddf.minim.*;
import ddf.minim.analysis.*;


final int MAXBAND = 24;

Minim minim;
AudioPlayer player;
FFT fft;
float specSize;
float initBand;
int stepCount;
int wakuX, wakuY;
int wakuWidth, wakuHeight;
int NUM = 24;
float r = 0.0;


int       bandHz[] =  {   43,   43,   43,   43,   43,   43,   43,    43,
                          43,   43,   43,   43,   43,   43,   43,    43,
                          86,   86,   86,   86,   86,   86,   86,    86,
                         172,  172,  172,  172,  688,  688,  688,   688,
                         215,  215,  344,  344,  516,  516,  688,   688,
                        1032, 1032, 1204, 1376, 1548, 1720, 1892,  2064 };


float angle = 0.0;
float offset = 360.0/float(NUM);
float barWidth = offset;

void setup()
{
  size(1280, 720, P3D);
  noStroke();
  colorMode(HSB, 360, 100, 100, 100);
  frameRate(12);

  wakuX = 10;
  wakuY = 10;
  wakuWidth = width - wakuX*2;
  wakuHeight = height - wakuY*2;


  minim = new Minim(this);

  //player = minim.loadFile("TooBad.mp3");
  //player = minim.loadFile("Remembering_Universe.mp3");
  //player = minim.loadFile("Naadam.mp3");
  player = minim.loadFile("PerituneMaterial_Wonder4.mp3");

  fft = new FFT( player.bufferSize(), player.sampleRate());


  specSize = fft.specSize();


  fft.window( FFT.HANN );


  initBand = fft.getBandWidth();

  barWidth = wakuWidth / MAXBAND;

  player.play();
}

void draw() {
  background(0);
  ambientLight(0, 0, 20);
  directionalLight(0, 0, 100, -1, 0, -1);

  translate(width/2, height/2, 0);

  camera(0.0, -3000.0, 3500.0,
         0.0, 0.0, 0.0,
         0.0, 1.0, 0.0);


  if( player.isPlaying() == false ){
    return;
  }

  fft.forward( player.mix );

  int ToStep = 0;
  int FromStep = 0;


  for( int index = 0; index < MAXBAND; index++ ){

    int bandStep = (int)( bandHz[index] / initBand );
    if( bandStep < 1 ){ bandStep = 1; }

    ToStep = ToStep + Math.round( bandStep );
    if( ToStep > specSize ){ ToStep = (int)specSize; }

    float bandAv = 0;
    for( int j = FromStep ; j < ToStep; j++ ){

       float bandDB = 0;
      if ( fft.getBand( j ) != 0 ) {
        bandDB = 2 * ( 20 * ((float)Math.log10(fft.getBand(j))) + 40);
        if( bandDB < 0 ){ bandDB = 0; }
      }
      bandAv = bandAv + bandDB;
    }
    bandAv = bandAv / bandStep;
    FromStep = ToStep;


    float y = map( bandAv, 0, 250, 0, wakuHeight );
    if( y < 0 ) { y = 0; }

    println( "y = " + y );

    for ( int i=0; i<NUM; i++ ) {
      pushMatrix();

      r = (float)index/MAXBAND; //<>//

      rotateY( radians( angle * r + offset * i + angle * 0.1 ) );
      translate( (1.0 - r) * width * 1.5 + 1000, - wakuHeight * y / 200 / 2.0, 0);
      fill( 180 );
      box( barWidth, wakuHeight * y / 200, barWidth*(1.0-r+0.1)*10.0 );

      popMatrix();


      angle += 0.005;
    }

  }

  //saveFrame("Universe.####.jpg");
  saveFrame("Wonder4.####.jpg");
}
