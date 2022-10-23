import 'package:news_app/models/article.dart';

class TopNews {
  const TopNews(
      {required this.status,
      required this.totalResults,
      required this.article});

  final String status;
  final int totalResults;
  final List<Article> article;
}
