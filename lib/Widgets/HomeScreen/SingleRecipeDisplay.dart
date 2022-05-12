// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tastewing/Providers/DataFetch.dart';
import 'package:tastewing/Widgets/RecipeScreen.dart/upperView.dart';

class RecipeDisplay extends StatefulWidget {
  RecipeData singleObject;

  RecipeDisplay({this.singleObject});

  @override
  _RecipeDisplayState createState() => _RecipeDisplayState();
}

class _RecipeDisplayState extends State<RecipeDisplay> {
  double getProportionateScreenHeight(double inputHeight) {
    double screenHeight = MediaQuery.of(context).size.height;
    return (inputHeight / 812.0) * screenHeight;
  }

  double getProportionateScreenWidth(double inputWidth) {
    double screenWidth = MediaQuery.of(context).size.width;
    return (inputWidth / 375.0) * screenWidth;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(25),
          ),
          Container(
            height: getProportionateScreenHeight(300),
            width: getProportionateScreenWidth(230),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
            ),
            child: FadeInImage(
              fit: BoxFit.cover,
              image: NetworkImage(widget.singleObject.imageUrl),
              placeholder: AssetImage('assets/images/backup.jpeg'),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext ctx) =>
                      UpperView(widget.singleObject)));
            },
            child: Container(
              child: Text(
                widget.singleObject.title,
                style: TextStyle(
                    color: Colors.black, fontSize: 28, fontFamily: 'SansPro'),
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(6)),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext ctx) =>
                      UpperView(widget.singleObject)));
            },
            child: Row(
              children: [
                Container(
                  child: Text('${widget.singleObject.noOfServings} servings',
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 18,
                          fontFamily: 'SansPro')),
                ),
                SizedBox(width: getProportionateScreenWidth(11)),
                Icon(Icons.circle, color: Colors.grey[700], size: 8),
                SizedBox(width: getProportionateScreenWidth(11)),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: Text(
                        '${widget.singleObject.cookTime.toString()} mins',
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 18,
                            fontFamily: 'SansPro')),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
