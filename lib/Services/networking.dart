import 'dart:convert';
import 'package:http/http.dart';

class Networking {
  Future getTopNews() async {
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=top&apiKey=94550e22a17b40adbb1515639694a64e');

    Response response = await get(url);
    var topNews = jsonDecode(response.body);

    return topNews;
  }

  Future getBusinessNews() async {
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=94550e22a17b40adbb1515639694a64e');

    Response response = await get(url);
    var businessNews = jsonDecode(response.body);

    return businessNews;
  }

  Future getEntertainmentNews() async {
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=entertainment&apiKey=94550e22a17b40adbb1515639694a64e');

    Response response = await get(url);
    var entertainmentNews = jsonDecode(response.body);

    return entertainmentNews;
  }

  Future getHealthNews() async {
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=94550e22a17b40adbb1515639694a64e');

    Response response = await get(url);
    var healthData = jsonDecode(response.body);

    return healthData;
  }

  Future getSportNews() async {
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=sport&apiKey=94550e22a17b40adbb1515639694a64e');

    Response response = await get(url);
    var sportData = jsonDecode(response.body);

    return sportData;
  }

  Future getNews() async {
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=General&apiKey=94550e22a17b40adbb1515639694a64e');

    Response response = await get(url);
    var newsData = jsonDecode(response.body);

    return newsData;
  }
}
