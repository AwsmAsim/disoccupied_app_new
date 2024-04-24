import 'package:disoccupied_app/controller/brand_controller.dart';
import 'package:disoccupied_app/model/Brand.dart';
import 'package:disoccupied_app/model/alternative.dart';
import 'package:disoccupied_app/utils/Constants.dart';
import 'package:disoccupied_app/utils/ScreenSizeConstants.dart';
import 'package:disoccupied_app/utils/TextConstants.dart';
import 'package:disoccupied_app/view/pages/search_page.dart';
import 'package:disoccupied_app/view/widgets/BannerHeadline.dart';
import 'package:disoccupied_app/view/widgets/BannerText.dart';
import 'package:disoccupied_app/view/widgets/SingleTextButton.dart';
import 'package:disoccupied_app/view/widgets/error_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/ColorConstants.dart';
import '../../utils/SizeConstants.dart';
import '../widgets/SearchBox.dart';

class ProductPage extends StatelessWidget {
  ScrollController scrollController = new ScrollController();
  String brandName;
  BrandController brandController = BrandController();

  ProductPage({required this.brandName});

  moveForward(){
    scrollController.animateTo(scrollController.offset + ScreenSizeConstants.width/3, duration: Duration(seconds: 1), curve: Curves.easeIn);
  }

  moveBackward(){

    scrollController.animateTo(scrollController.offset - ScreenSizeConstants.width/3, duration: Duration(seconds: 1), curve: Curves.easeIn);
  }

