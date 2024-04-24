import 'package:disoccupied_app/utils/SizeConstants.dart';
import 'package:disoccupied_app/utils/TextConstants.dart';
import 'package:disoccupied_app/view/widgets/more_pages_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MorePagesScaffold(
        widgets: [
          Container(
            width: double.infinity,
            child: AspectRatio(
              aspectRatio: 390 / 196,
              child: Stack(
                children: [
                  Positioned(
                    top: -180,
                    right: 0,
                    child: Container(
                      height: 600.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/about_us_photo.jpeg'),
                              fit: BoxFit.fitWidth)),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: AspectRatio(
                        aspectRatio: 390 / 196,
                        child: Container(
                          color: Color(0xff394D00).withOpacity(0.25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConstants.defaultPadding * 2.5,
                vertical: SizeConstants.defaultPadding / 2),
            child: Text(
              'To truly make change we need to get local in our efforts and strengthen alternative businesses in every part of the world.',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w900,
                  fontSize: TextConstants.fontSizeH4,
                  color: Color(0xff757575),
                  fontStyle: FontStyle.italic,
                  height: 1.8),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: SizeConstants.defaultPadding),
            child: Text(
              TextConstants.aboutUsText,
              style: GoogleFonts.roboto(
                  fontSize: TextConstants.fontSizeH3,
                  color: Color(0xff4F4F4F),
                  height: 1.5
              ),
            ),
          ),
        ],
        title: 'About Us'
    );
  }
}

