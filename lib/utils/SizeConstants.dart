import 'package:disoccupied_app/utils/ScreenSizeConstants.dart';

class SizeConstants{

  static double defaultPadding = getDefaultPaddingFromScreenSize();
  static double iconSize = 25.0;
  static const double homePageBannerSize = 390/263;
  static const double appbarLogoRatio = 158/30;
  static const double productImageRatio = 275/189;

  static double getDefaultPaddingFromScreenSize(){

    double height = ScreenSizeConstants.height;

    if(height > 850){
      return 16.0;
    }else if(height > 750){
      return 15.0;
    } return 12.0;

  }

}