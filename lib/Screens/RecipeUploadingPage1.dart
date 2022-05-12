// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tastewing/Widgets/RecipeUploadingWidgets1/AddImage.dart';
import 'package:tastewing/Widgets/RecipeUploadingWidgets1/RecipeDescription.dart';

class Upload1 extends StatelessWidget {
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
          children: [
            SizedBox(
              height: getProportionateScreenHeight(40),
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text('2',
                    style: TextStyle(color: Colors.grey[600], fontSize: 17))
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(40),
            ),
            ImageBox(),
            SizedBox(
              height: getProportionateScreenHeight(40),
            ),
            RecipeDescription(),
          ],
        ),
      ),
    );
  }
}
