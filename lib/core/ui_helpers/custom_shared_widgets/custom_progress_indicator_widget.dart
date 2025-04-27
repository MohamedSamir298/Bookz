import 'package:flutter/material.dart';

class CustomProgressIndicatorWidget extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final double width;

  const CustomProgressIndicatorWidget({this.padding = EdgeInsets.zero, required this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: padding, child: SizedBox(width: width, child: LinearProgressIndicator()));
  }
}