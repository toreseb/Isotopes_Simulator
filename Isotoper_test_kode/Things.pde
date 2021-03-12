ArrayList<Things> tList = new ArrayList<Things>();
class Things{
  Things(){
    tList.add(this); 
  }
  void drawSelf(){}
  void step(){}
}
