import 'dart:math';

import 'package:shortube/api/getapi.dart';

class Data{
  API code = API();
  String Key = "";
  String Country = "in";
  String sortby = "PublishedAt";
  String lang = "en";
  String Category = "General";
  String Searchurl = "";
  bool loading = true;
  bool search_querry = false;
  String querry = "Search for News";
  String channel = "All";
  bool sources_search = false;

  Future writekey(String api) async {
    code.writefile(api);
  }

  Future<String> apiKey() async {
    if(Key == ""){
      get_the_key().then((value) => Key = Key);
    }
    return Key;
  }

  Future get_the_key() async {
    await code.readfile().then((value) => Key = value);
    if(Key == ""){
      print("Nothing Stored");
    }
    print(Key);
  }

  Splashscreen_img(){
    var rnd = Random();
    return "asset/images/splashscreen/splashscreen${rnd.nextInt(10)+1}.jpg";
  }
}

class Article{
  String title;
  String description;
  String urlToImage;
  String articleUrl;
  Article({this.title,this.description, this.urlToImage, this.articleUrl});
}