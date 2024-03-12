import 'ScreenSizeConstants.dart';

class TextConstants{

  static double fontSizeH4 = getH4FromScreenSize();
  static double fontSizeH3= getH3FromScreenSize();
  static double fontSizeH2 = getH2FromScreenSize();
  static double fontSizeH1 = getH1FromScreenSize();
  static String endpointDomain = "https://disoccupied.com/";
  static Map<String, String> errorMessage = {
    "CLIENT_EXCEPTION" : "We're sorry but something went wrong with the application. Please try restarting the application.",
    "SERVER_EXCEPTION" : "We're sorry, there's something wrong on our side. Please try after some time.",
    "UNKNOWN_EXCEPTION": "Some unknown error occured. Please try again or contact us if the error exists."
  };

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