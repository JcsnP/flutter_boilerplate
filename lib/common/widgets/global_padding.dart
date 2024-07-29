import 'package:flutter/material.dart';

class GlobalPadding extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const GlobalPadding({super.key, required this.child, required this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: padding, child: child);
  }
}
