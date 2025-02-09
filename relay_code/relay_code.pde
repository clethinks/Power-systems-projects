String input = ""; 
String output = ""; 
boolean showError = false; 

void setup() {
  size(400, 300); 
  background(240); 
  textAlign(CENTER, CENTER); 
  textSize(16); 
  fill(22); 

}

void draw() {
  background(134);
  
 
  fill(255);
  rect(width / 4, height / 2 - 20, width / 2, 40);
  
  // Display input
  fill(0);
  textAlign(CENTER, CENTER);
  text(input, width / 4 + 10, height / 2); 
  text("RELAY ANSI CODE FINDER\nEnter relay code and press ENTER" , width /2,50);
 

  if (output != "") {
    textAlign(CENTER, CENTER);
    text("Meaning: " + output, width / 2, height / 2 + 60);
  } else if (showError) {
    text("Invalid ANSI Code. Try again.", width / 2, height / 2 + 60);
  }
}

void keyPressed() {
  if (key == BACKSPACE) {
    if (input.length() > 0) {
      input = input.substring(0, input.length() - 1);
    }
  } else if (key == ENTER || key == RETURN) {
    output = getANSIMeaning(input.trim());
    showError = (output == "");
    if (showError) {
      output = "";
    }
  } else if (key == ESC) {
    key = 0; // Prevent exiting the sketch
  } else if (key != CODED) {
    input += key;
  }
}

// Function to return the meaning of an ANSI code
String getANSIMeaning(String code) {
  switch (code) {
    case "50":
      return "Instantaneous Overcurrent";
    case "51":
      return "Time Overcurrent";
    case "27":
      return "Undervoltage";
    case "59":
      return "Overvoltage";
    case "87":
      return "Differential Protection";
    case "21":
      return "Distance Protection";
    case "32":
      return "Power Directional Relay";
    case "64":
      return "Ground Fault";
    case "67":
      return "Directional Overcurrent";
    default:
      return ""; 
  }
}
