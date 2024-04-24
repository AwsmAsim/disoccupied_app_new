import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/ColorConstants.dart';
import '../../utils/Constants.dart';
import '../../utils/SizeConstants.dart';
import 'SearchBox.dart';

class FilterSearchBar extends StatelessWidget {
  const FilterSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConstants.defaultPadding,
          vertical: SizeConstants.defaultPadding
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: SizedBox(
        height: 50.0,
        child: Row(
          children: [
            Expanded(
              child: SearchBox(
                searchController: searchController,
                enabled: true,
              ),
            ),

            SizedBox(
              width: SizeConstants.defaultPadding-10,
            ),

            AspectRatio(
              aspectRatio: 1,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: ColorConstants.seedColorText,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0,5),
                        blurRadius: 15,
                        color: Colors.black.withOpacity(0.25),
                      )
                    ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/filter-icon.svg',
                      height: SizeConstants.iconSize,
                      width: SizeConstants.iconSize,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
