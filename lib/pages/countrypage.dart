import 'package:flutter/material.dart';
import 'package:shortube/util/variables.dart';
import 'package:shortube/util/widgets.dart';

List<String> country_name = ["in", "us", "ae", "ar", "at", "au", "be", "bg", "br", "ca", "ch", "cn", "co", "cu", "eg", "fr", "gb", "gr", "hk", "hu",
  "id", "it", "kr", "lt", "ma", "mx", "my", "ng", "nl", "no", "nz", "pl", "ro", "rs", "sa", "se", "sg", "si", "sk", "th", "tw", "ve", "za"];

class CountryPage extends StatefulWidget {
  Data country_change;

  CountryPage(this.country_change);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Country"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Wrap(
            children: [
              for (String i in country_name)
                (GestureDetector(
                  onTap: (){
                    setState(() {
                      widget.country_change.Country = i;
                      widget.country_change.loading = true;
                      widget.country_change.search_querry = false;
                      widget.country_change.sources_search = false;
                      widget.country_change.querry = "Search for NEWS";
                      Navigator.of(context).pop(true);
                      Navigator.of(context).pop(true);
                      Navigator.pushNamed(context, "/home");
                    });
                  },
                  child: Country_Tile(i),
                ))
            ],
          ),
        ),
      ),
    );
  }
}