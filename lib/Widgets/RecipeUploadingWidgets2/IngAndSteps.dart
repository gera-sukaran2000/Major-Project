import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class IngAndSteps extends StatefulWidget {
  @override
  _IngAndStepsState createState() => _IngAndStepsState();
}

var _noOfIngredients;
var _noOfSteps;
var _dishType;

class _IngAndStepsState extends State<IngAndSteps> {
  @override
  Widget build(BuildContext context) {
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

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        padding: EdgeInsets.all(5),
        child: DropdownButtonFormField(
            isDense: true,
            isExpanded: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                      color: HexColor(
                        '#2E3E5C',
                      ),
                      width: 0.75)),
            ),
            items: <String>[
              '1-5',
              '5-10',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                      style: TextStyle(color: HexColor('#2E3E5C'))));
            }).toList(),
            hint: Text(
              'Ingredients Used',
              style: TextStyle(
                  color: HexColor(
                    '#2E3E5C',
                  ),
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
            onChanged: (String value) {
              setState(() {
                _noOfIngredients = value;
              });
            }),
      ),
      SizedBox(
        height: getProportionateScreenHeight(50),
      ),
      Container(
        margin: EdgeInsets.only(left: 20),
        child: Text('Steps',
            style: TextStyle(
                color: HexColor('#2E3E5C'),
                fontSize: 18,
                fontWeight: FontWeight.w600)),
      ),
      SizedBox(height: 10),
      Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        padding: EdgeInsets.all(5),
        child: DropdownButtonFormField(
            isDense: true,
            isExpanded: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                      color: HexColor(
                        '#2E3E5C',
                      ),
                      width: 0.75)),
            ),
            items: <String>['1-5', '5-10', '10-15', '15-20']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                      style: TextStyle(color: HexColor('#2E3E5C'))));
            }).toList(),
            hint: Text(
              'Steps Involved',
              style: TextStyle(
                  color: HexColor(
                    '#2E3E5C',
                  ),
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
            onChanged: (String value) {
              setState(() {
                _noOfSteps = value;
              });
            }),
      ),
      SizedBox(
        height: getProportionateScreenHeight(50),
      ),
      Container(
        margin: EdgeInsets.only(left: 20),
        child: Text('Dish Type',
            style: TextStyle(
                color: HexColor('#2E3E5C'),
                fontSize: 18,
                fontWeight: FontWeight.w600)),
      ),
      SizedBox(height: 10),
      Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        padding: EdgeInsets.all(5),
        child: DropdownButtonFormField(
            isDense: true,
            isExpanded: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                      color: HexColor(
                        '#2E3E5C',
                      ),
                      width: 0.75)),
            ),
            items: <String>['Breakfast', 'Lunch', 'Snacks', 'Dinner']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                      style: TextStyle(color: HexColor('#2E3E5C'))));
            }).toList(),
            hint: Text(
              'Dish Type',
              style: TextStyle(
                  color: HexColor(
                    '#2E3E5C',
                  ),
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
            onChanged: (String value) {
              setState(() {
                _dishType = value;
              });
            }),
      ),
      SizedBox(
        height: getProportionateScreenHeight(120),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonTheme(
            minWidth: getProportionateScreenWidth(145),
            height: getProportionateScreenHeight(45),
            // ignore: deprecated_member_use
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22)),
              onPressed: () {},
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Text(
                'Back',
                style: TextStyle(fontSize: 17, color: HexColor('#2E3E5C')),
              ),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(15),
          ),
          ButtonTheme(
            minWidth: getProportionateScreenWidth(145),
            height: getProportionateScreenHeight(45),
            // ignore: deprecated_member_use
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22)),
              onPressed: () {},
              color: HexColor('#2E3E5C'),
              padding: EdgeInsets.all(10),
              child: Text(
                'Next',
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
            ),
          )
        ],
      )
    ]);
  }
}
