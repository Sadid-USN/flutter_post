import 'package:flutter/material.dart';

class DynamicText extends StatelessWidget {
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  const DynamicText({
    Key? key,
    required this.title,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.start,
      style: TextStyle(fontWeight: fontWeight, fontSize: fontSize),
    );
  }
}
