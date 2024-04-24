import 'package:disoccupied_app/view/widgets/BannerHeadline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/ColorConstants.dart';
import '../utils/SizeConstants.dart';
import '../utils/TextConstants.dart';

class UnusedWidgets extends StatelessWidget {
  const UnusedWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Widget homePageRankChart(){
    return Column(
      children: [
        SizedBox(height: SizeConstants.defaultPadding,),
        BannerHeadline(text: 'Shop consciously.\nKnow your alternatives.',
          textAlign: TextAlign.center,
        ),
        SizedBox(height: SizeConstants.defaultPadding*2,),
        Column(
          children: [
            dividedColumns(
                widgetLeft: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      starButtons(),
                    ],
                  ),
                ),
                widgetRight: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Palestine Supporter',
                        style: TextStyle(
                            color: Color(0xff4F4F4F),
                            fontWeight: FontWeight.w500,
                            fontSize: TextConstants.fontSizeH3
                        ),

                      ),

                      Icon(Icons.info,
                        color: ColorConstants.seedColorText,
                      )
                    ],
                  ),
                )
            ),

            dividedColumns(
                widgetLeft: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      starButtons(
                          title: 'GOOD TO BUY',
                          noOfStars: 3,
                          colorVal: 0xff658022
                      ),
                    ],
                  ),
                ),
                widgetRight: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Potential Ally',
                        style: TextStyle(
                            color: Color(0xff4F4F4F),
                            fontWeight: FontWeight.w500,
                            fontSize: TextConstants.fontSizeH3
                        ),

                      ),

                      Icon(Icons.info,
                        color: ColorConstants.seedColorText,
                      )
                    ],
                  ),
                )
            ),

            dividedColumns(
                widgetLeft: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      starButtons(
                          title: 'OKAY TO BUY',
                          noOfStars: 2,
                          colorVal: 0xff7E9B3A
                      ),
                    ],
                  ),
                ),
                widgetRight: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Neutral Small/Medium',
                        style: TextStyle(
                            color: Color(0xff4F4F4F),
                            fontWeight: FontWeight.w500,
                            fontSize: TextConstants.fontSizeH3
                        ),

                      ),

                      Icon(Icons.info,
                        color: ColorConstants.seedColorText,
                      )
                    ],
                  ),
                )
            ),

            dividedColumns(
                widgetLeft: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      starButtons(
                          title: 'OKAY TO BUY',
                          noOfStars: 1,
                          colorVal: 0xff98B652
                      ),
                    ],
                  ),
                ),
                widgetRight: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Neutral Multinational',
                        style: TextStyle(
                            color: Color(0xff4F4F4F),
                            fontWeight: FontWeight.w500,
                            fontSize: TextConstants.fontSizeH3
                        ),

                      ),

                      Icon(Icons.info,
                        color: ColorConstants.seedColorText,
                      )
                    ],
                  ),
                )
            ),

            dividedColumns(
                widgetLeft: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      cautionButton(),
                    ],
                  ),
                ),
                widgetRight: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Indirect Support',
                        style: TextStyle(
                            color: Color(0xff4F4F4F),
                            fontWeight: FontWeight.w500,
                            fontSize: TextConstants.fontSizeH3
                        ),

                      ),

                      Icon(Icons.info,
                        color: ColorConstants.seedColorText,
                      )
                    ],
                  ),
                )
            ),

            dividedColumns(
                widgetLeft: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      starButtons(
                          title: 'OKAY TO BUY',
                          noOfStars: 1,
                          colorVal: 0xff98B652
                      ),
                    ],
                  ),
                ),
                widgetRight: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Public Support',
                        style: TextStyle(
                            color: Color(0xff4F4F4F),
                            fontWeight: FontWeight.w500,
                            fontSize: TextConstants.fontSizeH3
                        ),

                      ),

                      Icon(Icons.info,
                        color: ColorConstants.seedColorText,
                      )
                    ],
                  ),
                )
            ),

            dividedColumns(
                widgetLeft: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      starButtons(
                          title: 'OKAY TO BUY',
                          noOfStars: 1,
                          colorVal: 0xff98B652
                      ),
                    ],
                  ),
                ),
                widgetRight: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Economic Support',
                        style: TextStyle(
                            color: Color(0xff4F4F4F),
                            fontWeight: FontWeight.w500,
                            fontSize: TextConstants.fontSizeH3
                        ),

                      ),

                      Icon(Icons.info,
                        color: ColorConstants.seedColorText,
                      )
                    ],
                  ),
                )
            )


          ],
        )
      ],
    );
  }

  Widget appBarHomePage(BuildContext context, double pgWidth){
    return PreferredSize(
      preferredSize: Size.fromHeight(64),
      child: AppBar(
        centerTitle: false,
        backgroundColor: ColorConstants.seedColor,
        elevation: 0,
        // title: Container(),
        leadingWidth: double.infinity,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: pgWidth/2.4,
              child: AspectRatio(
                aspectRatio: SizeConstants.appbarLogoRatio,
                child: Container(
                  width: MediaQuery.of(context).size.width-100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/logo1.png'),
                        fit: BoxFit.contain
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            height: 25.0,
            child: Center(
              child: Text('🇵🇸',
                style: TextStyle(
                    fontSize: 25.0
                ),
              ),
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          SvgPicture.asset('assets/svg/user_round.svg',
            colorFilter: ColorFilter.mode(ColorConstants.seedColorText, BlendMode.srcIn),
            height: 24.0,
            width: 24.0,
          ),
          SizedBox(
            width: 8.0,
          ),
          SvgPicture.asset('assets/svg/settings-icon.svg',
            colorFilter: ColorFilter.mode(ColorConstants.seedColorText, BlendMode.srcIn),
            height: 25.0,
            width: 25.0,
          ),
          SizedBox(width: SizeConstants.defaultPadding,)
        ],
      ),
    );
  }

  Widget cautionButton(){
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 8.0
      ),
      decoration: BoxDecoration(
          color: Color(0xffE4A11B),
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
                offset: Offset(0,4),
                blurRadius: 9.0,
                color: Colors.black.withOpacity(0.25)
            )
          ]
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.warning,
                size: TextConstants.fontSizeH4,
                color: Colors.white,
              ),
              SizedBox(width: 8.0,),
              Text('Caution',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: TextConstants.fontSizeH4,
                    fontWeight: FontWeight.w500
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget starButtons({
    int noOfStars = 4,
    String title = "GREAT TO BUY",
    int colorVal = 0xff4D6705
  }){
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 8.0
      ),
      decoration: BoxDecoration(
          color: Color(colorVal),
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
                offset: Offset(0,4),
                blurRadius: 9.0,
                color: Colors.black.withOpacity(0.25)
            )
          ]
      ),
      child: Column(
        children: [
          Text(title,
            style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: TextConstants.fontSizeH4,
                fontWeight: FontWeight.w500
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int idx = 0; idx < noOfStars; idx++)
                ...[
                  Icon(Icons.star,
                    color: Colors.white,
                    size: TextConstants.fontSizeH4-2,
                  ),
                  SizedBox(width: 5.0,),
                ]
            ],
          )
        ],
      ),
    );
  }

  Widget dividedColumns({
    required Widget widgetLeft,
    required Widget widgetRight
  }){
    return Container(
      margin: EdgeInsets.only(bottom: SizeConstants.defaultPadding),
      padding: EdgeInsets.symmetric(horizontal: SizeConstants.defaultPadding),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: widgetLeft,
          ),

          SizedBox(width: SizeConstants.defaultPadding,),

          Expanded(
            flex: 6,
            child: widgetRight,
          )
        ],
      ),
    );
  }
}
