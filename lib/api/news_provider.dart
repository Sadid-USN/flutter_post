import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:redit_flutter_news/api/news_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsProvider extends ChangeNotifier {
  final NewsServices _newsServices = NewsServices();
  bool isLoading = false;
  List _news = [];
  List get news => _news;

  final InternetConnectionChecker _internetChecker =
      InternetConnectionChecker();
  // ...

  Future<void> flutterNews() async {
    isLoading = true;
    final hasConnection = await _internetChecker.hasConnection;
    if (hasConnection) {
      final response = await _newsServices.getFlutterNews();
      _news = response;
      await saveNews();
    } else {
      await getSavedNews();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> saveNews() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('news', jsonEncode(_news));
  }

  Future<void> getSavedNews() async {
    final prefs = await SharedPreferences.getInstance();
    _news = jsonDecode(prefs.getString('news')!) ?? [];

    notifyListeners();
  }

  Future<void> refreshData() async {
    await flutterNews();

    notifyListeners();
  }
}
