import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'assets/styles.dart';
import 'assets/strings.dart';

import 'view/home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
  runApp(LunatexApp());
  imageCache!.clear();
}

class LunatexApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Lunatex',
      debugShowCheckedModeBanner: false,
      theme: ltxTheme,
      home: MyHomePage(),
    );
  }
}