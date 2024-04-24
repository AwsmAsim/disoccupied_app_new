import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/SizeConstants.dart';
import '../../utils/TextConstants.dart';

class FormTextField extends StatelessWidget {
  String hintText;
  TextEditingController controller;
  ValueChanged<String>? onChanged;
  bool isMultiline;

  FormTextField(
      {required this.hintText,
      required this.controller,
      this.onChanged,
      this.isMultiline = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: const Color(0xffBDBDBD),
        ),
      ),
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: SizeConstants.defaultPadding / 2),
      height: isMultiline ? 150 : 50,
      child: Center(
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          maxLines: isMultiline ? 10 : 1,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.roboto(fontSize: TextConstants.fontSizeH3),
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
