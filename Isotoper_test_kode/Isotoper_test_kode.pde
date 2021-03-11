


void setup() {
  size(1920, 1000);

  new Isotopes("u-238",  0);
  new Isotopes("th-234", 0);
  new Isotopes("pa-234m",0);
  new Isotopes("pa-234", 0);
  new Isotopes("u-234",  0);
  new Isotopes("th-230", 0);
  new Isotopes("ra-226", 0);
  new Isotopes("rn-222", 0);
  new Isotopes("po-218", 0);
  new Isotopes("at-218", 0);
  new Isotopes("rn-218", 0);  
  new Isotopes("pb-214", 0);
  new Isotopes("bi-214", 0);
  new Isotopes("po-214", 0);
  new Isotopes("tl-210", 0);
  new Isotopes("pb-210", 0);
  new Isotopes("bi-210", 0);
  new Isotopes("po-210", 0);
  new Isotopes("tl-206", 0);
  new Isotopes("pb-206", 0);
  Slider slider = new Slider();
  StartAmount sName = new StartAmount(width-width/8, 100, 100, 40) {
    public void reactStarted() {
      newAmountName = this.text;
      this.text = "";
    }
  };
  StartAmount sAmount = new StartAmount(width-width/8+120, 100, 100, 40) {
    public void reactStarted() {
      if (this.text!="") {
        newAmountInt = Integer.valueOf(this.text);
        this.text = "";
      }
    }
  };
  Button startButton = new Button(width-width/8, 140, 100, 40) {
    public void reactClickedOn() {
      if (!started) {

        started = true;
        this.Color = color(200, 0, 0);
      } else {
        started = false;
        this.Color = color(255, 0, 0);
      }
    }
    public void reactStarted() {
      for (StartAmount sA : sAmountList) {
        sA.reactStarted();
      }
      for (Isotopes iso : cIso) {
        if (newAmountName.equals(iso.name)) {

          iso.sAmount += newAmountInt;
          newAmountName = "";
          newAmountInt = 0;
        }
      }
      cAmount();
    }
  };
  /*
  new Isotopes("U-235" , 0);
   new Isotopes("th-231", 0);
   new Isotopes("pa-231", 0);
   new Isotopes("ac-227", 0);
   new Isotopes("th-227", 10E21);
   new Isotopes("fr-223", 0);
   new Isotopes("ra-223", 0);
   new Isotopes("rn-219", 0);
   new Isotopes("po-215", 0);
   new Isotopes("pb-211", 0);
   new Isotopes("bi-211", 0);
   new Isotopes("tl-207", 0);
   new Isotopes("po-211", 0);
   new Isotopes("pb-207", 0);*/
  cAmount();
}



void draw() {
  clear();
  findAShow();
  if (maxAmount == 0) {
    cAmount();
  }
  for (Things t : tList) {
    t.drawSelf();
    if (started) {
      t.step();
    }
  }
  for (Objects o : oList) {
    o.selfDo();
    if (!started) {
      o.step();
    }
  }
  if (keyPressed) {
    if (key == 's') {
      export();
    }
  }
  mouseReleased = false;
}
