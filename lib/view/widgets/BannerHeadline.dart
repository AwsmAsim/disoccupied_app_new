import 'package:flutter/material.dart';

class BannerHeadline extends StatelessWidget {
  BannerHeadline({super.key, this.textAlign = TextAlign.start, required this.text});

  TextAlign? textAlign;
  String text;

  

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: Theme.of(context).textTheme.headlineLarge,
      textAlign: textAlign,
    );
  }
}
