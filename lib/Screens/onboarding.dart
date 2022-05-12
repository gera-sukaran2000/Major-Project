import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class StartingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double getProportionateScreenHeight(double inputHeight) {
      double screenHeight = MediaQuery.of(context).size.height;
      return (inputHeight / 812.0) * screenHeight;
    }

    double getProportionateScreenWidth(double inputWidth) {
      double screenWidth = MediaQuery.of(context).size.width;
      return (inputWidth / 375.0) * screenWidth;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: getProportionateScreenHeight(505),
            width: double.infinity,
            child: AspectRatio(
              aspectRatio: 0.85,
              child: Container(
                child: Image.asset('assets/images/start.png'),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Start Cooking',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: HexColor('#2E3E5C')),
          ),
          SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Let's join our community\nto cook better food!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: HexColor('#9FA5C0'),
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(50),
          ),
          Align(
            alignment: Alignment.center,
            child: ButtonTheme(
              minWidth: getProportionateScreenWidth(275),
              height: getProportionateScreenHeight(45),
              // ignore: deprecated_member_use
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22)),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('loginScreen');
                },
                color: HexColor('#2B5292'),
                padding: EdgeInsets.all(10),
                child: Text(
                  'Get Started',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
