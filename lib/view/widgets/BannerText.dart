import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/TextConstants.dart';

class BannerText extends StatelessWidget {
  BannerText({super.key, required this.text, this.textAlign});

  TextAlign? textAlign;
  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.roboto(
        fontSize: TextConstants.fontSizeH3,
        color: Color(0xff565D6B),

      ),
    );
  }
}
