import 'package:disoccupied_app/utils/SizeConstants.dart';
import 'package:disoccupied_app/utils/TextConstants.dart';
import 'package:disoccupied_app/view/widgets/form_text_field.dart';
import 'package:disoccupied_app/view/widgets/more_pages_scaffold.dart';
import 'package:disoccupied_app/view/widgets/submit_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactUsPage extends StatelessWidget {

  TextEditingController nameController = TextEditingController(),
  emailController = TextEditingController(),
  messageController = TextEditingController(),
  phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MorePagesScaffold(
        widgets: [
          Padding(
            padding: EdgeInsets.only(
              left: SizeConstants.defaultPadding,
              right: SizeConstants.defaultPadding,
              top: SizeConstants.defaultPadding
            ),
            child: Column(
              children: [
                Text(TextConstants.contactUsText,
                  style: GoogleFonts.roboto(
                    color: Color(0xff4F4F4F),
                    fontSize: TextConstants.fontSizeH3,
                    height: 1.5
                  ),
                ),
                SizedBox(
                  height: SizeConstants.defaultPadding,
                ),
                FormTextField(hintText: 'Name', controller: nameController),
                FormTextField(hintText: 'Email', controller: emailController),
                FormTextField(hintText: 'Phone number (optional)', controller: phoneNumberController),
                FormTextField(hintText: 'Message', controller: messageController),
                SizedBox(height: SizeConstants.defaultPadding,),
                SubmitButton(title: 'Send', onTap: (){},),
                SizedBox(height: SizeConstants.defaultPadding*2,),
                Text(TextConstants.contactUsFollowText,
                  maxLines: 3,
                  style: GoogleFonts.roboto(
                    height: 1.5,
                    fontSize: TextConstants.fontSizeH3,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
        title: 'Contact Us'
    );
  }
}
