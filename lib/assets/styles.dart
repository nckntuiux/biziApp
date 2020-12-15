import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Map<int, Color> whiteRGB0 =
{
  50:Color.fromRGBO(0,0,0,.1),
  100:Color.fromRGBO(255,255,255, .2),
  200:Color.fromRGBO(255,255,255, .3),
  300:Color.fromRGBO(255,255,255, .4),
  400:Color.fromRGBO(255,255,255, .5),
  500:Color.fromRGBO(255,255,255, .6),
  600:Color.fromRGBO(255,255,255, .7),
  700:Color.fromRGBO(255,255,255, .8),
  800:Color.fromRGBO(255,255,255, .9),
  900:Color.fromRGBO(255,255,255, 1),
};

Map<int, Color> brandRGB0 =
{
  50:Color.fromRGBO(255,177,3, .1),
  100:Color.fromRGBO(255,177,3, .2),
  200:Color.fromRGBO(255,177,3, .3),
  300:Color.fromRGBO(255,177,3, .4),
  400:Color.fromRGBO(255,177,3, .5),
  500:Color.fromRGBO(255,177,3, .6),
  600:Color.fromRGBO(255,177,3, .7),
  700:Color.fromRGBO(255,177,3, .8),
  800:Color.fromRGBO(255,177,3, .9),
  900:Color.fromRGBO(255,177,3, 1),
};

MaterialColor colorBrand = MaterialColor(0xFFB103FF, brandRGB0);
MaterialColor colorWhite = MaterialColor(0xFFFFFFFF, whiteRGB0);

SystemUiOverlayStyle mySystemTheme= SystemUiOverlayStyle.dark.copyWith(systemNavigationBarColor: Colors.white);

ThemeData ltxTheme = ThemeData(
  fontFamily: 'Inter',
  accentColor: Colors.black,
  primarySwatch: colorWhite,
  hintColor: Colors.black,
  scaffoldBackgroundColor: colorWhite,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: sAppBar,
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.all(18.0),
    fillColor: Colors.grey[200],
    filled: true,
    focusColor: colorWhite,
    alignLabelWithHint: false,
    enabledBorder: new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(12.0),
      borderSide: new BorderSide(color: colorWhite, width: 0.0),
    ),
    labelStyle: TextStyle(
        color: Colors.black,
        //fontSize: 24.0
    ),

  ),
);

AppBarTheme sAppBar = AppBarTheme(
  centerTitle: true,
  elevation: 0,
  brightness: Brightness.light,
  color: colorWhite,
);

TextStyle sAppBarText = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w900,
);

TextStyle sActionButton = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w600,
);

TextStyle sButton = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w600,
);

TextStyle sHeading = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w400,
  fontSize: 18,
);

TextStyle sHeadingCompact = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w400,
  fontSize: 14,
);

TextStyle sAlt = TextStyle(
  color: Colors.grey[850],
  fontWeight: FontWeight.w400,
  fontSize: 14,
);

TextStyle sHeadingFinish = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w300,
  fontSize: 32,
);

TextStyle sAltFinish = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w400,
  fontSize: 18,
);