// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tastewing/Widgets/RecipeUploadingWidgets2/AddIngredients.dart';

class Upload2 extends StatefulWidget {
  @override
  _Upload2State createState() => _Upload2State();
}

class _Upload2State extends State<Upload2> {
  var noofTextFields = 0;

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

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: FlatButton(
                      onPressed: () {},
                      child: Text('Cancel',
                          style: TextStyle(
                              color: HexColor('#FF6464'), fontSize: 17.5))),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(230),
                ),
                Text(
                  '1/',
                  style: TextStyle(fontSize: 17, color: Colors.grey[600]),
                ),
                Text('2',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(40),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text('Ingredients',
                  style: TextStyle(
                      color: HexColor('#2E3E5C'),
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(
              height: 10,
            ),
            (noofTextFields == 0)
                ? Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: getProportionateScreenHeight(200),
                      child: AspectRatio(
                        aspectRatio: 0.85,
                        child: Container(
                          child: Image.asset('assets/images/chef.jpg'),
                        ),
                      ),
                    ),
                  )
                : SizedBox(
                    height: getProportionateScreenHeight(200),
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 0.0),
                      itemBuilder: (ctx, index) {
                        return AddIngredient();
                      },
                      itemCount: noofTextFields,
                    ),
                  ),
            Container(
              child: Align(
                alignment: Alignment.center,
                child: ButtonTheme(
                  height: getProportionateScreenHeight(55),
                  minWidth: getProportionateScreenWidth(320),
                  child: RaisedButton(
                    onPressed: () {
                      noofTextFields = noofTextFields + 1;
                      setState(() {});
                    },
                    color: Colors.white,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Add Ingredient',
                      style: TextStyle(
                        color: HexColor('#2E3E5C'),
                        fontSize: 17,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                        side: BorderSide(
                            width: 0.75, color: HexColor('#D0DBEA'))),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
