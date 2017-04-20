//Guido Areces
//Final Project
//Programming Basics
//areces.g@husky.neu.edu
//"Frequency to Midi Note Audio Visualizer"

import ddf.minim.analysis.*;
import ddf.minim.*;
AudioPlayer song;
Minim minim;
FFT fft;
float [] xy;
float [] yz;
float hF = 0.001;
float bF = 0.02;
float hz;
int n, volume;
float ww = 0;
int lFreq = 0;
color color1 =#FA0D0D ;
color color2=#FA0DA3 ;
color color3=#FA0DF7;
color color4=#B20DFA;
color color5=#4B0DFA;
color color6=#2D68F7;
color color7=#2DCDF7;
color color8=#2DF7B5;
color color9=#2DF77C;
color color10=#76F72D;
color color11=#DFF72D;
color color12=#F7A02D;
float rW = .1;
float rH= 1000;
void setup() {
  size(5000, 1000);
  background(255);
  minim =  new Minim(this);
  song = minim.loadFile("Tours_-_01_-_Enthusiast.mp3", 2048);
  song.play();
  fft =  new FFT(song.bufferSize(), song.sampleRate());
  fft.logAverages(11, 1);
  n = (fft.specSize()-1)/4;
  xy = new float[n];
  yz = new float[n];
  volume = 4;
  //stroke(255);
  //strokeWeight(5);
  smooth();
  noStroke();
  frameRate(60);
  colorMode(BLEND);
}
void draw() {
  float y = height/2;
  fft.forward(song.mix);
  float freqBw = fft.getBandWidth();
  float[]spec = new float [n];
  for (int i = 0; i < 2; i++) {
    xy[i] = xy[i]*(1-hF)+fft.getBand(i)*hF;
    yz[i] = yz[i]*(1-bF)+xy[i]*bF;
    spec[i] = (xy[i]/yz[i]-1)*1000*volume;
  }
  //println(freqBw);
  for (int k = 1; k < 12; k++) {  
    if (k==0) {
      lFreq = 0;
    } else {
      lFreq = (int) ((song.sampleRate()/2)/(float)Math.pow(2, 12-k));
    }
    int hiFreq = (int)((song.sampleRate()/2) / ((float)Math.pow(2, 11 - k)));
    int lowBound = fft.freqToIndex(lFreq);
    int hiBound = fft.freqToIndex(hiFreq); 
    float avg = fft.calcAvg(lowBound, hiBound);
    // println(avg);
    //A#
    translate(ww, 0);
    for (int i = 0; i <2; i++) {
      if (spec[i]>0) {
      }
      for (float x = .0; x< .001; x+=.001) {
        translate(ww, 0);
        float midiNotelow =  (12/log(2)) * log(avg/27.5) + 21;
        int midi = floor((midiNotelow)/2); 
        //get.midi();
        println(floor(midiNotelow)/2);
        if (midi ==10 ||midi == 22 || midi==34 || midi==46 ||midi == 58 || midi== 70 ||midi == 82 || midi ==94 ||midi==106 ||midi== 118) {

          fill(color2);
          //ellipse(i, y, rW, (song.left.level()*rH));
          rect(i, y, rW, -1*(song.right.level()*rH));
          rect(i, y, rW, (song.right.level()*rH));
        }
        //B
        if  (midi ==11 ||midi == 23 || midi==36 || midi==47 ||midi == 59 || midi== 71 ||midi == 83 || midi ==95 ||midi==107 ||midi== 119) {
          fill(color3);
          //ellipse(i, y, rW, (song.left.level()*rH));
          rect(i, y, rW, -1*(song.right.level()*rH));
          rect(i, y, rW, (song.right.level()*rH));
        } 
        //C,.nm,.m
        if (midi ==0 ||midi == 12 || midi==24 || midi==36 ||midi == 48 || midi== 60 ||midi == 72 || midi ==84 ||midi==96 ||midi== 108||midi==120) {
          fill(color4);
          // ellipse(i, y, rW, (song.left.level()*rH));

          rect(i, y, rW, -1*(song.right.level()*rH));
          rect(i, y, rW, (song.right.level()*rH));
        } 

        //C#

        if (midi ==1 ||midi == 13 || midi==25 || midi==37 ||midi == 49 || midi== 61 ||midi == 73 || midi ==85 ||midi==97 ||midi== 109||midi==121) {
          fill(color5);
          //  ellipse(i, y, rW, (song.left.level()*rH));
          rect(i, y, rW, -1*(song.right.level()*rH));
          rect(i, y, rW, (song.right.level()*rH));
        } 
        //D

        if (midi ==2 ||midi == 14 || midi==26 || midi==38 ||midi == 50 || midi== 62 ||midi == 74 || midi ==86 ||midi==98 ||midi== 110||midi==122) {
          fill(color1);
          rect(i, y, rW, -1*(song.right.level()*rH));
          rect(i, y, rW, (song.right.level()*rH));
        } 
        //D#

        if (midi ==3 ||midi == 15 || midi==27 || midi==39 ||midi == 51 || midi== 63 ||midi == 75 || midi ==87 ||midi==99 ||midi== 111||midi==123) {
          fill(color6);
          rect(i, y, rW, -1*(song.right.level()*rH));
          rect(i, y, rW, (song.right.level()*rH));
        } 
        //E

        if (midi ==4 ||midi == 16 || midi==28 || midi==40 ||midi == 52 || midi== 64 ||midi == 76 || midi ==88 ||midi==100 ||midi== 112||midi==124) {
          fill(color7);
          rect(i, y, rW, -1*(song.right.level()*rH));
          rect(i, y, rW, (song.right.level()*rH));
        } 
        //F

        if (midi ==5 ||midi == 17 || midi==29 || midi==41 ||midi == 53 || midi== 65 ||midi == 77 || midi ==89 ||midi==101 ||midi== 113||midi==125) {
          fill(color8);
          //  ellipse(i, y, rW, (song.left.level()*rH));
          rect(i, y, rW, -1*(song.right.level()*rH));
          rect(i, y, rW, (song.right.level()*rH));
        } 
        //F#

        if (midi ==6 ||midi == 18 || midi==30 || midi==42 ||midi == 54 || midi== 66 ||midi == 78 || midi ==90 ||midi==102 ||midi== 114||midi==126) {
          fill(color9);
          // ellipse(i, y, rW, (song.left.level()*rH));
          rect(i, y, rW, -1*(song.right.level()*rH));
          rect(i, y, rW, (song.right.level()*rH));
        }
        //G

        if (midi ==7 ||midi == 19 || midi==31 || midi==43 ||midi == 55 || midi== 67 ||midi == 79 || midi ==91 ||midi==103 ||midi== 115||midi==127) {
          fill(color10);
          // ellipse(i, y, rW, (song.left.level()*rH));
          rect(i, y, rW, -1*(song.right.level()*rH));
          rect(i, y, rW, (song.right.level()*rH));
        } 
        //G#

        if (midi ==8 ||midi == 20 || midi==32 || midi==44 ||midi == 56 || midi== 68 ||midi == 80 || midi ==92 ||midi==104 ||midi== 116||midi==128) {
          fill(color11);
          //ellipse(i, y, rW, (song.left.level()*rH));
          rect(i, y, rW, -1*(song.right.level()*rH));
          rect(i, y, rW, (song.right.level()*rH));
        } 
        //A

        if (midi ==9 ||midi == 21 || midi==33 || midi==45 ||midi == 57 || midi== 69 ||midi == 83 || midi ==93 ||midi==107 ||midi== 117) {
          fill(color12);
          rect(i, y, rW, -1*(song.right.level()*rH));
          rect(i, y, rW, (song.right.level()*rH));
        }
        rect(i, y, rW, -1*(song.right.level()*rH));
        rect(i, y, rW, (song.right.level()*rH));
        ww+=.01;
      }
      rect(i, y, rW, -1*(song.right.level()*rH));
      rect(i, y, rW, (song.right.level()*rH));
    }
  }


  println(millis());
  if (song.length()*1000/60==(frameCount));
  {
    save("Image4.jpeg");
  }