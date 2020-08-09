import 'package:flutter/material.dart';
import 'package:shortube/util/variables.dart';
import 'package:shortube/util/widgets.dart';

class ChannelPage extends StatefulWidget {
  Data channel_change;

  ChannelPage(this.channel_change);

  @override
  _ChannelPageState createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  
  Widget show_tile(String name){
    return GestureDetector(
      onTap: () {
        if(name == "all"){
          setState(() {widget.channel_change.sources_search = false;});
          Navigator.of(context).pop(true);
          Navigator.of(context).pop(true);
          Navigator.pushNamed(context, '/home');
        }else{
          setState(() {
            widget.channel_change.sources_search = true;
            widget.channel_change.channel = name;
            widget.channel_change.querry = "Search for NEWS";
          });
          Navigator.of(context).pop(true);
          Navigator.of(context).pop(true);
          Navigator.pushNamed(context, '/home');
        }
      },
      child: Channel_Tile(name),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Channel"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Wrap(
            children: [
              show_tile("all"),
              show_tile("bbc.com"),
              show_tile("cgtn.com"),
              show_tile("dnaindia.com"),
              show_tile("firstpost.com"),
              show_tile("foxnews.com"),
              show_tile("indiatvnews.com"),
              show_tile("indiatoday.in"),
              show_tile("news18.com"),
              show_tile("ndtv.com"),
              show_tile("newsonair.com"),
              show_tile("oneindia.com"),
              show_tile("republicworld.com"),
              show_tile("techcrunch.com"),
              show_tile("timesnownews.com"),
              show_tile("thewire.in"),
              show_tile("thehindu.com"),
              show_tile("thequint.com"),
              show_tile("wionews.com"),
              show_tile("9news.com.au"),
            ],
          ),
        ),
      ),
    );
  }
}