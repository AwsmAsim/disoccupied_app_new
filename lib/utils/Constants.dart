import 'package:flutter/cupertino.dart';

TextEditingController searchController = new TextEditingController();

const Map<String, List> RANKING = {
  "minorityOwner": [
    "OKAY TO BUY",
    4
  ],
  "do_not_buy": [
    "DO NOT BUY",
    0
  ],
  "neutralMultiNational": [
    "OKAY TO BUY",
    1
  ],
  "neutralSmallMediumBusiness": [
    "OKAY TO BUY",
    2
  ],
  "CAUTION": [
    "CAUTION",
    0
  ]
};