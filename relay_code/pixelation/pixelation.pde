// Variables for image or text
PImage img; // To hold the image
String displayText = "Pixelate!";
PFont font;

// Pixelation variables
int minPixelSize = 5; // Smallest pixel size
int maxPixelSize = 50; // Largest pixel size
int pixelSize = minPixelSize; // Initial pixel size
int step = 1; // Increment/Decrement step for pixel size

// Setup
void setup() {
  size(1080,1080);
  img = loadImage("lobby.JPG"); // Replace with your image file

}

// Draw loop
void draw() {
  background(255);
  
  // Pixelate effect
  for (int y = 10; y < height; y += pixelSize) {
    for (int x = 0; x < width; x += pixelSize) {
      color c = img.get(x, y); // Get color at pixel
      fill(c);
      noStroke();
      rect(x, y, pixelSize, pixelSize); // Draw rectangle for pixel
    }
  }
  
  // Update pixel size
  pixelSize += step;
  if (pixelSize >= maxPixelSize || pixelSize <= minPixelSize) {
    step *= -1; // Reverse direction
  }
}
