import 'package:disoccupied_app/utils/ColorConstants.dart';
import 'package:disoccupied_app/utils/Constants.dart';
import 'package:disoccupied_app/utils/ScreenSizeConstants.dart';
import 'package:disoccupied_app/utils/SizeConstants.dart';
import 'package:disoccupied_app/utils/TextConstants.dart';
import 'package:disoccupied_app/view/pages/search_page.dart';
import 'package:disoccupied_app/view/widgets/BannerHeadline.dart';
import 'package:disoccupied_app/view/widgets/BannerText.dart';
import 'package:disoccupied_app/view/widgets/SearchBox.dart';
import 'package:disoccupied_app/view/widgets/SingleTextButton.dart';
import 'package:disoccupied_app/view/widgets/custom_%20chip.dart';
import 'package:disoccupied_app/view/widgets/custom_grid_view_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/home_page_news_card.dart';

class HomePage extends StatelessWidget {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    double pgWidth = MediaQuery.of(context).size.width;
    double pgHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: null,
      backgroundColor: ColorConstants.backgroundColot,
      body: Column(
        children: [

          Expanded(
            child: ListView(
              children: [

                // shop conciously
                Container(
                  padding: EdgeInsets.only(
                    top: SizeConstants.defaultPadding,
                    left: SizeConstants.defaultPadding,
                    right: SizeConstants.defaultPadding,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[100]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shop Conciously',
                            style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              color: ColorConstants.seedColorText
                            ),
                          ),
                          Text('Know Your Alternatives',
                            style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: ColorConstants.seedColorText
                            ),
                          )
                        ],
                      ),

                      Row(
                        children: [
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
                        ],
                      )
                    ],
                  ),
                ),

                // Search box
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConstants.defaultPadding,
                    vertical: SizeConstants.defaultPadding
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0,2),
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4.0
                      ),
                      BoxShadow(
                          offset: Offset(0,4),
                          color: Colors.black.withOpacity(0.07),
                          blurRadius: 12.0
                      ),
                    ]
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
                ),


                // news list
                Container(
                  padding: EdgeInsets.only(
                      bottom: SizeConstants.defaultPadding,
                      // top: SizeConstants.defaultPadding
                  ),
                  color: Colors.grey[200],
                  height: MediaQuery.of(context).size.height/5,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      HomePageNewsCard(
                        headingText: "Disocuppied",
                        subheadingText: "Free Free Palestine",
                        imageUrl: 'https://s3-alpha-sig.figma.com/img/47c1/5d55/ffb8ba63a22d9e6f73133fb6b9df0946?Expires=1712534400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=fp9vLuS3XF22nocsjYnTzrhupePdx1BKJ1cJBB09eKTmqlcYZdDDcqNowRCMOXD0ZwHrJvjildp9LZS6OX6ZL3a16HmppBlLdp-buh8KbmGKR5eSliVgBJ4L8xUrMTFzNga1sE1vrk0BKgPFVxaTreHHJBL5I7ruK8GlF1sB6DBp1LLWpB8Z-YAz6OCFyJYuAY9L1Eioh00iO23u9TKJJwOdJfqbUOSg5uZM8scAQP3kpGfTqzxBO-YlVoEsgOLui9D1QmxDMVIDua3aGw9dBchaBdwEo2KZz9ef8RC~v6iZfplS5ns6Z8V-Ca4tr-SEZIumVILUGyWKi1iOZnSU9w__',
                      ),

                      HomePageNewsCard(
                        headingText: "Disocuppied",
                        subheadingText: "Free Free Palestine",
                        imageUrl: 'https://s3-alpha-sig.figma.com/img/47c1/5d55/ffb8ba63a22d9e6f73133fb6b9df0946?Expires=1712534400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=fp9vLuS3XF22nocsjYnTzrhupePdx1BKJ1cJBB09eKTmqlcYZdDDcqNowRCMOXD0ZwHrJvjildp9LZS6OX6ZL3a16HmppBlLdp-buh8KbmGKR5eSliVgBJ4L8xUrMTFzNga1sE1vrk0BKgPFVxaTreHHJBL5I7ruK8GlF1sB6DBp1LLWpB8Z-YAz6OCFyJYuAY9L1Eioh00iO23u9TKJJwOdJfqbUOSg5uZM8scAQP3kpGfTqzxBO-YlVoEsgOLui9D1QmxDMVIDua3aGw9dBchaBdwEo2KZz9ef8RC~v6iZfplS5ns6Z8V-Ca4tr-SEZIumVILUGyWKi1iOZnSU9w__',
                      ),



                    ],
                  ),
                ),

                SizedBox(
                  height: SizeConstants.defaultPadding,
                ),

                recentlyAdded()






              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget recentlyAdded(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: SizeConstants.defaultPadding),
          child: Text("Recommended Alternatives",
            style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: TextConstants.fontSizeH2-2,
                fontWeight: FontWeight.w600
            ),
          ),
        ),

        SizedBox(
          height: SizeConstants.defaultPadding/3,
        ),

        // Container(
        //   height: 30,
        //   width: double.infinity,
        //   child: ListView(
        //     scrollDirection: Axis.horizontal,
        //     children: [
        //       CustomChip(isSelected: true, title: "All categories"),
        //
        //       CustomChip(isSelected: false, title: "fooddfs"),
        //       CustomChip(isSelected: false, title: "foosdfsdfd"),
        //       CustomChip(isSelected: false, title: "sdfssdfsd"),
        //       CustomChip(isSelected: false, title: "dsfdsfsdf"),
        //     ],
        //   ),
        // ),
        //
        SizedBox(
          height: SizeConstants.defaultPadding,
        ),

        // other brands list
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConstants.defaultPadding),
          child: Column(
            children: [
              for(int rowIdx = 0; rowIdx < 7/2; rowIdx++)
                ...[Row(
                  children: [
                    for(int colIdx = 0; colIdx < 2; colIdx++)
                      ...[
                        (colIdx+2*rowIdx) < 7 ?
                        Expanded(
                          child: CustomGridViewCard(
                            imageURL: 'https://disoccupiedlogos.s3.us-east-1.amazonaws.com/Pepsi_logo.png',
                            rank: RANKING['do_not_buy']![0],
                            brand: 'Pepsi',
                            noOfStars: RANKING['do_not_buy']![1],
                          ),
                        ): Expanded(child: Container(),),
                        if(colIdx%2==0)
                          SizedBox(
                            width: SizeConstants.defaultPadding,
                          ),]
                  ],
                ),
                  SizedBox(height: SizeConstants.defaultPadding,),
                ],
            ],
          ),
        ),

      ],
    );
  }

  Widget otherOptions(){
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Product Missing?",
                  style: GoogleFonts.roboto(
                      fontSize: TextConstants.fontSizeH2
                  ),
                ),

                SizedBox(
                  height: SizeConstants.defaultPadding,
                ),

                SingleTextButton(buttonText: "Submit",
                  onPressed: (){},
                ),

              ],
            ),


            SizedBox(
              height: SizeConstants.defaultPadding*2,
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Want to get support?",
                  style: GoogleFonts.roboto(
                      fontSize: TextConstants.fontSizeH2,
                  ),
                ),

                SizedBox(
                  height: SizeConstants.defaultPadding,
                ),

                SingleTextButton(buttonText: "Donate",
                  onPressed: (){},
                ),

              ],
            ),

            SizedBox(
              height: SizeConstants.defaultPadding*2,
            ),

            Column(
              children: [
                Text("Want to get involved?",
                  style: GoogleFonts.roboto(
                      fontSize: TextConstants.fontSizeH2
                  ),
                ),

                SizedBox(
                  height: SizeConstants.defaultPadding,
                ),

                SingleTextButton(buttonText: "Join", onPressed: (){},)

              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget oldSearchBox(BuildContext context){
    return Container(
      width: ScreenSizeConstants.width,
      child: AspectRatio(
        aspectRatio: SizeConstants.homePageBannerSize,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/search-bg-home.png'),
                  fit:BoxFit.cover
              )
          ),

          child: Padding(
            padding: EdgeInsets.only(
                left: SizeConstants.defaultPadding,
                right: SizeConstants.defaultPadding,
                bottom: SizeConstants.defaultPadding
            ),
            child: Column(
              children: [

                Flexible(
                  child: SizedBox(
                    height: SizeConstants.defaultPadding*1.5 + SizeConstants.defaultPadding,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: SizeConstants.defaultPadding
                  ),
                  child: BannerHeadline(
                    text: "What alternatives are you looking for?",
                    textAlign: TextAlign.center,
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: SizeConstants.defaultPadding,
                      vertical: SizeConstants.defaultPadding/2),
                  child: BannerText(
                      text: "Where you spend your money Matters.\nKnow your alternatives.",
                      textAlign: TextAlign.center
                  ),
                ),

                // textbox
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

                Flexible(
                  child: SizedBox(
                    height: SizeConstants.defaultPadding,
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: SizeConstants.defaultPadding),
                  width: double.infinity,
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Select country for best results",
                        style: GoogleFonts.roboto(
                            color: ColorConstants.seedColorText
                        ),
                      ),

                      Icon(Icons.arrow_drop_down,
                        color: ColorConstants.seedColorText,
                        size: 20.0,
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xffEDF4D2),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                ),

              ],
            ),
          ),

        ),
      ),
    );
  }

}


