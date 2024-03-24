import 'package:disoccupied_app/controller/brand_controller.dart';
import 'package:disoccupied_app/view/pages/product_page.dart';
import 'package:disoccupied_app/view/widgets/course_dropdown_text_field.dart';
import 'package:drop_down_search_field/drop_down_search_field.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';


class SearchBox extends StatelessWidget {
  SearchBox({super.key, required this.searchController,
    this.enabled = true,
    this.hasBackButton = false,
    this.onTapLeft,
    this.onTapRight,
    this.autoFocus = false
  });

  TextEditingController searchController;
  GestureTapCallback? onTapLeft;
  GestureTapCallback? onTapRight;
  bool enabled;
  bool hasBackButton;
  bool autoFocus;

  BrandController brandController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
        boxShadow: [
          BoxShadow(
            offset: Offset(2,2),
            blurRadius: 4.0,
            color: Colors.black26
          ),
        ]
      ),

      child: Row(

        children: [

          hasBackButton ?
          InkWell(
            onTap: onTapLeft,
            child: AspectRatio(aspectRatio: 1,
              child: Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
                size: 25.0,
              ),
            ),
          )
              :
          InkWell(
            onTap: onTapLeft,
            child: AspectRatio(aspectRatio: 1,
              child: Icon(Icons.search,
                color: Colors.black,
                size: 25.0,
              ),
            ),
          ),
          // Expanded(
          //   child: Column(
          //     children: [
          //       Expanded(
          //         child: TextField(
          //           onChanged: (text){
          //             print(searchController.text);
          //             brandController.getBrands(text);
          //
          //           },
          //           autofocus: autoFocus,
          //           controller: searchController,
          //           enabled: enabled,
          //           decoration: InputDecoration(
          //             border: UnderlineInputBorder(
          //               borderSide: const BorderSide(
          //                 width: 0.0,
          //                 style: BorderStyle.none,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //           GetBuilder<BrandController>(
          //             builder: (controller) {
          //               return DropdownButton<String>(
          //                 isExpanded: true, // Expand the dropdown width
          //                 underline: Container(), // Remove default underline
          //                 items: controller.loadedBrands.map<DropdownMenuItem<String>>((String suggestion) {
          //                   return DropdownMenuItem<String>(
          //                     value: suggestion,
          //                     child: Text(suggestion),
          //                   );
          //                 }).toList(),
          //                 onChanged: (value) {
          //                   // Handle selection (optional)
          //                 },
          //               );
          //             }
          //           ),
          //     ],
          //   ),
          // ),

          // Expanded(
          //     child: GetBuilder<BrandController>(
          //
          //       builder: (controller) {
          //         print(controller.loadedBrands);
          //         return DropDownSearchField(
          //           textFieldConfiguration: TextFieldConfiguration(
          //               autofocus: true,
          //               style: DefaultTextStyle.of(context).style.copyWith(
          //                   fontStyle: FontStyle.italic
          //               ),
          //               decoration: InputDecoration(
          //                   border: InputBorder.none,
          //                 hintText: "Enter brand name"
          //               )
          //           ),
          //           suggestionsCallback: (pattern) async {
          //             return await brandController.getBrands(pattern);
          //           },
          //           itemBuilder: (context, suggestion) {
          //             return ListTile(
          //               title: Text(suggestion),
          //             );
          //           },
          //           onSuggestionSelected: (suggestion) {
          //             Navigator.of(context).push(MaterialPageRoute(
          //                 builder: (context) => ProductPage(brandName: suggestion)
          //             ));
          //           },
          //           displayAllSuggestionWhenTap: true,
          //         );
          //       }
          //     )
          // ),

          Expanded(
            child: DropDownSearchField(
              textFieldConfiguration: TextFieldConfiguration(
                  autofocus: true,
                  style: DefaultTextStyle.of(context).style.copyWith(
                      fontStyle: FontStyle.italic
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter brand name"
                  )
              ),
              suggestionsCallback: (pattern) async {
                return await brandController.getBrands(pattern);
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },
              onSuggestionSelected: (suggestion) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProductPage(brandName: suggestion)
                ));
              },
              displayAllSuggestionWhenTap: true,
            ),
          ),
          // Expanded(
          //     child: GetBuilder<BrandController>(
          //       builder: (controller) {
          //         return DropdownSearch<String>(
          //           popupProps: PopupProps.menu(
          //             showSelectedItems: true,
          //             disabledItemFn: (String s) => s.startsWith('I'),
          //           ),
          //           items: controller.allBrands,
          //           dropdownDecoratorProps: DropDownDecoratorProps(
          //             dropdownSearchDecoration: InputDecoration(
          //               hintText: "country in menu mode",
          //               border: InputBorder.none
          //             ),
          //           ),
          //           onChanged: print,
          //           selectedItem: "Brazil",
          //         );
          //       }
          //     ),
          // ),


          InkWell(
            onTap: onTapRight,
            child: AspectRatio(aspectRatio: 1,
              child: Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Color(0xffEAF1E6),
                  shape: BoxShape.circle
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/camera_icon.svg',
                      height: 25.0,
                      width: 25.0,

                    ),
                  ],
                ),
              ),

            ),
          )
        ],
      ),

    );
  }
}
