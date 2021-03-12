ArrayList<Isotopes> cIso = new ArrayList<Isotopes>();
float maxAmount;
float timeAt = 1;
float timeSpeed = 1;
class Isotopes extends Things {
  float sAmount;
  float amount;
  float bAddAmount;
  float addAmount;
  int index;
  float halflife;
  float decayConstant;
  String name;
  boolean show = false;
  boolean stable = false;
  ArrayList<Integer> dest = new ArrayList<Integer>();
  ArrayList<Float> destPercent = new ArrayList<Float>();

  Isotopes(String name_, float amount_) {
    super();
    sAmount = amount_;
    amount = amount_;
    name = name_;
    stats(name.toLowerCase());
    cIso.add(this);
  }
  void drawSelf() {
    fill(255);
    if (showList.contains(this)) {
      rect(showList.indexOf(this)*(width/showList.size()), height, width/showList.size(), -(height-250)*((log(this.amount)/log(10))*(height/(log(maxAmount)/log(10)))/1000));

      fill(255, 0, 0);
      textSize(50/log(showList.size()+1));
      if (log(this.amount)<0) {
        text(this.name + ": " + this.amount, showList.indexOf(this)*width/showList.size(), height);
      } else {
        text(this.name + ": " + this.amount, showList.indexOf(this)*width/showList.size(), height-(height-250)*((log(this.amount)/log(10))*(height/(log(maxAmount)/log(10)))/1000));
      }
    }
  }


