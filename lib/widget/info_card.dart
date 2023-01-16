import 'package:flutter/material.dart';

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
          width: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(1.0, 1.0),
              blurRadius: 3.0,
            ),
          ], color: Colors.white, borderRadius: BorderRadius.circular(0)),
          //  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
                const SizedBox(
                  height: 28,
                ),
                Text(
                  selftext,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 14),
                ),
                const SizedBox(
                  height: 28,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'UPS',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
                    ),
                    Text(
                      ups.toString(),
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 30),
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
