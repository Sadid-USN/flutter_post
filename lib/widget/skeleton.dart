import 'package:flutter/material.dart';

class Skelton extends StatelessWidget {
  final double? height;
  final double? width;
  const Skelton({
    this.height,
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.only(left: 16, top: 16, right: 10),
      decoration: BoxDecoration(
        // boxShadow: const [
        //   BoxShadow(
        //     color: Colors.black26,
        //     offset: Offset(4.0, 4.0),
        //     blurRadius: 6.0,
        //   ),
        // ],
        borderRadius: BorderRadius.circular(22.0),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFD8E3E7),
            Color(0xFFC8D5DA),
            Color(0xFFD8E3E7),
          ],
          stops: [
            0.3,
            0.6,
            0.9,
          ],
        ),
        color: Colors.grey[300],
      ),
    );
  }
}
