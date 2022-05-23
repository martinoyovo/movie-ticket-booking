import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DottedContainer extends StatelessWidget {
  final Widget child;
  const DottedContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Colors.white.withOpacity(0.7),
      strokeWidth: 0.75,
      padding: const EdgeInsets.all(2),
      dashPattern: const [4, 3],
      child: child,
    );
  }
}
