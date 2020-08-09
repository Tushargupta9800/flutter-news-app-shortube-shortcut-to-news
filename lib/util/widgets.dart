import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shortube/util/variables.dart';

Data urldata = Data();
DateTime backbuttonpressedTime;

Widget print_text(String txt) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    mainAxisSize: MainAxisSize.max,
    children: [
      Text(
        txt,
        style: TextStyle(
          fontSize: 15.0,
          fontFamily: "splash_font",
          fontStyle: FontStyle.italic,
        ),
      ),
    ],
  );
}

class NewsTile extends StatefulWidget {

  final String imgUrl, title, desc, posturl;

  NewsTile({this.imgUrl, this.desc, this.title, this.posturl});

  @override
  _NewsTileState createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          urldata.Searchurl = widget.posturl;
        });
        (widget.posturl != null)?Navigator.pushNamed(context, "/webpage"):null;
      },
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(height: 10.0,),
                  (widget.imgUrl != null)?ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Image.network(
                        widget.imgUrl,
                        height: MediaQuery.of(context).size.height*0.5,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )):ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Image.asset(
                        "asset/images/other_images/no_img.jpg",
                        height: MediaQuery.of(context).size.height*0.4,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                      )),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    (widget.title!=null)?widget.title:"No Title",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    (widget.desc != null)?widget.desc:"No Desc",
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  SizedBox(height: 7.0,),
                  Divider(height: 5.0, thickness: 3.0, color: Colors.grey[400],),
                  SizedBox(height: 7.0,),
                ],
              ),
            ),
          )),
    );
  }
}


final snackbar = SnackBar(
  content: Text("You are up-to-date"),
  duration: Duration(seconds: 2),
  action: SnackBarAction(
      label: "Ok",
      onPressed: () {
        SnackBar(content: Text(""),
          duration: Duration(microseconds: 1),);
      }
  ),
);

final snackbar2 = SnackBar(
  content: Text("Searching..."),
  duration: Duration(seconds: 1),
  action: SnackBarAction(
      label: "",
      onPressed: () {
        SnackBar(content: Text(""),
          duration: Duration(microseconds: 1),);
      }
  ),
);

Widget category_tile(String name){
  return Container(
    margin: EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
    height: 130.0,
    width: 160.0,
    child: Stack(
      alignment: Alignment.center,
      children: [
        ClipRect(
            child: Image.asset(
              "asset/images/category/${name.toLowerCase()}.jpg",
              fit: BoxFit.cover,
            ),
        ),
        Center(
          child: Container(
            height: 25.0,
            width: 110.0,
            child: Center(
              child: Text(name,style: TextStyle(
                color: Colors.white,
              ),),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
          ),
        )
      ],
    ),
  );
}

Widget Sortby_Tile(String name){
  return Container(
    margin: EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
    height: 70.0,
    width: 400.0,
    child: Center(child: Text(name,style: TextStyle(color: Colors.white,fontSize: 30.0),)),
    decoration: BoxDecoration(
      color: Colors.blue[700],
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    ),
  );
}

Widget notetile(String name){
  return Container(
    margin: EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
    height: 80.0,
    width: 400.0,
    padding: EdgeInsets.only(left: 10.0,right: 10.0),
    child: Center(child: Text(name,style: TextStyle(color: Colors.white,fontSize: 15.0),),),
    decoration: BoxDecoration(
      color: Colors.blue[300],
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    ),
  );
}

Widget Country_Tile(String name){
  return Container(
    margin: EdgeInsets.only(left: 10.0,right: 10.0,top: 15.0,bottom: 15.0),
    height: 45.0,
    width: 100.0,
    child: Center(child: Image.network("https://www.worldometers.info/img/flags/${name}-flag.gif")),
  );
}

Future<bool> onWillPop() async {
  DateTime currentTime = DateTime.now();
  bool backButton = backbuttonpressedTime == null ||
      currentTime.difference(backbuttonpressedTime) > Duration(seconds: 2);
  if (backButton) {
    backbuttonpressedTime = currentTime;
    Fluttertoast.showToast(
        msg: "Double Tap on Back button to exit app",
        backgroundColor: Colors.black,
        textColor: Colors.white);
    return false;
  }
  return true;
}

Widget Channel_Tile(String name){
  return Container(
    margin: EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
    height: 130.0,
    width: 160.0,
    child: Stack(
      alignment: Alignment.center,
      children: [
        ClipRect(
          child: Image.asset(
            "asset/images/newschannel/${name.split(".")[0]}.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );
}