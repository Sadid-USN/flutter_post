// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';

// abstract class PersonLocaleDtataSource {
//   Future getPostsFromCache();

//   Future savePosts();
// }

// const CACHED_PERSONS_LIST = 'CACHED_POSTS';

// class PersonLocaleDtataSourceImpl implements PersonLocaleDtataSource {
//   final SharedPreferences sharedPreferences;
//   PersonLocaleDtataSourceImpl({required this.sharedPreferences});

//   @override
//   Future getPostsFromCache() {
//     final jsonPersonsList =
//         sharedPreferences.getStringList(CACHED_PERSONS_LIST);

//     if (jsonPersonsList!.isNotEmpty) {
//       return Future.value(jsonPersonsList
//           .map((posts) => json.decode(posts))
//           .toList());
//     } else {
//       throw Exception('Something went wrong');
//     }
//   }

//   @override
//   Future<List<String>> savePosts() {
//     final List<String> jsonPersonsList =
//         posts.map((post) => json.encode(post.toJson())).toList();

//     sharedPreferences.setStringList(CACHED_PERSONS_LIST, jsonPersonsList);
//     print("Лист закэширован: ${jsonPersonsList.length}");
//     return Future.value(jsonPersonsList);
//   }
// }
