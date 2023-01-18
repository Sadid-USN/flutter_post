import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redit_flutter_news/api/news_provider.dart';
import 'package:redit_flutter_news/constant/app_colors.dart';
import 'package:redit_flutter_news/constant/links.dart';
import 'package:redit_flutter_news/pages/info_page.dart';
import 'package:redit_flutter_news/style/text_style.dart';
import 'package:redit_flutter_news/widget/card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    context.watch<NewsProvider>().flutterNews();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          title: const Text('Flutter Posts'),
          centerTitle: true,
        ),
        body: Consumer<NewsProvider>(builder: (context, provider, child) {
          var news = provider.news;
          if (news.isEmpty) {
            return const Center(
              child: DynamicText(
                title: 'No news yet',
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              await Provider.of<NewsProvider>(context, listen: false)
                  .refreshData();
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
                              );
                            }));
                          },
                          child: CardWidget(
                            title: provider.news[index]['title'],
                            thumbnail: provider.news[index]['thumbnail'] ==
                                        "self" ||
                                    provider.news[index]['thumbnail'] == null
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
