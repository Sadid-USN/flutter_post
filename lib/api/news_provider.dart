import 'package:flutter/material.dart';
import 'package:redit_flutter_news/api/news_services.dart';

class NewsProvider extends ChangeNotifier {
  final NewsServices _newsServices = NewsServices();
  bool isLoading = false;
  List _news = [];
  List get news => _news;

  Future<void> flutterNews() async {
    isLoading = true;

    final response = await _newsServices.getFlutterNews();

    _news = response;

    isLoading = false;
    notifyListeners();
  }
}
