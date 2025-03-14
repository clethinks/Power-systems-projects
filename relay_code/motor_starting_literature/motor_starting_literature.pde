// Variables for layout
PFont titleFont, bodyFont;
int margin = 30;
int contentWidth;

// Content
String projectTitle = "Motor Starting Methods on a Distribution Grid";
String description = "This study explores various motor starting methods within a distribution grid simulated in ETAP. The objective is to analyze the impacts of direct-on-line (DOL), star-delta, and soft starter methods on voltage stability and current inrush.";
String methodology = "Methodology:\n- Simulated a typical distribution network in ETAP.\n- Integrated motor loads and tested multiple starting techniques.\n- Analyzed key metrics such as voltage dip, recovery time, and harmonic distortion for each method.\n- Compared results to identify the optimal method balancing performance and cost.";
String preview = "Key Findings:\n- DOL starting caused the most significant voltage dips.\n- Star-delta starting reduced initial inrush but prolonged voltage recovery.\n- Soft starters minimized voltage disturbance and harmonics, proving to be the most grid-friendly method.";

// Setup
void setup() {
  size(800, 600);
  titleFont = createFont("Arial Bold", 24);
  bodyFont = createFont("Arial", 16);
  contentWidth = width - 2 * margin;
}

// Draw the interface
void draw() {
  background(250);
  
  // Title
  fill(30, 144, 255); // Blue for the title
  textFont(titleFont);
  textAlign(CENTER);
  text(projectTitle, width / 2, margin);

  // Description
  fill(50);
  textFont(bodyFont);
  textAlign(LEFT);
  text(description, margin, 80, contentWidth, height / 4);

  // Methodology Section
  fill(50);
  textAlign(LEFT);
  text(methodology, margin, 200, contentWidth, height / 2);

  // Preview Section
  fill(34, 139, 34); // Green for findings
  text(preview, margin, 400, contentWidth, height / 4);

  // Footer
  fill(100);
  textAlign(CENTER);
  text("Simulations conducted in ETAP 2023 | Author:Clement", width / 2, height - margin);
}
