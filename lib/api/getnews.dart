import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shortube/util/variables.dart';

class getnews{
  Future<List<Article>> all_news(Data data) async {

    List<Article> articles = [];
    String country = data.Country.substring(0,2).toLowerCase();
    var response = await http.get("https://newsapi.org/v2/top-headlines?country=$country&language=en&pageSize=100&category=${data.Category.toLowerCase()}&apiKey=${data.Key}",
      headers: {'key': '${data.Key}'},
    );

    Map<String, dynamic> res = jsonDecode(response.body);
    Map<String, dynamic> i;
    for(i in res['articles']){
      Article article = Article(
        title: i['title'],
        description: i['description'],
        urlToImage: i['urlToImage'],
        articleUrl: i["url"],
      );
      articles.add(article);
    }
  return articles;
  }

  Future<List<Article>> querry_news(String q,Data data) async {
    List<Article> articles = [];
    var response = await http.get("https://newsapi.org/v2/everything?q=$q&language=en&sortBy=${data.sortby}&apiKey=${data.Key}",
      headers: {'key': '${data.Key}'},
    );

    Map<String, dynamic> res = jsonDecode(response.body);
    Map<String, dynamic> i;
    for(i in res['articles']){
      Article article = Article(
        title: i['title'],
        description: i['description'],
        urlToImage: i['urlToImage'],
        articleUrl: i["url"],
      );
      articles.add(article);
    }
    return articles;
  }

  Future<List<Article>> channel_news(String q,Data data) async {


    List<Article> articles = [];
    var response = await http.get("https://newsapi.org/v2/everything?domains=${data.channel}&language=en&apiKey=${data.Key}",
      headers: {'key': '${data.Key}',},
    );

    Map<String, dynamic> res = jsonDecode(response.body);
    Map<String, dynamic> i;
    for(i in res['articles']){
      Article article = Article(
        title: i['title'],
        description: i['description'],
        urlToImage: i['urlToImage'],
        articleUrl: i["url"],
      );
      articles.add(article);
    }
    return articles;
  }

}