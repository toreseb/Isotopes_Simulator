boolean within(float low, float middle, float high) {
  return(low < middle && middle < high);
}
String newAmountName = "";
int newAmountInt;

ArrayList<Objects> oList = new ArrayList<Objects>();
class Objects extends Things {
  boolean oldStarted = false;
  int x; 
  int y; 
  int sizeX;
  int sizeY;
  Objects() {
    oList.add(this);
  }

  void selfDo() {
    if (clickedOn()) {
      reactClickedOn();
    }
    if (clickedOff()) {
      reactClickedOff();
    }



    if (started == true && oldStarted == false) {
      reactStarted();
    }
    oldStarted = started;
  }


  void reactClickedOn() {
  }
  void reactClickedOff() {
  }
  void reactStarted() {
  }

  boolean clickedOn() {
    if (mouseReleased) {
      if (within(x, mouseX, x + sizeX)) {
        if (within(y, mouseY, y + sizeY)) {
          return true;
        }
      }
    }
    return false;
  }
  boolean clickedOff() {
    if (mouseReleased) {
      if (within(x, mouseX, x + sizeX)) {
        if (within(y, mouseY, y + sizeY)) {
          return false;
        }
      }
      return true;
    }

    return false;
  }
}




float totalAmount = 0;
class Slider extends Objects {
  float barX;

  Slider() {
    barX = 1;
  }
  void drawSelf() {
    fill(255);
    rect(10, 10, width-20, 50, 10);
    fill(200);
    rect(barX-10, 5, 40, 60);
    String timeUnit = "sec";
    float visualTime = timeAt;
    if (visualTime >= 120 && timeUnit == "sec") {
      visualTime /= 60; 
      timeUnit = "min";
    }
    if (visualTime >= 120 && timeUnit == "min") {
      visualTime /= 60; 
      timeUnit = "hour";
    }
    if (visualTime >= 48 && timeUnit == "hour") {
      visualTime /= 24; 
      timeUnit = "day";
    }
    if (visualTime >= 365.25*2 && timeUnit == "day") {
      visualTime /= 365.25; 
      timeUnit = "year";
    }
    textSize(20);
    text(round(visualTime) + timeUnit, width/2-30, 100);
    float pTotalAmount=0;
    for (Isotopes iso : cIso) {
      pTotalAmount += iso.amount;
    }
    totalAmount = pTotalAmount;
    text(totalAmount, width/2-30, 150);
  }
  void step() {
    if (mousePressed) {
      barX = barX+(mouseX-pmouseX);
    }
    if (barX < 0) {
      barX = 0;
    }
    timeAt = pow(10, (barX/100))-1;
  }
}
boolean started = false;
class Button extends Objects {
  color Color = color(255, 0, 0);
  Button(int x_, int y_, int sizeX_, int sizeY_) {
    super();
    x = x_; 
    y = y_; 
    sizeX = sizeX_;
    sizeY = sizeY_;
  }


  void drawSelf() {
    if (!started) {
      this.Color = color(255, 0, 0);
    } else {
      this.Color = color(200, 0, 0);
    }
    fill(Color);
    rect(x, y, sizeX, sizeY);
    fill(0);
    if (started == false) {
      text("START", x+18, y+30);
    } else {
      text("STOP", x+24, y+30);
    }
  }
  void reactClickedOn() {
  }
}

ArrayList<StartAmount> sAmountList = new ArrayList<StartAmount>();
class StartAmount extends Objects {
  String text = "";
  boolean isChosen = false;
  int index = 0;
  StartAmount(int x_, int y_, int sizeX_, int sizeY_) {
    super();
    x = x_; 
    y = y_; 
    sizeX = sizeX_;
    sizeY = sizeY_;
    sAmountList.add(this);
  }
  void reactClickedOn() {
    isChosen = true;
    started = false;
  }
  void reactClickedOff() {
    isChosen = false;
  }

  int keyTimer = 15;
  int keyTime=0;
  void step() {
    if (isChosen) {
      if (keyPressed && keyTime > keyTimer) {
        text = text.substring(0) + key;
        keyTime = 0;
      } else {
        keyTime++;
      }
    }
  }
  void reactStarted() {
  }
  void drawSelf() {
    if (!isChosen) {
      fill(255);
    } else {
      fill(200);
    }
    rect(x, y, sizeX, sizeY);
    fill(0);
    text(text, x+18, y+30);
  }
}

boolean mouseReleased = false;
void mouseReleased() {
  mouseReleased = true;
}
