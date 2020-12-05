import 'package:flutter/material.dart';

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

MaterialColor colorWhite = MaterialColor(0xFFFFFFFF, whiteRGB0);

ThemeData ltxTheme = ThemeData(
  fontFamily: 'Inter',
  primarySwatch: colorWhite,
  scaffoldBackgroundColor: colorWhite,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);