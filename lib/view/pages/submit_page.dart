import 'package:disoccupied_app/utils/TextConstants.dart';
import 'package:disoccupied_app/view/widgets/filter_search_bar.dart';
import 'package:disoccupied_app/view/widgets/form_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/ColorConstants.dart';
import '../../utils/Constants.dart';
import '../../utils/SizeConstants.dart';
import '../widgets/SearchBox.dart';
import '../widgets/submit_button.dart';

class SubmitPage extends StatelessWidget {
  SubmitPage({super.key});

  TextEditingController nameController = TextEditingController(),
      emailController = TextEditingController(),
      brandNameController = TextEditingController(),
      brandLinkController = TextEditingController(),
      additionalInfoController = TextEditingController(),
      countriesController = TextEditingController();

  List<String> reasonList = [
    "Select Reason",
    "Missing from List",
    "Alternative Suggestion",
    "Logo Not Recognized",
    "Other (Specify)"
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: Column(
        children: [
          FilterSearchBar(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: SizeConstants.defaultPadding,
                right: SizeConstants.defaultPadding,
                top: SizeConstants.defaultPadding
              ),
              child: ListView(
                children: [
                  Text('Submit a Brand',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: TextConstants.fontSizeH2
                   ),
                  ),

                  SizedBox(
                    height: SizeConstants.defaultPadding,
                  ),

                  FormTextField(
                      hintText: 'Your Name',
                      controller: nameController
                  ),
                  FormTextField(
                      hintText: 'Your Email',
                      controller: emailController
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color(0xffBDBDBD),
                      ),
                    ),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: SizeConstants.defaultPadding),
                    margin: EdgeInsets.symmetric(vertical: SizeConstants.defaultPadding / 2),
                    height: 50,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      items: reasonList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                            style: GoogleFonts.roboto(fontSize: TextConstants.fontSizeH3),
                          ),
                        );
                      }).toList(),
                      value: "Select Reason",
                      onChanged: (_) {},
                      underline: SizedBox(),
                    ),
                  ),
                  FormTextField(
                      hintText: 'Brand Name',
                      controller: brandNameController
                  ),
                  FormTextField(
                      hintText: 'Countries this brand is sold in',
                      controller: countriesController
                  ),
                  FormTextField(
                      hintText: 'Brand website or social media account',
                      controller: brandLinkController
                  ),
                  FormTextField(
                      hintText: 'Additional Info',
                      controller: additionalInfoController,
                    isMultiline: true,
                  ),

                  SizedBox(
                    height: SizeConstants.defaultPadding,
                  ),

                  SubmitButton(
                    title: 'Submit For Review'
                  ),

                  SizedBox(height: SizeConstants.defaultPadding*2,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget formTextField({
    required String hintText,
    required TextEditingController controller,
    final ValueChanged<String>? onChanged
  }){
    return Container(
      padding: EdgeInsets.symmetric(vertical: SizeConstants.defaultPadding/2),
      height: SizeConstants.defaultPadding*3 + SizeConstants.defaultPadding,
      child: TextField(
        onChanged: (text){

        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: SizeConstants.defaultPadding
            ),
            hintText: 'Your Name',
            hintStyle: GoogleFonts.roboto(
                fontSize: TextConstants.fontSizeH3
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color(0xffBDBDBD)
                ),
                borderRadius: BorderRadius.circular(4.0)
            ),
            filled: true,
            fillColor: Colors.white
        ),
      ),
    );
  }
}
