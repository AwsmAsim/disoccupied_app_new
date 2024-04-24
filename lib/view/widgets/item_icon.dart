import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemIcon extends StatelessWidget {

  final String imagePath;
  final String label;

  ItemIcon({required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
            imagePath,
            colorFilter: const ColorFilter.mode(
                Colors.white, BlendMode.srcIn)),
        SizedBox(height: 8.0,),
        Text(
          label,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
