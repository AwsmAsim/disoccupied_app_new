import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/ColorConstants.dart';
import '../../utils/SizeConstants.dart';
import '../../utils/TextConstants.dart';

class CustomGridViewCard extends StatelessWidget {
  String imageURL;
  int noOfStars;
  String rank;
  String brand;

  CustomGridViewCard(
      {required this.imageURL,
      this.noOfStars = 0,
      required this.rank,
      required this.brand});

  @override
  Widget build(BuildContext context) {
    print(imageURL);
    print(noOfStars);
    print(rank);
    return Container(
          height: MediaQuery.of(context).size.height / 6,
          child: Column(
    children: [
      Expanded(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
              ),
            image: DecorationImage(
              image: NetworkImage(imageURL)
            )
          ),
        ),
      ),
      rankLabel()
    ],
          ),
        );
  }

  Widget rankLabel() {
    Widget toReturn = Container();
    switch (rank) {
      case "CAUTION":
        toReturn = cautionLabel();
        break;
      case "DO NOT BUY":
        toReturn = doNotBuyLabel();
        break;
      default:
        toReturn = okayToBuyLabel(noOfStars);
    }
    return toReturn;
  }

  Widget okayToBuyLabel(int stars) {
    return Container(
      height: 40.0,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 9.0,
              color: Colors.black.withOpacity(0.25))
        ],
        color: Color(0xff7E9B3A),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Okay to buy'.toUpperCase(),
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: TextConstants.fontSizeH4,
                  fontWeight: FontWeight.w500)),
          SizedBox(
            width: SizeConstants.defaultPadding / 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int count = 0; count < stars; count++) ...[
                const Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 15.0,
                ),
                SizedBox(
                  width: SizeConstants.defaultPadding / 3,
                )
              ]
            ],
          ),
        ],
      ),
    );
  }

  Widget doNotBuyLabel() {
    return Container(
      height: 40.0,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 9.0,
              color: Colors.black.withOpacity(0.25))
        ],
        color: ColorConstants.doNotBuyDark,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.close,
            color: Colors.white,
          ),
          SizedBox(
            width: SizeConstants.defaultPadding / 3,
          ),
          Text('do not buy'.toUpperCase(),
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: TextConstants.fontSizeH4,
                  fontWeight: FontWeight.w500))
        ],
      ),
    );
  }

  Widget cautionLabel() {
    return Container(
      height: 40.0,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 9.0,
              color: Colors.black.withOpacity(0.25))
        ],
        color: Color(0xffE4A11B),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning,
            color: Colors.white,
          ),
          SizedBox(
            width: SizeConstants.defaultPadding / 3,
          ),
          Text('Caution'.toUpperCase(),
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: TextConstants.fontSizeH4,
                  fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}
