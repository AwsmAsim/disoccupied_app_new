import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/TextConstants.dart';


class SingleTextButton extends StatelessWidget {
  SingleTextButton({super.key, required this.buttonText, this.onPressed});

  String buttonText;
  VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(buttonText,
        style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: TextConstants.fontSizeH3+2
        ),

      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(196, 50), backgroundColor: Color(0xFF577213), // Set width and height
        padding: EdgeInsets.symmetric(horizontal: 27, vertical: 11), // Set padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0), // Set border radius
        ),
        shadowColor: Color(0xFF3B71CA), // Set shadow color
        elevation: 4, // Set button color
      ),
    );
  }
}