  void step() {// Her udregnes mængde af de forskellige isotoper
    for (Isotopes par : cIso) {
      for (Integer i : par.dest) {
        if (i == this.index) {
          this.addAmount += ((par.sAmount+par.bAddAmount)*par.destPercent.get(par.dest.indexOf(i)))*(1-exp(-timeAt*par.decayConstant));
        }
      }
    }
    if (!this.stable) {
      this.amount = (this.sAmount+this.addAmount)*exp(-timeAt*this.decayConstant);
    } else {
      this.amount = (this.sAmount+this.addAmount);
    }
    this.bAddAmount = this.addAmount;
    this.addAmount = 0;
  }
  void stats(String name) {
    switch(name) {
    case "u-238":
      index = 0;
      halflife = yearstosek(4.47E9);
      decayConstant = log(2)/halflife;
      dest.add(1);
      destPercent.add(1.00);
      break;
    case "th-234":
      index = 1;
      halflife = daystosek(24.1);
      decayConstant = log(2)/halflife;
      dest.add(2);
      destPercent.add(1.00);
      break;
    case "pa-234m":
      index = 2;
      halflife = minstosek(1.159);
      decayConstant = log(2)/halflife;
      dest.add(3);
      destPercent.add(0.0016);
      dest.add(4);
      destPercent.add(1.00-0.0016);
      break;
    case "pa-234":
      index = 3;
      halflife = hourstosek(6.7);
      decayConstant = log(2)/halflife;
      dest.add(4);
      destPercent.add(1.00);
      break;
    case "u-234":
      index = 4;
      halflife = yearstosek(24600);
      decayConstant = log(2)/halflife;
      dest.add(5);
      destPercent.add(1.00);
      break;
    case "th-230":
      index = 5;
      halflife = yearstosek(7.54E4);
      decayConstant = log(2)/halflife;
      dest.add(6);
      destPercent.add(1.00);
      break;
    case "ra-226":
      index = 6;
      halflife = yearstosek(1600);
      decayConstant = log(2)/halflife;
      dest.add(7);
      destPercent.add(1.00);
      break;
    case "rn-222":
      index = 7;
      halflife = daystosek(3.8235);
      decayConstant = log(2)/halflife;
      dest.add(8);
      destPercent.add(1.00);
      break;
    case "po-218":
      index = 8;
      halflife = minstosek(3.1);
      decayConstant = log(2)/halflife;
      dest.add(9);
      destPercent.add(0.9998);
      dest.add(10);
      destPercent.add(0.0002);
      break;
    case "at-218":
      index = 9;
      halflife = 1.5;
      decayConstant = log(2)/halflife;
      dest.add(12);
      destPercent.add(0.999);
      dest.add(11);
      destPercent.add(0.001);
      break;
    case "rn-218":
      index = 11;
      halflife = 0.035;
      decayConstant = log(2)/halflife;
      dest.add(13);
      destPercent.add(1.00);
      break;
    case "pb-214":
      index = 10;
      halflife = minstosek(26.8);
      decayConstant = log(2)/halflife;
      dest.add(12);
      destPercent.add(1.00);
      break;
    case "bi-214":
      index = 12;
      halflife = minstosek(19.9);
      decayConstant = log(2)/halflife;
      dest.add(13);
      destPercent.add(0.99979);
      dest.add(14);
      destPercent.add(0.00021);
      break;
    case "po-214":
      index = 13;
      halflife = 0.000164;
      decayConstant = log(2)/halflife;
      dest.add(15);
      destPercent.add(1.00);
      break;
    case "tl-210":
      index = 14;
      halflife = minstosek(1.3);
      decayConstant = log(2)/halflife;
      dest.add(15);
      destPercent.add(1.00);
      break;
    case "pb-210":
      index = 15;
      halflife = yearstosek(22.2);
      decayConstant = log(2)/halflife;
      dest.add(16);
      destPercent.add(1.00-1.9E-8);
      dest.add(17);
      destPercent.add(1.9E-8);
      break;
    case "bi-210":
      index = 16;
      halflife = daystosek(5.01);
      decayConstant = log(2)/halflife;
      dest.add(18);
      destPercent.add(1.00-1.32E-6);
      dest.add(19);
      destPercent.add(1.32E-6);
      break;
    case "hg-206":
      index = 17;
      halflife = minstosek(8.32);
      decayConstant = log(2)/halflife;
      dest.add(19);
      destPercent.add(1.00);
      break;
    case "po-210":
      index = 18;
      halflife = daystosek(138.376);
      decayConstant = log(2)/halflife;
      dest.add(20);
      destPercent.add(1.00);
      break;
    case "tl-206":
      index = 19;
      halflife = minstosek(4.202);
      decayConstant = log(2)/halflife;
      dest.add(20);
      destPercent.add(1.00);
      break;
    case "pb-206":
      index = 20;
      stable = true;
      dest.add(20);
      destPercent.add(1.00);
      break;
      /*
      //Dette er informationen om den anden henfaldskæde
    case "u-235":
       index = 0;
       halflife = yearstosek(7.03E8);
       decayConstant = log(2)/halflife;
       dest.add(1);
       destPercent.add(1.00);
       break;
       case "th-231":
       index = 1;
       halflife = daystosek(1.0633);
       decayConstant = log(2)/halflife;
       dest.add(2);
       destPercent.add(1.00);
       break;
       case "pa-231":
       index = 2;
       halflife = yearstosek(32730);
       decayConstant = log(2)/halflife;
       dest.add(3);
       destPercent.add(1.00);
       break;
       case "ac-227":
       index = 3;
       halflife = yearstosek(21758);
       decayConstant = log(2)/halflife;
       dest.add(4);
       destPercent.add(0.9862);
       dest.add(5);
       destPercent.add(0.138);
       break;
       case "th-227":
       index = 4;
       halflife = daystosek(18.68);
       decayConstant = log(2)/halflife;
       dest.add(6);
       destPercent.add(1.00);
       break;
       case "fr-223":
       index = 5;
       halflife = minstosek(22);
       decayConstant = log(2)/halflife;
       dest.add(6);
       destPercent.add(1.00);
       break;
       case "ra-223":
       index = 6;
       halflife = daystosek(11.43);
       decayConstant = log(2)/halflife;
       dest.add(7);
       destPercent.add(1.00);
       break;
       case "rn-219":
       index = 7;
       halflife = 3.96;
       decayConstant = log(2)/halflife;
       dest.add(8);
       destPercent.add(1.00);
       break;
       case "po-215":
       index = 8;
       halflife = mstosek(1.781);
       decayConstant = log(2)/halflife;
       dest.add(9);
       destPercent.add(1.00);
       break;
       case "pb-211":
       index = 9;
       halflife = minstosek(36.17);
       decayConstant = log(2)/halflife;
       dest.add(10);
       destPercent.add(1.00);
       break;
       case "bi-211":
       index = 10;
       halflife = minstosek(2.13);
       decayConstant = log(2)/halflife;
       dest.add(11);
       destPercent.add(0.9973);
       dest.add(12);
       destPercent.add(0.0027);
       break;
       case "tl-207":
       index = 11;
       halflife = minstosek(4.77);
       decayConstant = log(2)/halflife;
       dest.add(13);
       destPercent.add(1.00);
       break;
       case "po-211":
       index = 12;
       halflife = 0.515;
       decayConstant = log(2)/halflife;
       dest.add(13);
       destPercent.add(1.00);
       break;
       case "pb-207":
       index = 13;
       halflife = 0;
       decayConstant = 0;
       stable = true;
       break;
       */
    }
  }

  float yearstosek(float years_) {
    float years = years_;
    float time = years*365.25*24*60*60;
    return time;
  }
  float daystosek(float days_) {
    float days = days_;
    float time = days*24*60*60;
    return time;
  }
  float hourstosek(float hours_) {
    float hours = hours_;
    float time = hours*60*60;
    return time;
  }
  float minstosek(float mins_) {
    float mins = mins_;
    float time = mins*60;
    return time;
  }
  float mstosek(float ms_) {
    float ms = ms_;
    float time = ms/1000;
    return time;
  }
}

void cAmount() {
  maxAmount = 0;
  for (Isotopes iso : cIso) {
    if (iso.amount > maxAmount) {
      maxAmount += iso.amount;
    }
  }
}
ArrayList<Isotopes> showList = new ArrayList<Isotopes>();
void findAShow() {
  showList.clear();
  for (Isotopes iso : cIso) {
    //if(floor(iso.amount)>0){
    showList.add(iso);
    //}
  }
}
