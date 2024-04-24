import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/ColorConstants.dart';
import '../../utils/TextConstants.dart';

class MorePagesScaffold extends StatelessWidget {
  MorePagesScaffold({required this.widgets, required this.title});

  List<Widget> widgets;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: null,
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: 55.0,
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 20.0),
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Color(0xff5A6147),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      title,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          color: ColorConstants.seedColorText,
                          fontSize: TextConstants.fontSizeH2),
                    ),
                    Expanded(child: Container())
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: widgets,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
