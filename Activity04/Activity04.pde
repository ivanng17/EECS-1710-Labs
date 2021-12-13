/**
 * This is a simple sound file player. Use the mouse position to control playback
 * speed, amplitude and stereo panning.
 */

import processing.sound.*;
SoundFile soundfile;
PImage bgImage;
PImage ring;

void setup() {
  size(800, 600);
  frameRate(60);
  
  background(0, 0, 255);
  
  bgImage = loadImage("sonic.png"); // deviantart.com/modernlixes/art/Classic-Sonic-Running-673550458
  ring = loadImage("ring.png"); // https://www.deviantart.com/nuryrush/art/Ring-Render-650084939
  // Load a soundfile
  soundfile = new SoundFile(this, "Green Hill Zone.mp3"); //https://archive.org/details/SonicTheHedgehogGreenHillZoneTheme //

  // These methods return useful infos about the file
  println("SFSampleRate= " + soundfile.sampleRate() + " Hz");
  println("SFSamples= " + soundfile.frames() + " samples");
  println("SFDuration= " + soundfile.duration() + " seconds");

  // Play the file in a loop
  soundfile.loop();
  

}      

void draw() {
    

  //playSpeed
  float playbackSpeed = map(mouseX, 0, width, 0.25, 2.0);
  soundfile.rate(playbackSpeed);

  //Amplitude
  float amplitude = map(mouseY, 0, width, 0.1, 1.0);
  soundfile.amp(amplitude);

  //Panning
  float panning = map(mouseY, 0, height, -1.0, 1.0);
  soundfile.pan(panning);
  
  background(0, 0, amplitude * 255);
  
  imageMode(CENTER);
  image(bgImage, width/2, height/2, bgImage.width, bgImage.height);
  tint(0, 0, 0);
  
  imageMode(CENTER);
  image(ring, mouseX, mouseY, 50, 50);
  tint(0, playbackSpeed * 127, 0);
  
  
  
}
