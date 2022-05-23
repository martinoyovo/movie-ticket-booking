import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String assetName;
  final Color? color;
  const SvgIcon({super.key, required this.assetName, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/$assetName.svg',
      color: color,
    );
  }
}
