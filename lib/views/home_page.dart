import 'package:flutter/material.dart';
import 'package:news_app/constants/api_constants.dart';
import 'package:news_app/constants/text_constants.dart';
import 'package:news_app/models/top_news.dart';
import 'package:news_app/services/fetch_service.dart';
import 'package:news_app/theme/colors.dart';
import 'package:news_app/theme/text_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TopNews? topNews;
  Future<void> fetchData() async {
    topNews = await TopNewsRepo().fetchTopNews();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppText.topNewsAppBartitle),
          backgroundColor: AppColor.primary,
        ),
        body: topNews == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: topNews!.article.length,
                itemBuilder: (context, index) {
                  final news = topNews!.article[index];

                  return Card(
                      // child: ListTile(
                      //   leading:
                      //   title: Text(news.title),
                      // ),
                      child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Image.network(
                          news.urlToImage ?? ApiConst.defaultImageUrl,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              news.title,
                              style: AppTextStyle.newsTitleStyle,
                            ),
                          ))
                    ],
                  ));
                }));
  }
}
