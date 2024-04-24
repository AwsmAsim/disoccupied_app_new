import 'package:disoccupied_app/view/widgets/form_text_field.dart';
import 'package:disoccupied_app/view/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/SizeConstants.dart';
import '../../utils/TextConstants.dart';
import '../widgets/filter_search_bar.dart';

class VolunteerPage extends StatelessWidget {

  final TextEditingController nameController = TextEditingController(),
    emailController = TextEditingController(),
    locationController = TextEditingController(),
    phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: null,
        body: Column(
          children: [
            FilterSearchBar(),
            SizedBox(
              height: SizeConstants.defaultPadding,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: SizeConstants.defaultPadding,
                  right: SizeConstants.defaultPadding
                ),
                child: ListView(
                  children: [
                    Text(
                      'Volunteer',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: TextConstants.fontSizeH2),
                    ),
                    SizedBox(
                      height: SizeConstants.defaultPadding,
                    ),
                    Text('If you are interested in joining our volunteer research team, get in touch!',
                      maxLines: 3,
                      style: GoogleFonts.roboto(
                        height: 1.5,
                        fontSize: TextConstants.fontSizeH3,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: SizeConstants.defaultPadding,
                    ),
                    
                    FormTextField(hintText: 'Name', controller: nameController),
                    FormTextField(hintText: 'Email', controller: emailController),
                    FormTextField(hintText: 'Location', controller: locationController),
                    FormTextField(hintText: 'Phone number (optional)', controller: phoneNumberController),

                    SizedBox(
                      height: SizeConstants.defaultPadding,
                    ),

                    SubmitButton(title: 'Send')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
