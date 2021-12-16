import 'package:flutter/material.dart';
import 'package:mobilegarage_mechanics_app/Language/LanguageData.dart';

class ConstanceData {

  static final STATUS_BOOKED = "BOOKED";
  static final STATUS_ONWAY = "ONWAY";
  static final STATUS_ARRIVED = "ARRIVED";
  static final STATUS_REJECTED = "REJECTED";



  static final splashBackground = "assets/images/building_image.png";
  static final location = "assets/images/location.jpg";
  static final wallet = "assets/images/wallet.jpg";
  static final enableLocation = "assets/images/enableLocation.jpg";
  static final appicon = "assets/images/city_86340.png";
  static final userImage = "assets/images/user.jpg";


  static final Color secoundryFontColor = Colors.white;

  List<String> colors = [
    '#568dff',
    '#32a852',
    '#e6230e',
    '#760ee6',
    '#db0ee6',
    '#db164e'
  ];
}

// Locale locale;
String locale = "en";

int colorsIndex = 0;

AllTextData allTextData;

var primaryColorString = '#568dff';
var secondaryColorString = '#568dff';
