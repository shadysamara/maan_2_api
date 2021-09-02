import 'package:flutter/material.dart';
import 'package:maan2_api/ui/home/providers/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class CategoryWidget extends StatelessWidget {
  String title;
  CategoryWidget(this.title);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        Provider.of<HomeProvider>(context, listen: false).selectCategory(title);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Text(
          title.toString()[0].toUpperCase() + title.toString().substring(1),
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        decoration: BoxDecoration(
            color: Provider.of<HomeProvider>(context).selectedCategory == title
                ? Colors.redAccent
                : Colors.blueAccent,
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
