import 'package:disoccupied_app/utils/ScreenSizeConstants.dart';
import 'package:disoccupied_app/view/pages/product_page.dart';
import 'package:disoccupied_app/view/widgets/BannerHeadline.dart';
import 'package:disoccupied_app/view/widgets/BannerText.dart';
import 'package:disoccupied_app/view/widgets/SearchBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/ColorConstants.dart';
import '../../utils/SizeConstants.dart';

class SearchPage extends StatelessWidget {

  SearchPage({required this.searchController});

  TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          child: Column(
            children: [
              Hero(
                tag: "search",
                child: Material(
                  child: SearchBox(
                    hasBackButton: true,
                    onTapLeft: (){
                      Navigator.of(context).pop();
                    },
                    searchController: searchController,
                    enabled: true,
                  ),
                ),
              ),

              SizedBox(
                height: SizeConstants.defaultPadding,
              ),

              Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConstants.defaultPadding),
                    child: ListView(
                      children: [
                        InkWell(
                            onTap: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=>ProductPage(brandName: 'Nike',))
                              );
                            },
                            child: BannerHeadline(text: 'Nike'),
                        ),
                        Container(
                          height: 1.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                        ),

                        SizedBox(height: SizeConstants.defaultPadding/2,),

                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=>ProductPage(brandName: 'KitKat',))
                            );
                          },
                          child: BannerHeadline(text: 'KitKat'),
                        ),
                        Container(
                          height: 1.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                        )
                      ],
                    ),
                  )
              )

            ],
          ),
        ),
      ),
    );
  }
}
