import 'ScreenSizeConstants.dart';

class TextConstants{

  static double fontSizeH4 = getH4FromScreenSize();
  static double fontSizeH3= getH3FromScreenSize();
  static double fontSizeH2 = getH2FromScreenSize();
  static double fontSizeH1 = getH1FromScreenSize();

  static double getH4FromScreenSize(){

    double height = ScreenSizeConstants.height;

    if(height > 850){
      return 13.0;
    }else if(height > 750){
      return 12.0;
    } return 10.0;

  }

  static double getH3FromScreenSize(){

    double height = ScreenSizeConstants.height;

    if(height > 850){
      return 16.0;
    }else if(height > 750){
      return 15.0;
    } return 13.0;

  }

  static double getH2FromScreenSize(){

    double height = ScreenSizeConstants.height;

    if(height > 850){
      return 22.0;
    }else if(height > 750){
      return 21.0;
    } return 19.0;

  }

  static double getH1FromScreenSize(){

    double height = ScreenSizeConstants.height;

    if(height > 850){
      return 25.0;
    }else if(height > 750){
      return 24.0;
    } return 22.0;

  }

}