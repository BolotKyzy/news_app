import 'package:news_app/models/sourse.dart';

class Article {
  const Article(
      {required this.source,
      this.author,
      required this.title,
      this.description,
      this.url,
      this.urlToImage,
      required this.publishedAt,
      this.content});

  final Source? source;
  final String? author;
  final String title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        title: json["title"],
        description: json["description"],
        content: json["content"],
        source: Source.fromJson(json["source"]),
        author: json["author"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"]);
  }
}
