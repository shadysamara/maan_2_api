import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  String title;
  CategoryWidget(this.title);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Text(
        title.toString()[0].toUpperCase() + title.toString().substring(1),
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      decoration: BoxDecoration(
          color: Colors.blueAccent, borderRadius: BorderRadius.circular(15)),
    );
  }
}
