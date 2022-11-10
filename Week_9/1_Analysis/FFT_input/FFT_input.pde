//modded to take microphone input

/**
 * This sketch shows how to use the FFT class to analyze a stream
 * of sound. Change the number of bands to get more spectral bands
 * (at the expense of more coarse-grained time resolution of the spectrum).
 */

import processing.sound.*;

// Declare the sound source and FFT analyzer variables
AudioIn input;
FFT fft;

// Define how many FFT bands to use (this needs to be a power of two)
int bands = 512;

// Define a smoothing factor which determines how much the spectrums of consecutive
// points in time should be combined to create a smoother visualisation of the spectrum.
// A smoothing factor of 1.0 means no smoothing (only the data from the newest analysis
// is rendered), decrease the factor down towards 0.0 to have the visualisation update
// more slowly, which is easier on the eye.
float smoothingFactor = 0.2;

// Create a vector to store the smoothed spectrum data in
float[] sum = new float[bands];

// Variables for drawing the spectrum:
// Declare a scaling factor for adjusting the height of the rectangles
int scale = 50;
// Declare a drawing variable for calculating the width of the
float barWidth;

void setup() {
  size(640, 360);
  background(255);

  input = new AudioIn(this, 0);

  // Begin capturing the audio input
  input.start();

  // Calculate the width of the rects depending on how many bands we have
  barWidth = width/float(bands);


  // Create the FFT analyzer and connect the playing soundfile to it.
  fft = new FFT(this, bands);
  fft.input(input);
}

void draw() {
  // Set background color, noStroke and fill color
  background(255);

  noStroke();

  // Perform the analysis
  fft.analyze();

stroke(0);
line(0,height/2,width,height/2);

  for (int i = 0; i < bands; i++) {
    // Smooth the FFT spectrum data by smoothing factor
    sum[i] += (fft.spectrum[i] - sum[i]) * smoothingFactor;

    if (height-sum[i]*height*scale <= height/2) {
      fill(0);
    } else {
      fill(255, 20, 100);
    }
  noStroke();
    // Draw the rectangles, adjust their height using the scale factor
    //if(sum[i] >= 0.009){
    rect(i*barWidth, height, barWidth, -sum[i]*height*scale);
  //}
  }
}
