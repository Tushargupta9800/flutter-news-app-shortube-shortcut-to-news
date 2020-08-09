import 'package:flutter/material.dart';
import 'package:shortube/util/variables.dart';
import 'package:shortube/util/widgets.dart';

class SortByPage extends StatefulWidget {
  Data sortby_change;

  SortByPage(this.sortby_change);

  @override
  _SortByPageState createState() => _SortByPageState();
}

class _SortByPageState extends State<SortByPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sort By"),
      ),
      body: Container(
        color: Colors.white,
        child: Wrap(
          children: [
            (!widget.sortby_change.search_querry)?notetile(
                " These Sortings are only for Search Results. You can't use them for Category and Country"):Container(),
            GestureDetector(
              child: Sortby_Tile("PublishedAt"),
              onTap: () {
                setState(() {
                  widget.sortby_change.loading = true;
                  widget.sortby_change.sortby = "publishedAt";
                });
                Navigator.of(context).pop(true);
                Navigator.of(context).pop(true);
                Navigator.pushNamed(context, "/home");
              },
            ),
            GestureDetector(
              child: Sortby_Tile("Relevancy"),
              onTap: () {
                setState(() {
                  widget.sortby_change.loading = true;
                  widget.sortby_change.sortby = "relevancy";
                });
                Navigator.of(context).pop(true);
                Navigator.of(context).pop(true);
                Navigator.pushNamed(context, "/home");
              },
            ),
            GestureDetector(
              child: Sortby_Tile("Popularity"),
              onTap: () {
                setState(() {
                  widget.sortby_change.loading = true;
                  widget.sortby_change.sortby = "popularity";
                });
                Navigator.of(context).pop(true);
                Navigator.of(context).pop(true);
                Navigator.pushNamed(context, "/home");
              },
            ),
          ],
        ),
      ),
    );
  }
}
