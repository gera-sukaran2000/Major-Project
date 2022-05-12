// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tastewing/Utils.dart/Utils.dart';

class RecipeDescription extends StatefulWidget {
  @override
  _RecipeDescriptionState createState() => _RecipeDescriptionState();
}

class _RecipeDescriptionState extends State<RecipeDescription> {
  double getProportionateScreenHeight(double inputHeight) {
    double screenHeight = MediaQuery.of(context).size.height;
    // 812 is the layout height that designer use
    return (inputHeight / 812.0) * screenHeight;
  }

// Get the proportionate height as per screen size
  double getProportionateScreenWidth(double inputWidth) {
    double screenWidth = MediaQuery.of(context).size.width;
    // 375 is the layout width that designer use
    return (inputWidth / 375.0) * screenWidth;
  }

  @override
  int indexTop = 0;
  final List<String> labels = ['<10', '35', '>60'];
  final double min = 0.0;
  final double max = 2.0;
  final divisions = 2;

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 25),
            child: Text('Recipe Name',
                style: TextStyle(
                    color: HexColor('#2E3E5C'),
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
          ),
          SizedBox(height: 2),
          Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              padding: EdgeInsets.all(8),
              child: ClipRRect(
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 18),
                      hintText: 'Name of your recipe',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                              color: HexColor('#9FA5C0'), width: 0.75))),
                ),
              )),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(left: 25),
            child: Text('Description',
                style: TextStyle(
                    color: HexColor('#2E3E5C'),
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              padding: EdgeInsets.all(8),
              child: ClipRRect(
                child: TextField(
                  textInputAction: TextInputAction.done,
                  maxLines: 4,
                  minLines: null,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 18, top: 15),
                      hintText: 'Tell us a little about your recipe',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(
                              color: HexColor('#9FA5C0'), width: 3))),
                ),
              )),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(left: 25),
            child: Text('Cooking Duration (in minutes)',
                style: TextStyle(
                    color: HexColor('#2E3E5C'),
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height: 14,
          ),
          Column(children: [
            Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: Utils.modelBuilder(labels, (index, label) {
                      final selectedColor = Colors.black;
                      final unselectedColor = Colors.black.withOpacity(0.3);
                      final isSelected = index <= indexTop;
                      final color =
                          isSelected ? selectedColor : unselectedColor;

                      return buildLabel(label: label, color: color, width: 30);
                    }))),
            SizedBox(
              height: 2,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Slider(
                inactiveColor: Colors.grey,
                activeColor: HexColor('#2E3E5C'),
                min: min,
                max: max,
                divisions: divisions,
                value: indexTop.toDouble(),
                onChanged: (value) {
                  setState(() {
                    indexTop = value.toInt();
                  });
                },
              ),
            ),
          ]),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: ButtonTheme(
              minWidth: getProportionateScreenWidth(275),
              height: getProportionateScreenHeight(50),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22)),
                onPressed: () {
                  Navigator.of(context).pushNamed('upload2');
                },
                color: HexColor('#2E3E5C'),
                padding: EdgeInsets.all(10),
                child: Text(
                  'NEXT',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildLabel({
  @required String label,
  @required double width,
  @required Color color,
}) =>
    Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      width: width,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ).copyWith(color: color),
      ),
    );
