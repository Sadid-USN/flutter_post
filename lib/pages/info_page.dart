import 'package:flutter/material.dart';
import 'package:redit_flutter_news/widget/info_card.dart';

class InfoPage extends StatelessWidget {
  final String title;
  final String selftext;
  final int ups;
  final int index;
  const InfoPage({
    Key? key,
    required this.title,
    required this.selftext,
    required this.ups,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Post Details'),
          centerTitle: true,
        ),
        body: InfoCardWidget(
          title: title,
          selftext: selftext,
          ups: ups,
        ));
  }
}
