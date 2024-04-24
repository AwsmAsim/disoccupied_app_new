import 'package:disoccupied_app/utils/SizeConstants.dart';
import 'package:disoccupied_app/utils/TextConstants.dart';
import 'package:disoccupied_app/view/pages/more_tab_pages/about_us.dart';
import 'package:disoccupied_app/view/pages/more_tab_pages/contact_us_page.dart';
import 'package:disoccupied_app/view/pages/more_tab_pages/ranking_system_page.dart';
import 'package:disoccupied_app/view/pages/more_tab_pages/resources_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/filter_search_bar.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: null,
          body: Column(
            children: [
              FilterSearchBar(),
              SizedBox(
                height: SizeConstants.defaultPadding,
              ),
              Expanded(
                  child: ListView(
                    children: [
                      moreTab(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>AboutUs())
                          );
                        },
                          title: 'About Us',
                          iconPath: 'assets/svg/more-tab-icons/about_us_icon.svg'
                      ),
                      moreTab(
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=>RankingSystemPage())
                          );
                        },
                          title: 'Ranking System',
                          iconPath: 'assets/svg/more-tab-icons/ranking_system_icon.svg'
                      ),
                      moreTab(
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=>ContactUsPage())
                          );
                        },
                          title: 'Contact Us',
                          iconPath: 'assets/svg/more-tab-icons/contact_us_icon.svg'
                      ),
                      moreTab(
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=>ResoucesPage())
                          );
                        },
                          title: 'Resources',
                          iconPath: 'assets/svg/more-tab-icons/resources_icon.svg'
                      ),

                    ],
                  )
              )
            ],
          ),
        )
    );
  }

  Widget moreTab({required String title, required String iconPath, GestureTapCallback? onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConstants.defaultPadding,
                vertical: SizeConstants.defaultPadding
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                  style: GoogleFonts.roboto(
                      fontSize: TextConstants.fontSizeH3,
                      color: Color(0xff4F4F4F)
                  ),
                ),
                SvgPicture.asset(iconPath)
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[200],
          ),
        ],
      ),
    );
  }

}
