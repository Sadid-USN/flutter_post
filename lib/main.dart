import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redit_flutter_news/api/news_provider.dart';
import 'package:redit_flutter_news/constant/app_colors.dart';
import 'package:redit_flutter_news/pages/home_page.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          backgroundColor: AppColors.whiteColor,
          primarySwatch: AppColors().color),
      home: ChangeNotifierProvider(
        create: (_) => NewsProvider(),
        child: const HomePage(),
      ),
    );
  }
}
