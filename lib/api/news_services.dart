import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsServices {
  Future getFlutterNews() async {
    const url = 'https://www.reddit.com/r/flutterdev/new.json';

    final uri = Uri.parse(url);

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(
          response.body,
        );

        return (data['data']['children'] as List)
            .map((data) => data['data'])
            .toList();
      } else {
        throw Exception("Failed to get news");
      }
    } catch (e) {
      print(e);
    }
    return [];
  }
}
