import 'package:disoccupied_app/utils/ColorConstants.dart';
import 'package:disoccupied_app/utils/SizeConstants.dart';
import 'package:disoccupied_app/utils/TextConstants.dart';
import 'package:disoccupied_app/view/widgets/BannerHeadline.dart';
import 'package:disoccupied_app/view/widgets/BannerText.dart';
import 'package:disoccupied_app/view/widgets/SearchBox.dart';
import 'package:disoccupied_app/view/widgets/SingleTextButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    double pgWidth = MediaQuery.of(context).size.width;
    double pgHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(64),
        child: AppBar(
          centerTitle: false,
          backgroundColor: ColorConstants.backgroundColot,
          elevation: 0,
          // title: Container(),
          leadingWidth: double.infinity,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: pgWidth/2,
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
      backgroundColor: ColorConstants.backgroundColot,
      body: Column(
        children: [
          // SizedBox(height: 64.0,),

          //Search box and motivation
          // Container(
          //   width: pgWidth,
          //   child: AspectRatio(
          //     aspectRatio: SizeConstants.homePageBannerSize,
          //     child: Container(
          //       decoration: BoxDecoration(
          //         image: DecorationImage(
          //           image: AssetImage('assets/images/search-bg-home.png'),
          //           fit:BoxFit.cover
          //         )
          //       ),
          //
          //       child: Padding(
          //         padding: EdgeInsets.all(SizeConstants.defaultPadding),
          //         child: Column(
          //           children: [
          //
          //             SizedBox(
          //               height: SizeConstants.defaultPadding*1.5,
          //             ),
          //             Container(
          //               margin: EdgeInsets.symmetric(horizontal: SizeConstants.defaultPadding
          //               ),
          //               child: Text("What alternatives are you looking for?",
          //                 style: Theme.of(context).textTheme.headlineLarge,
          //                 textAlign: TextAlign.center,
          //               ),
          //             ),
          //             Container(
          //               margin: EdgeInsets.symmetric(horizontal: SizeConstants.defaultPadding,
          //               vertical: SizeConstants.defaultPadding/2),
          //               child: Text(
          //                   "Where you spend your money Matters.\nKnow your alternatives.",
          //                 textAlign: TextAlign.center,
          //                 style: GoogleFonts.roboto(
          //                   fontSize: TextConstants.fontSizeH3,
          //                   color: Color(0xff565D6B),
          //
          //                 ),
          //               ),
          //             ),
          //
          //             // textbox
          //             Container(
          //               height: 55.0,
          //               width: double.infinity,
          //               decoration: BoxDecoration(
          //                 color: Colors.white,
          //                 borderRadius: BorderRadius.all(Radius.circular(100.0)),
          //                 border: Border.all(color: Colors.black, width: 0.5)
          //               ),
          //
          //               child: Row(
          //
          //                 children: [
          //
          //                   AspectRatio(aspectRatio: 1,
          //                     child: Icon(Icons.search,
          //                       color: Colors.black,
          //                       size: 25.0,
          //                     ),
          //                   ),
          //                   Expanded(
          //                     child: TextField(
          //                       decoration: InputDecoration(
          //                           border: UnderlineInputBorder(
          //                             borderSide: const BorderSide(
          //                               width: 0.0,
          //                               style: BorderStyle.none,
          //                             ),
          //                           ),
          //                       ),
          //                   ),
          //                   ),
          //                   AspectRatio(aspectRatio: 1,
          //                     child: Column(
          //                       mainAxisAlignment: MainAxisAlignment.center,
          //                       crossAxisAlignment: CrossAxisAlignment.center,
          //                       children: [
          //                         SvgPicture.asset(
          //                             'assets/svg/qr_scan_icon.svg',
          //                           height: 25.0,
          //                           width: 25.0,
          //                         ),
          //                       ],
          //                     ),
          //
          //                   )
          //                 ],
          //               ),
          //
          //             ),
          //
          //             SizedBox(
          //               height: SizeConstants.defaultPadding,
          //             ),
          //
          //             Container(
          //               margin: EdgeInsets.symmetric(horizontal: SizeConstants.defaultPadding),
          //               width: double.infinity,
          //               padding: EdgeInsets.all(8.0),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   Text("Select country for best results",
          //                     style: GoogleFonts.roboto(
          //                       color: ColorConstants.seedColorText
          //                     ),
          //                   ),
          //
          //                   Icon(Icons.arrow_drop_down,
          //                     color: ColorConstants.seedColorText,
          //                     size: 20.0,
          //                   )
          //                 ],
          //               ),
          //               decoration: BoxDecoration(
          //                 color: Color(0xffEDF4D2),
          //                 borderRadius: BorderRadius.circular(10.0)
          //               ),
          //             ),
          //
          //           ],
          //         ),
          //       ),
          //
          //     ),
          //   ),
          // ),

          // other options
          Expanded(
            child: ListView(
              children: [


                Container(
                  width: pgWidth,
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
                        padding: EdgeInsets.all(SizeConstants.defaultPadding),
                        child: Column(
                          children: [

                            SizedBox(
                              height: SizeConstants.defaultPadding*1.5,
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
                            SearchBox(searchController: searchController,
                              enabled: false,
                            ),

                            SizedBox(
                              height: SizeConstants.defaultPadding,
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
                ),

                SizedBox(
                  height: SizeConstants.defaultPadding,
                ),

                otherOptions(),




              ],
            ),
          ),
        ],
      ),
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

}


