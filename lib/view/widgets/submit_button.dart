import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/ColorConstants.dart';
import '../../utils/SizeConstants.dart';
import '../../utils/TextConstants.dart';

class SubmitButton extends StatelessWidget {

  SubmitButton({required this.title, this.onTap});

  final String title;
  GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: ColorConstants.seedColorText,
            borderRadius: BorderRadius.circular(100.0)
        ),
        padding: EdgeInsets.symmetric(vertical: SizeConstants.defaultPadding),
        width: double.infinity,
        child: Center(
          child: Text(title,
            style: GoogleFonts.roboto(
                fontSize: TextConstants.fontSizeH3,
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
