import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:tastewing/Providers/ApiDataFetch.dart';

import 'Providers/DataFetch.dart';
import 'Widgets/HomeScreen/SingleRecipeDisplay.dart';

class CheckDart extends StatelessWidget {
  ApiRecipe singleObject;

  CheckDart(this.singleObject);

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

    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, 'ProductDetail',
        //     arguments: widget.singleProduct);
      },
      child: Container(
        height: getProportionateScreenHeight(350),
        width: getProportionateScreenWidth(150),
        padding: EdgeInsets.only(
            left: getProportionateScreenWidth(3),
            right: getProportionateScreenWidth(3)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(const Radius.circular(6.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            SizedBox(
              height: getProportionateScreenHeight(170),
              width: double.infinity,
              child: AspectRatio(
                aspectRatio: 0.85,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(const Radius.circular(12.0)),
                  ),
                  child: ClipRRect(
                    child: FadeInImage(
                        alignment: Alignment.center,
                        placeholder: AssetImage('assets/images/logo.png'),
                        image: NetworkImage(singleObject.imgUrl),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                singleObject.label,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Josefin',
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.orange.shade400,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    singleObject.calories.toString(),
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                      fontFamily: 'Josefin',
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.restaurant_menu,
                    color: Colors.orange.shade400,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    singleObject.servings.toString(),
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                      fontFamily: 'Josefin',
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.timer,
                    color: Colors.orange.shade400,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    singleObject.cookTime.toString(),
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                      fontFamily: 'Josefin',
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
