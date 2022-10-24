import 'package:news_app/models/article.dart';

class TopNews {
  const TopNews(
      {required this.status,
      required this.totalResults,
      required this.article});

  final String status;
  final int totalResults;
  final List<Article> article;
  factory TopNews.fromJson(Map<String, dynamic> json) {
    return (TopNews(
        status: json["status"],
        totalResults: json["totalResults"],
        // article: json["article"]));
        article: List<Article>.from(
            (json["articles"]).map((x) => Article.fromJson(x)))));
  }
}
