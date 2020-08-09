import 'package:flutter/material.dart';
import 'package:shortube/api/errorpage.dart';
import 'package:shortube/pages/categorypage.dart';
import 'package:shortube/pages/channelpage.dart';
import 'package:shortube/pages/countrypage.dart';
import 'package:shortube/pages/home.dart';
import 'package:shortube/pages/sortbypage.dart';
import 'package:shortube/pages/splashscreen.dart';
import 'package:shortube/pages/webpage.dart';
import 'package:shortube/pages/worldmeter.dart';
import 'package:shortube/util/widgets.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: splash(),
    routes: routes,
  ));
}

var routes = <String,WidgetBuilder>{
  "/splash": (BuildContext context) => splash(),
  "/home": (BuildContext context) => Home(data),
  "/Country": (BuildContext context) => CountryPage(home_data),
  "/Category": (BuildContext context) => CategoryPage(home_data),
  "/Sortby": (BuildContext context) => SortByPage(home_data),
  "/webpage": (BuildContext context) => WebPage(urldata),
  "/worldmeter": (BuildContext context) => worldometer(),
  "/channels": (BuildContext context) => ChannelPage(home_data),
  "/error": (BuildContext context) => ErrorPage(home_data),
};

class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return Splashscreen();
  }
}