  Widget searchBar(){
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConstants.defaultPadding,
          vertical: SizeConstants.defaultPadding
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: SizedBox(
        height: 50.0,
        child: Row(
          children: [
            Expanded(
              child: SearchBox(
                searchController: searchController,
                enabled: true,
              ),
            ),

            SizedBox(
              width: SizeConstants.defaultPadding-10,
            ),

            AspectRatio(
              aspectRatio: 1,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: ColorConstants.seedColorText,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0,5),
                        blurRadius: 15,
                        color: Colors.black.withOpacity(0.25),
                      )
                    ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/filter-icon.svg',
                      height: SizeConstants.iconSize,
                      width: SizeConstants.iconSize,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget loadingScreen(){
    return Container(
      height: ScreenSizeConstants.height,
      width: ScreenSizeConstants.width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: ColorConstants.seedColor,
            ),
            SizedBox(height: SizeConstants.defaultPadding,),
            BannerText(text: "Loading..."),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: SafeArea(
          child: Scaffold(
            backgroundColor: ColorConstants.backgroundColot,
            appBar: null,
            extendBodyBehindAppBar: true,
            body: Column(
              children: [
                searchBar(),
                SizedBox(
                  height: SizeConstants.defaultPadding,
                ),
                Padding(
                  padding: EdgeInsets.only(left: SizeConstants.defaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.arrow_back_ios_rounded,
                          size: SizeConstants.iconSize-5,
                          color: Colors.black,
                        ),
                      ),
                      Container()
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: SizeConstants.defaultPadding,
                      right: SizeConstants.defaultPadding,
                      top: SizeConstants.defaultPadding
                    ),
                    child: FutureBuilder<Brand?>(
                      future: brandController.getBrandData(brandName),
                      builder: (context, snapshot) {

                        if(snapshot.connectionState != ConnectionState.done){
                          return Container(
                            height: ScreenSizeConstants.height,
                            width: ScreenSizeConstants.width,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    color: ColorConstants.seedColor,
                                  ),
                                  SizedBox(height: SizeConstants.defaultPadding,),
                                  BannerText(text: "Loading..."),
                                ],
                              ),
                            ),
                          );
                        }

                        if(snapshot.data == null){
                          return Expanded(
                            child: loadingScreen(),
                          );
                        }

                        return ListView(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [],
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: SizeConstants.defaultPadding*4,
                                  right: SizeConstants.defaultPadding*4,
                              ),
                              width: double.infinity,
                              child: AspectRatio(
                                  aspectRatio: SizeConstants.productImageRatio,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: (snapshot.data!.brandImage!=null) ? DecorationImage(
                                        image: NetworkImage(
                                          snapshot.data!.brandImage!
                                        )
                                      ): null
                                    ),
                                  )
                              ),
                            ),

                            SizedBox(
                              height: SizeConstants.defaultPadding,
                            ),

                            Column(
                              children: [
                                Text('PARENT COMPANY: ${snapshot.data!.name}'.toUpperCase(),
                                  style: GoogleFonts.roboto(
                                      color: Colors.grey[600],
                                      fontSize: TextConstants.fontSizeH4
                                  ),
                                ),

                                Text('BRAND: ${snapshot.data!.company.companyName}',
                                  style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: TextConstants.fontSizeH3,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),

                                SizedBox(
                                  height: SizeConstants.defaultPadding,
                                ),

                                Container(
                                  width: ScreenSizeConstants.width/2,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.25), // #000000 with 40% opacity
                                          blurRadius: 9.0, // Blur radius
                                          offset: Offset(0.0, 4.0), // Offset (horizontal, vertical)
                                        ),
                                      ],
                                      color: Color(0xffBA1A1A)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset('assets/svg/cross-icon.svg',
                                        color: Colors.white,
                                        height: TextConstants.fontSizeH3,
                                        width: TextConstants.fontSizeH3,
                                      ),

                                      SizedBox(
                                        width: 8.0 ,
                                      ),

                                      Text('DO NOT BUY',
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: SizeConstants.defaultPadding*2,
                            ),

                            Column(
                              children: [
                                Text('ALTERNATIVES TO CONSIDER',
                                  style: GoogleFonts.staatliches(
                                      fontSize: TextConstants.fontSizeH2,
                                    color: ColorConstants.textColor2
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(height: SizeConstants.defaultPadding,),

                            Container(
                              width: double.infinity,
                              height: (ScreenSizeConstants.width/3) + SizeConstants.defaultPadding + (ScreenSizeConstants.width/4),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: (){},
                                    child: Container(
                                      width: 30.0,
                                      child: Column(
                                        children: [
                                          SizedBox(height: ScreenSizeConstants.width/6 - 15.0,),
                                          Icon(Icons.arrow_back_ios_rounded),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: FutureBuilder<List<Alternative>?>(
                                      future: brandController.getBrandAlternatives(brandName),
                                      builder: (BuildContext context, snapshot){
                                        if(snapshot.connectionState == ConnectionState.waiting){
                                          return loadingScreen();
                                        }
                                        if(snapshot.data == null && brandController.errorMessage.isNotEmpty){
                                          return ErrorPage();
                                        }

                                        if(snapshot.hasData && snapshot.data!.length == 0){
                                          return Container(
                                            child: Center(
                                              child: Text(
                                                  "No alternative found",
                                                style: GoogleFonts.roboto(
                                                  fontSize: TextConstants.fontSizeH3
                                                ),
                                              ),
                                            ),
                                          );
                                        }

                                        if(snapshot.hasData) {
                                          return
                                          ListView(
                                          controller: scrollController,
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            for(int idx = 0; idx < snapshot.data!.length; idx++)
                                              alternativeCard(
                                                noOfStars: RANKING[snapshot.data![idx].level]![1],
                                                alternativeName: snapshot.data![idx].name,
                                                alternateImageUrl: snapshot.data![idx].imageUrl

                                              )
                                          ],
                                        );
                                        }

                                        return ErrorPage();
                                      },
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      moveForward();
                                    },
                                    child: Container(
                                      width: 30.0,
                                      child: Column(
                                        children: [
                                          SizedBox(height: ScreenSizeConstants.width/6 - 15.0,),
                                          Icon(Icons.arrow_forward_ios_rounded),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),


                            Container(
                              padding: EdgeInsets.all(SizeConstants.defaultPadding),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xffEAF1E6),
                                borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Reason:",
                                        style: GoogleFonts.inter(
                                          // letterSpacing: -1.5,
                                          fontWeight: FontWeight.w600,
                                          fontSize: TextConstants.fontSizeH2,
                                          color: ColorConstants.textColor2
                                        ),
                                      ),
                                      SizedBox(height: SizeConstants.defaultPadding/2,),

                                      Text(snapshot.data!.desc,
                                        style: GoogleFonts.roboto(
                                          height: 1.5,
                                            fontSize: TextConstants.fontSizeH3,
                                          color: ColorConstants.descTextColor
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: SizeConstants.defaultPadding,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Category",
                                        style: GoogleFonts.inter(
                                          // letterSpacing: -1.5,
                                            fontWeight: FontWeight.w600,
                                            fontSize: TextConstants.fontSizeH2,
                                            color: Color(0xff222222),
                                        ),
                                      ),
                                      SizedBox(height: SizeConstants.defaultPadding/2,),

                                      for(String category in snapshot.data!.categories)
                                        Chip(
                                            label: Text(category,
                                              style: GoogleFonts.roboto(
                                                  fontSize: TextConstants.fontSizeH4,
                                                  color: Color(0xff4F4F4F)
                                              ),

                                            )
                                        )
                                    ],
                                  ),
                                ],
                              ),
                            ),



                            SizedBox(height: SizeConstants.defaultPadding*4,)






                          ],
                        );
                      }
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }

  Widget alternativeCard({required String alternativeName, required int noOfStars, String? alternateImageUrl}){
    return Padding(
      padding: EdgeInsets.only(
          left: SizeConstants.defaultPadding,
          right: SizeConstants.defaultPadding,
        top: 4.0
      ),
      child: Column(
        children: [
          Container(
            width: ScreenSizeConstants.width/3.5,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(TextConstants.fontSizeH3),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0,2),
                          blurRadius: 4,
                          spreadRadius: 0,
                          color: Colors.black.withOpacity(0.25)
                      )
                    ],
                  image: (alternateImageUrl != null) ?
                  DecorationImage(
                    image: NetworkImage(alternateImageUrl)
                  ) : null,
                ),
              ),
            ),
          ),
          SizedBox(
            height: SizeConstants.defaultPadding/2,
          ),
          Row(
            children: [
              for(int idx = 0; idx < noOfStars; idx++)
                Icon(Icons.star,
                  color: ColorConstants.seedColorText,
                  size: ScreenSizeConstants.width/16,
                )
            ],
          ),

          SizedBox(
            height: SizeConstants.defaultPadding/3,
          ),
          Text('NAME: ${alternativeName}',
            style: GoogleFonts.staatliches(
                fontSize: TextConstants.fontSizeH3,
              color: ColorConstants.textColor2
            ),
          )
        ],
      ),
    );
  }

}
