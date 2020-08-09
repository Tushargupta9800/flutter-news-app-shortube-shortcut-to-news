import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shortube/api/getnews.dart';
import 'package:shortube/util/loading.dart';
import 'package:shortube/util/variables.dart';
import 'package:shortube/util/widgets.dart';

getnews news = getnews();
Data home_data = Data();

class Home extends StatefulWidget {

  Data get_the_key;
  Home(this.get_the_key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> Drawer_key = new GlobalKey<ScaffoldState>();
  List<Article> news_list = [];
  List<Article> news_list_checker = [];

  Drawer get_nav_drawer(BuildContext context) {
    var headerChild = DrawerHeader(
      child: Text(
        "Settings",
        style: TextStyle(
          fontSize: 25.0,
          fontFamily: "splash_font",
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
        ),
      ),
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage("asset/images/logo/logo.png"))),
    );
    var aboutChild = AboutListTile(
      child: Text("About"),
      applicationName: "Shortube",
      applicationVersion: "v1.0.0",
      applicationIcon: Image.asset(
        "asset/images/logo/logo.png",
        height: 40.0,
        width: 40.0,
      ),
    );

    ListTile getNavItem(var icon, String s, String routeName) {
      return ListTile(
        leading: Icon(icon),
        title: Text(s),
        onTap: () {
          setState(() {
            Navigator.of(context).pop(true);
            Navigator.pushNamed(context, routeName);
          });
        },
      );
    }

    var myNavChildren = [
      headerChild,
      getNavItem(
          Icons.home,
          "Home:- ${(home_data.search_querry) ? "Querry:- ${home_data.querry}" : "Daily News"}",
          ""),
      getNavItem(
          Icons.flag,
          "Country:- ${(home_data.search_querry) ? "Querry Search" : home_data.Country}",
          "/Country"),
      getNavItem(
          Icons.category,
          "Category:- ${(home_data.search_querry) ? "Querry Search" : home_data.Category}",
          "/Category"),
      getNavItem(
          Icons.featured_play_list,
          "Channel:- ${(!home_data.sources_search) ? "All" : home_data.channel.split(".")[0]}",
          "/channels"),
      getNavItem((home_data.search_querry) ? Icons.sort : Icons.not_interested,
          "Sort by:- ${home_data.sortby}", "/Sortby"),
      getNavItem(Icons.assessment, "Worldometer", "/worldmeter"),
      getNavItem(Icons.error, "Facing Error?", "/error"),
      aboutChild
    ];

    ListView listView = ListView(children: myNavChildren);

