import 'package:flutter/material.dart';

Color gradient1 = const Color(0xFF8573D2);
Color gradient2 = const Color(0xFF52448D);
Color background = const Color(0xFF1D192A);

class Styles {
  Styles._();

  static Color gradient1Color = gradient1;
  static Color gradient2Color = gradient2;
  static Color backgroundColor = background;
  static Color buttonColor = const Color(0xFF8371D0);
  static Color appBarColor = const Color(0xFF302B46);
  static Color highlightColor = const Color(0xFF6F5EB4);
  static Color yellowColor = const Color(0xFFFFDB65);

  static imagePath(name) => 'assets/images/$name';
}
