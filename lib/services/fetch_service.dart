import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/constants/api_constants.dart';
import 'package:news_app/models/top_news.dart';

class TopNewsRepo {
  final http.Client client = http.Client();

  Future<TopNews?> fetchTopNews() async {
    final Uri uri = Uri.parse(ApiConst.topNews);
    final http.Response response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      final topNews = TopNews.fromJson(data);
      return topNews;
    }
  }
}
