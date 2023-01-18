import 'package:flutter/material.dart';
import 'package:redit_flutter_news/constant/app_colors.dart';
import 'package:redit_flutter_news/style/text_style.dart';

class InfoCardWidget extends StatelessWidget {
  final String title;
  final String selftext;
  final int ups;

  const InfoCardWidget({
    Key? key,
    required this.title,
    required this.selftext,
    required this.ups,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: AppColors.whiteColor,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DynamicText(
                  title: title,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 28,
                ),
                DynamicText(
                  title: title,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(
                  height: 28,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DynamicText(
                      title: 'UPS = $ups',
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
