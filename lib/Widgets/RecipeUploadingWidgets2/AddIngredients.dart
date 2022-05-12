import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AddIngredient extends StatefulWidget {
  @override
  _AddIngredientState createState() => _AddIngredientState();
}

final m1 = TextEditingController();

List<String> ings = [];

void addValue() {
  if (m1.text.isEmpty) {
    return;
  }

  ings.add(m1.text);
}

class _AddIngredientState extends State<AddIngredient> {
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

  List<String> values = [];

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        margin: EdgeInsets.only(left: 25),
        width: getProportionateScreenWidth(20),
        child: TextField(
          controller: m1,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                    color: HexColor('#9FA5C0'),
                  )),
              contentPadding: EdgeInsets.all(10),
              hintStyle: TextStyle(color: HexColor('#9FA5C0'), fontSize: 15),
              hintText: 'Enter Ingredient'),
        ),
      ),
    );
  }
}
