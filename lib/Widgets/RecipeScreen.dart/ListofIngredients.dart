import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Listingredients extends StatelessWidget {
  String value;

  Listingredients(this.value);

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

    return Container(
      child: Row(
        children: [
          SizedBox(
              height: getProportionateScreenHeight(35),
              width: getProportionateScreenWidth(35),
              child: AspectRatio(
                aspectRatio: 0.85,
                child:
                    Container(child: Image.asset('assets/images/circle.png')),
              )),
          SizedBox(
            width: getProportionateScreenWidth(15),
          ),
          Container(
            child: Text(
              value,
              style: TextStyle(
                  color: Colors.black, fontSize: 18, fontFamily: 'SansPro'),
            ),
          )
        ],
      ),
    );
  }
}
