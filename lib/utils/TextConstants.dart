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
  static const String aboutUsText = "We’re Nadia and Shehzad, a Palestinian and Kashmiri wife and husband. An art teacher and a financial analyst. We've followed the money trails and ranked thousands of companies based on their support for Palestine. For years we’ve protested against war and inequality overseas and here in America. This time is different. As a genocide unfolds in Palestine, the continued silence and outright support of political leaders and corporations has galvanized us and billions of people of conscience. We must use our collective economic strength to rally against the profiteering and politics that has enabled this brutal occupation.";
  static const String contactUsText = "Want to get in touch? Fill out the form below to send us a message and we'll get back to you as soon as possible!";
  static const String contactUsFollowText = "Follow us for all our latest updates and share DisOccupied with your friends and family.";

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