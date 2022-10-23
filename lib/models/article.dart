import 'package:news_app/models/sourse.dart';

class Article {
  const Article(
      {this.sourse,
      this.author,
      required this.title,
      required this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      required this.content});

  final Sourse? sourse;
  final String? author;
  final String title;
  final String description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String content;
}
