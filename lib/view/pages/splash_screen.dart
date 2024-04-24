import 'package:disoccupied_app/utils/ColorConstants.dart';
import 'package:disoccupied_app/utils/ScreenSizeConstants.dart';
import 'package:disoccupied_app/view/pages/HomePage.dart';
import 'package:disoccupied_app/view/pages/navigator_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    ScreenSizeConstants.width = MediaQuery.of(context).size.width;
    ScreenSizeConstants.height = MediaQuery.of(context).size.height;

    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 1)),
        builder: (BuildContext context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Center(
                child: AspectRatio(
                  aspectRatio: 200/38.46,
                  child: Container(
                    width: ScreenSizeConstants.width/2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo1.png')
                      )
                    ),

                  ),
                ),
              ),
            );
          }
          return NavigatorPage();
        }
    );
  }
}
