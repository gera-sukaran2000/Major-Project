import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ImageBox extends StatelessWidget {
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

    return Align(
        alignment: Alignment.center,
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(12),
          padding: EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: Container(
              height: getProportionateScreenHeight(150),
              width: getProportionateScreenWidth(190),
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Icon(Icons.photo_outlined, color: Colors.grey, size: 55),
                  // IconButton(
                  //     onPressed: () {},
                  //     icon: Icon(
                  //       Icons.photo_outlined,
                  //       color: Colors.grey,
                  //       size: 50,
                  //     )),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Add a cover photo',
                      style: TextStyle(
                          color: HexColor('#2E3E5C'),
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Make your dish look good',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ),
        ));
  }
}
