import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/SizeConstants.dart';
import '../../utils/TextConstants.dart';

class HomePageNewsCard extends StatelessWidget {
  HomePageNewsCard({
    required this.headingText,
    this.subheadingText = "",
    required this.imageUrl,
    this.onTap
  });

  String headingText;
  String subheadingText;
  String imageUrl;
  GestureTapCallback? onTap;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: SizeConstants.defaultPadding),
        child: AspectRatio(
          aspectRatio: 241/134,
          child: Container(
            padding: EdgeInsets.all(SizeConstants.defaultPadding),
            height: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                    image: NetworkImage(
                        imageUrl
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken)
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(headingText,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontSize: TextConstants.fontSizeH3,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,

                ),
                Text(subheadingText,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: TextConstants.fontSizeH4
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
