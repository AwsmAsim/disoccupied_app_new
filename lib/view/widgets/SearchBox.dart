import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class SearchBox extends StatelessWidget {
  SearchBox({super.key, required this.searchController,
    this.enabled = true
  });

  TextEditingController searchController = new TextEditingController();
  bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
          border: Border.all(color: Colors.black, width: 0.5)
      ),

      child: Row(

        children: [

          AspectRatio(aspectRatio: 1,
            child: Icon(Icons.search,
              color: Colors.black,
              size: 25.0,
            ),
          ),
          Expanded(
            child: TextField(
              enabled: enabled,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0.0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
          ),
          AspectRatio(aspectRatio: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/svg/qr_scan_icon.svg',
                  height: 25.0,
                  width: 25.0,
                ),
              ],
            ),

          )
        ],
      ),

    );
  }
}