    return Drawer(
      child: listView,
    );
  }

  getnewslist() async {
    news_list = [];
    await news
        .all_news(home_data)
        .then((value) => news_list = List.from(value));
    setState(() {
      home_data.loading = false;
    });
  }

  search_querry(String q) async {
    news_list = [];
    await news
        .querry_news(q, home_data)
        .then((value) => news_list = List.from(value));
    setState(() {
      home_data.loading = false;
    });
  }

  channel_news(String q) async {
    news_list = [];
    await news
        .channel_news(q, home_data)
        .then((value) => news_list = List.from(value));
    setState(() {
      home_data.loading = false;
    });
  }

  Future<bool> channel_news2(String q) async {
    news_list_checker = [];
    await news
        .channel_news(q, home_data)
        .then((value) => news_list_checker = List.from(value));
    if (news_list_checker[0].title == news_list[0].title) {
      return true;
    } else {
      search_querry(q);
      return false;
    }
  }

  Future<bool> search_querry2(String q) async {
    news_list_checker = [];
    await news
        .querry_news(q, home_data)
        .then((value) => news_list_checker = List.from(value));
    if (news_list_checker[0].title == news_list[0].title) {
      return true;
    } else {
      search_querry(q);
      return false;
    }
  }

  Future<bool> getnewslist2(context) async {
    news_list_checker = [];
    await news
        .all_news(home_data)
        .then((value) => news_list_checker = List.from(value));
    if (news_list_checker[0].title == news_list[0].title) {
      return true;
    } else {
      getnewslist();
      return false;
    }
  }

  @override
  void initState() {
    home_data.Key = widget.get_the_key.Key;
    (!home_data.sources_search)
        ? (!home_data.search_querry)
            ? getnewslist()
            : search_querry(home_data.querry)
        : channel_news(home_data.querry);
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: SafeArea(
        child: (home_data.loading)
            ? Container(
                color: Colors.blue[700],
                child: Stack(
                  children: [
                    Container(
                      height: 50,
                      width: 100,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/error");
                          },
                          child: Text("Facing Error?",style: TextStyle(fontSize: 10.0,color: Colors.white),),
                        ),
                      ),
                    ),
                    loading6(
                        pos: Offset(MediaQuery.of(context).size.width * 0.5,
                            MediaQuery.of(context).size.height * 0.5),
                        radius: 3.0,
                        color: Colors.white,
                        jump: 80.0,
                        StrokeWidth: 6.0),
                  ],
                ),
              )
            : GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                child: Scaffold(
                  key: Drawer_key,
                  resizeToAvoidBottomInset: false,
                  body: Container(
                    child: Column(
                      children: [
                        Flexible(
                          flex: 20,
                          fit: FlexFit.tight,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      child: Icon(
                                        Icons.list,
                                        size: 45,
                                        color: Colors.white,
                                      ),
                                      onTap: () =>
                                          Drawer_key.currentState.openDrawer(),
                                    ),
                                    Text(
                                      "Shortube",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25.0,
                                        fontFamily: "heading",
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        await Drawer_key.currentState
                                            .showSnackBar(snackbar2);
                                        (!home_data.sources_search)
                                            ? (!home_data.search_querry)
                                                ? getnewslist2(context)
                                                    .then((value) {
                                                    if (value) {
                                                      Drawer_key.currentState
                                                          .showSnackBar(
                                                              snackbar);
                                                    }
                                                  })
                                                : search_querry2(
                                                        home_data.querry)
                                                    .then((value) {
                                                    if (value) {
                                                      Drawer_key.currentState
                                                          .showSnackBar(
                                                              snackbar);
                                                    }
                                                  })
                                            : channel_news2(home_data.querry)
                                                .then((value) {
                                                if (value) {
                                                  Drawer_key.currentState
                                                      .showSnackBar(snackbar);
                                                }
                                              });
                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.refresh,
                                        color: Colors.white,
                                        size: 30.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0),
                                      color: Colors.white,
                                      height: 45.0,
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            child: Icon(Icons.search),
                                            onTap: () {
                                              home_data.sources_search = false;
                                              home_data.loading = true;
                                              (home_data.search_querry)
                                                  ? search_querry2(
                                                      home_data.querry)
                                                  : getnewslist();
                                              FocusScope.of(context)
                                                  .requestFocus(
                                                      new FocusNode());
                                            },
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(left: 10.0),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                100,
                                            child: TextField(
                                              maxLines: 1,
                                              onChanged: (val) {
                                                setState(() {
                                                  home_data.search_querry =
                                                      true;
                                                  home_data.querry = val;
                                                });
                                              },
                                              enableSuggestions: true,
                                              readOnly: false,
                                              onEditingComplete: () {
                                                home_data.sources_search = false;
                                                home_data.loading = true;
                                                FocusScope.of(context)
                                                    .requestFocus(
                                                        new FocusNode());
                                                home_data.search_querry = true;
                                                search_querry(home_data.querry);
                                              },
                                              decoration: InputDecoration(
                                                hintText: home_data.querry,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            color: Colors.blue[700],
                          ),
                        ),
                        Flexible(
                          flex: 90,
                          fit: FlexFit.tight,
                          child: Container(
                            child: (news_list.length > 0)
                                ? ListView.builder(
                                    itemCount: news_list.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return NewsTile(
                                        imgUrl: news_list[index].urlToImage,
                                        title: news_list[index].title,
                                        desc: news_list[index].description,
                                        posturl: news_list[index].articleUrl,
                                      );
                                    })
                                : Center(
                                    child: Image.asset(
                                        "asset/images/other_images/nothing_found.jpg"),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  drawer: get_nav_drawer(context),
                ),
              ),
      ),
    );
  }
}