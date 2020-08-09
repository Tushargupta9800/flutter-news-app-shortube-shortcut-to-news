import 'package:flutter/material.dart';
import 'package:shortube/util/variables.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  Data data;

  WebPage(this.data);

  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {

  @override
  void initState() {
    print(widget.data.Searchurl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Full News"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh,size: 30.0,),
            onPressed: () {
              Navigator.of(context).pop(true);
              Navigator.pushNamed(context, "/webpage");
            },
          ),
        ],
      ),
      body: WebView(
        initialUrl: widget.data.Searchurl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
