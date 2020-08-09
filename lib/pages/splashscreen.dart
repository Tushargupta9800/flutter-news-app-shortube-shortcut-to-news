import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:shortube/util/variables.dart';
import 'package:shortube/util/widgets.dart';

Data data = Data();

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  String random_img;

  @override
  void initState() {
    data.get_the_key();
    Timer(Duration(seconds: 5), (){
      Navigator.of(context).pop(true);
      Navigator.pushNamed(context, "/home");
    });
    random_img = data.Splashscreen_img();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/2,
                width: MediaQuery.of(context).size.width - 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  child: Image.asset(random_img),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2 - 150,
                child: Center(
                  child: Image.asset("asset/images/logo/logo.png",height: 200.0,width: 180.0,),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Shortube:- Shortcut to NEWS",style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: "splash_font",
                    decoration: TextDecoration.underline,
                    decorationThickness: 2.0,
                  ),),
                ],
              ),
              Container(
                padding: EdgeInsets.only(right: 25.0),
                child: Column(
                  children: [
                    print_text("-Tushar Gupta"),
                    print_text("Version:- 1.0.0"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}