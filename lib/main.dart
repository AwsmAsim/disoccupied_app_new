import 'package:disoccupied_app/controller/brand_controller.dart';
import 'package:disoccupied_app/utils/ColorConstants.dart';
import 'package:disoccupied_app/utils/ScreenSizeConstants.dart';
import 'package:disoccupied_app/utils/TextConstants.dart';
import 'package:disoccupied_app/view/pages/HomePage.dart';
import 'package:disoccupied_app/view/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  BrandController brandController = Get.put(BrandController());



  @override
  Widget build(BuildContext context) {


    double pgWidth = MediaQuery.of(context).size.width;
    double pgHeight = MediaQuery.of(context).size.height;

    ScreenSizeConstants.height = pgHeight;
    ScreenSizeConstants.width = pgWidth;

    print("height: " + ScreenSizeConstants.height.toString());
    print("width: " + ScreenSizeConstants.width.toString());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(

            seedColor: ColorConstants.seedColor,
          primary: ColorConstants.primaryColor,
          secondary: ColorConstants.seedColor,
          brightness: Brightness.light
        ),
        textTheme: TextTheme(

          headlineLarge: GoogleFonts.roboto(
            color: ColorConstants.seedColorText,
            fontSize: TextConstants.fontSizeH1,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(color: ColorConstants.primaryColor)
        )
      ),
      home: SafeArea(
        child: SplashScreen(),
      ),
    );
  }
}
