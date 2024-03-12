import 'package:disoccupied_app/controller/brand_controller.dart';
import 'package:disoccupied_app/model/Brand.dart';
import 'package:disoccupied_app/utils/ScreenSizeConstants.dart';
import 'package:disoccupied_app/utils/TextConstants.dart';
import 'package:disoccupied_app/view/pages/search_page.dart';
import 'package:disoccupied_app/view/widgets/BannerHeadline.dart';
import 'package:disoccupied_app/view/widgets/BannerText.dart';
import 'package:disoccupied_app/view/widgets/SingleTextButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/ColorConstants.dart';
import '../../utils/SizeConstants.dart';
import '../widgets/SearchBox.dart';

class ProductPage extends StatelessWidget {

  TextEditingController searchController = new TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: ColorConstants.backgroundColot,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(64),
            child: AppBar(
              centerTitle: false,
              backgroundColor: ColorConstants.backgroundColot,
              elevation: 2,
              // title: Container(),
              leadingWidth: double.infinity,
              leading: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: ScreenSizeConstants.width/2,
                    child: AspectRatio(
                      aspectRatio: SizeConstants.appbarLogoRatio,
                      child: Container(
                        width: MediaQuery.of(context).size.width-100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/app-bar-logo.png'),
                              fit: BoxFit.contain
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                Icon(Icons.menu_rounded,
                  color: Colors.black,
                  size: 30.0,
                ),
                SizedBox(width: SizeConstants.defaultPadding,)
              ],
            ),
          ),
          body: Padding(
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
                    child: Container(
                      child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BannerHeadline(
                                text: brandController.errorMessage,
                              ),
                              SizedBox(height: SizeConstants.defaultPadding,),
                              SingleTextButton(
                                  buttonText: "Go Back",
                                onPressed: (){
                                    Navigator.of(context).pop();
                                },
                              ),
                            ],
                          )),
                    ),
                  );
                }

                return ListView(
                  children: [
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
                        Text('Name of parent company: ${snapshot.data!.name}',
                          style: GoogleFonts.staatliches(
                              color: Colors.grey[600],
                              fontSize: TextConstants.fontSizeH3
                          ),
                        ),

                        Text('Brand name: ${snapshot.data!.company.companyName}',
                          style: GoogleFonts.staatliches(
                              color: Colors.black,
                              fontSize: TextConstants.fontSizeH3
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


                    SizedBox(height: SizeConstants.defaultPadding*2,),

                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("REASON:",
                            style: GoogleFonts.staatliches(
                              // letterSpacing: -1.5,
                              fontWeight: FontWeight.w400,
                              fontSize: TextConstants.fontSizeH2
                            ),
                          ),
                          SizedBox(height: SizeConstants.defaultPadding/2,),

                          Text(snapshot.data!.desc,
                            style: GoogleFonts.roboto(
                              height: 1.5,
                                fontSize: TextConstants.fontSizeH3
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: SizeConstants.defaultPadding*2,),

                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("SOURCE",
                                  style: GoogleFonts.staatliches(
                                    // letterSpacing: -1.5,
                                      fontWeight: FontWeight.w400,
                                      fontSize: TextConstants.fontSizeH2
                                  ),
                                ),
                                SizedBox(height: SizeConstants.defaultPadding/2,),

                                Text("https:\\\\www.google.com",
                                  style: GoogleFonts.roboto(
                                      height: 1.5,
                                      fontSize: TextConstants.fontSizeH3
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeConstants.defaultPadding/2,
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("CATEGORY",
                                  style: GoogleFonts.staatliches(
                                    // letterSpacing: -1.5,
                                      fontWeight: FontWeight.w400,
                                      fontSize: TextConstants.fontSizeH2
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
                          ),
                        )
                      ],
                    ),

                    SizedBox(
                      height: SizeConstants.defaultPadding,
                    ),

                    Column(
                      children: [
                        Text('ALTERNATIVES TO CONSIDER',
                          style: GoogleFonts.staatliches(
                            fontSize: TextConstants.fontSizeH2
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
                            child: ListView(
                              controller: scrollController,
                              scrollDirection: Axis.horizontal,
                              children: [
                                alternativeCard(),
                                alternativeCard(),
                                alternativeCard(),
                                alternativeCard(),
                                alternativeCard(),
                                alternativeCard(),
                              ],
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

                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context){
                              return SearchPage(searchController: searchController);
                            })
                        );
                      },
                      child: Hero(
                        tag: 'search',
                        child: Material(
                          color: Colors.transparent,
                          child: SearchBox(searchController: searchController,
                            enabled: false,
                          ),
                        ),
                      ),
                    ),


                    SizedBox(height: SizeConstants.defaultPadding*4,)






                  ],
                );
              }
            ),
          ),
        )
    );
  }

  Widget alternativeCard(){
    return Padding(
      padding: EdgeInsets.only(
          left: SizeConstants.defaultPadding/2,
          right: SizeConstants.defaultPadding/2,
        top: 4.0
      ),
      child: Column(
        children: [
          Container(
            width: ScreenSizeConstants.width/3,
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
                          spreadRadius: 2,
                          color: Color(0xff577213)
                      )
                    ]
                ),
              ),
            ),
          ),
          SizedBox(
            height: SizeConstants.defaultPadding/2,
          ),
          Row(
            children: [
              for(int idx = 0; idx < 5; idx++)
                Icon(Icons.star_border_outlined,
                  color: ColorConstants.seedColor,
                  size: ScreenSizeConstants.width/16,
                )
            ],
          ),

          SizedBox(
            height: SizeConstants.defaultPadding/3,
          ),
          Text('NAME: FIFTH APPAREL',
            style: GoogleFonts.staatliches(
                fontSize: TextConstants.fontSizeH3
            ),
          )
        ],
      ),
    );
  }

}
