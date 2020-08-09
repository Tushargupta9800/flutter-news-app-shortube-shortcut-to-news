import 'package:flutter/material.dart';
import 'package:shortube/util/variables.dart';
import 'package:shortube/util/widgets.dart';

class CategoryPage extends StatefulWidget {
  Data data_to_change;
  CategoryPage(this.data_to_change);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  set_state(String name){
    setState(() {widget.data_to_change.Category = name;});
    widget.data_to_change.loading = true;
    widget.data_to_change.search_querry = false;
    widget.data_to_change.sources_search = false;
    widget.data_to_change.querry = "Search for NEWS";
    Navigator.of(context).pop(true);
    Navigator.of(context).pop(true);
    Navigator.pushNamed(context, "/home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Category"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Wrap(
            children: [
              GestureDetector(child: category_tile("General"),onTap: () {
                set_state("General");},),
              GestureDetector(child: category_tile("Entertainment"),onTap: () {
                set_state("Entertainment");},),
              GestureDetector(child: category_tile("Business"),onTap: () {
                set_state("Business");},),
              GestureDetector(child: category_tile("Science"),onTap: () {
                set_state("Science");},),
              GestureDetector(child: category_tile("Health"),onTap: () {
                set_state("Health");},),
              GestureDetector(child: category_tile("Technology"),onTap: () {
                set_state("Technology");},),
              GestureDetector(child: category_tile("Sports"),onTap: () {
                set_state("Sports");},),
            ],
          ),
        ),
      ),
    );
  }
}
