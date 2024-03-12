import 'package:disoccupied_app/utils/ColorConstants.dart';
import 'package:disoccupied_app/utils/ScreenSizeConstants.dart';
import 'package:disoccupied_app/utils/TextConstants.dart';
import 'package:disoccupied_app/view/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



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
            fontWeight: FontWeight.w900,
          ),
          bodyMedium: TextStyle(color: ColorConstants.primaryColor)
        )
      ),
      home: SafeArea(
        child: HomePage(),
      ),
    );
  }
}
