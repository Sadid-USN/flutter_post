import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redit_flutter_news/api/news_provider.dart';
import 'package:redit_flutter_news/pages/info_page.dart';
import 'package:redit_flutter_news/widget/skeleton.dart';
import 'package:redit_flutter_news/widget/card_widget.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _refreshData() async {
    await Provider.of<NewsProvider>(context, listen: false).flutterNews();
    setState(() {});
  }

  String noImage =
      'https://st.depositphotos.com/2934765/53192/v/600/depositphotos_531920820-stock-illustration-photo-available-vector-icon-default.jpg';
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<NewsProvider>(
        context,
        listen: false,
      ).flutterNews();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Flutter Posts'),
          centerTitle: true,
        ),
        body: Consumer<NewsProvider>(builder: (context, provider, child) {
          var news = provider.news;
          if (news.isEmpty) {
            // Display a loading indicator
            return ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Shimmer.fromColors(
                      baseColor: Colors.grey.shade400,
                      highlightColor: Colors.grey.shade100,
                      child: const Skelton(
                        height: 150,
                      ));
                });
          }
          return RefreshIndicator(
            onRefresh: () async {
              await _refreshData();
            },
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.only(top: 10),
                      itemCount: provider.news.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return InfoPage(
                                ups: provider.news[index]['ups'],
                                selftext: provider.news[index]['selftext'],
                                title: provider.news[index]['title'],
                                index: index + 1,
                              );
                            }));
                          },
                          child: CardWidget(
                            title: provider.news[index]['title'],
                            thumbnail:
                                provider.news[index]['thumbnail'] == "self"
                                    ? noImage
                                    : provider.news[index]['thumbnail'],
                            index: index + 1,
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        }));
  }
}
