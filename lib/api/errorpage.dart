import 'package:flutter/material.dart';
import 'package:shortube/util/variables.dart';
import 'package:url_launcher/url_launcher.dart';

class ErrorPage extends StatefulWidget {

  Data key_check;
  ErrorPage(this.key_check);

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {

  String api = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Facing Error??"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("\n1.Make Sure You have a Proper Internet Connection\n",style: TextStyle(fontSize: 20.0),),
              Text("2.If Still You are unable to get the NEWS then may be your API key gets Expired\n\n",style: TextStyle(fontSize: 20.0),),
              Text("How To get API Key??",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w700),),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("\n1.Sign in to",style: TextStyle(fontSize: 20.0),),
                  GestureDetector(
                    onTap: () => launch("https://newsapi.org/"),
                    child: Text(" newsapi.org",style: TextStyle(fontSize: 20.0,color: Colors.blue[700]),),
                  ),
                ],
              ),
              Text("2.Get your own API Key",style: TextStyle(fontSize: 20.0),),
              Text("3.Paste your key in the below space",style: TextStyle(fontSize: 20.0),),
              Text("4.And you are good to go\n\n",style: TextStyle(fontSize: 20.0),),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Enter your key here\n"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 5.0),
                        color: Colors.blue,
                        height: 40.0,
                        width: MediaQuery.of(context).size.width - 100,
                        child: Center(
                          child: TextField(
                            cursorColor: Colors.white,
                            onChanged: (val){
                              api = val;
                            },
                            onEditingComplete: () async {
                              await widget.key_check.writekey(api);
                              Navigator.of(context).pop(true);
                              Navigator.of(context).pop(true);
                              Navigator.pushNamed(context, "/splash");
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await widget.key_check.writekey(api);
                      Navigator.of(context).pop(true);
                      Navigator.of(context).pop(true);
                      Navigator.pushNamed(context, "/splash");
                    },
                    child: Container(
                      height: 40.0,
                      width: 150.0,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Done  ",style: TextStyle(color: Colors.white,fontSize: 25.0,fontStyle: FontStyle.italic),),
                            Icon(Icons.done,color: Colors.white,),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue[500],
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
