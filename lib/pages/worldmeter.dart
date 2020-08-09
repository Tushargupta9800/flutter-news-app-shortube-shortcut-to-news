import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class worldometer extends StatefulWidget {
  @override
  _worldometerState createState() => _worldometerState();
}

class _worldometerState extends State<worldometer> {

  bool issearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Worldometer"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh,size: 30.0,),
            onPressed: () {
              Navigator.of(context).pop(true);
              Navigator.pushNamed(context, "/worldmeter");
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: "https://www.worldometers.info/",
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (val) {
              setState(() {
                issearching = true;
              });
            },
            onPageFinished: (val) {
              setState(() {
                issearching = false;
              });
            },
          ),
          (issearching)?Center(child: CircularProgressIndicator()):Container(),
        ],
      ),
    );
  }
}
