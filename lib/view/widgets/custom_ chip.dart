import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/ColorConstants.dart';
import '../../utils/SizeConstants.dart';
import '../../utils/TextConstants.dart';

class CustomChip extends StatelessWidget {
  CustomChip({super.key,
    this.isSelected = false,
    required this.title,
    this.onTap
  });

  bool isSelected;
  String title;
  GestureTapCallback? onTap;



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: SizeConstants.defaultPadding/2),
        margin: EdgeInsets.only(left: SizeConstants.defaultPadding),
        decoration: BoxDecoration(
            color: isSelected ? ColorConstants.primaryColor : Colors.grey[100],
            borderRadius: BorderRadius.circular(8.0)
        ),
        child: Center(
            child: Text(
              title,
              style: GoogleFonts.roboto(
                  fontSize: TextConstants.fontSizeH4+1,
                  color: isSelected ? Colors.white : Colors.grey[500]
              ),
            )
        ),
      ),
    );
  }
}
