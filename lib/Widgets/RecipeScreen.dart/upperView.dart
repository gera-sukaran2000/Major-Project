import 'package:flutter/material.dart';
import 'package:tastewing/Providers/DataFetch.dart';
import 'package:tastewing/Screens/webIngredients1.dart';

class UpperView extends StatelessWidget {
  RecipeData singleObject;

  UpperView(this.singleObject);

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              height: getProportionateScreenHeight(500),
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        bottom: getProportionateScreenHeight(140)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25)),
                    ),
                    child: FadeInImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(singleObject.imageUrl),
                      placeholder: AssetImage('assets/images/backup.jpeg'),
                    ),
                  )),
                  Positioned(
                    left: 30,
                    right: 30,
                    top: getProportionateScreenHeight(300),
                    child: Container(
                      height: getProportionateScreenHeight(155),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.orange[300].withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 4))
                        ],
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: getProportionateScreenHeight(5)),
                          Align(
                            alignment: Alignment.center,
                            child: Text(singleObject.title,
                                style: TextStyle(
                                    fontFamily: 'JoseFin',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 27)),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: Icon(Icons.hourglass_bottom_outlined,
                                      color: Colors.orange[400], size: 19)),
                              SizedBox(
                                width: 4,
                              ),
                              Text('${singleObject.cookTime} mins',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  )),
                              SizedBox(
                                width: 14,
                              ),
                              Container(
                                  child: Icon(
                                      Icons.local_fire_department_outlined,
                                      color: Colors.orange[400],
                                      size: 19)),
                              SizedBox(
                                width: 4,
                              ),
                              Text('${singleObject.cookTime * 10 + 150}',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  )),
                              SizedBox(
                                width: 14,
                              ),
                              Container(
                                  child: Icon(Icons.brunch_dining,
                                      color: Colors.orange[400], size: 19)),
                              SizedBox(
                                width: 4,
                              ),
                              Text('Serves ${singleObject.noOfServings}',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: getProportionateScreenWidth(15)),
              child: Row(
                children: [
                  Icon(
                    Icons.restaurant,
                    color: Colors.orange.shade400,
                    size: 20,
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  Text(
                    'Ingredients',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Josefin'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(
                  top: 0, left: getProportionateScreenWidth(15)),
              shrinkWrap: true,
              itemCount: singleObject.ingredients.length,
              itemBuilder: (ctx, index) => Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.orange.shade400,
                    size: 18,
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(5),
                  ),
                  Text(
                    singleObject.ingredients[index],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'SansPro'),
                  ),
                ],
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: getProportionateScreenHeight(7),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            Padding(
              padding: EdgeInsets.only(left: getProportionateScreenWidth(15)),
              child: Row(
                children: [
                  Icon(
                    Icons.menu_book,
                    color: Colors.orange.shade400,
                    size: 20,
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  Text(
                    'Cooking Steps',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Josefin'),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(
                  top: 0,
                  left: getProportionateScreenWidth(7),
                  right: getProportionateScreenWidth(7)),
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.orange.shade400,
                        child: Text(
                          '# ${(index + 1)}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(singleObject.directions[index]),
                    ),
                    Divider(),
                  ],
                );
              },
              itemCount: singleObject.directions.length,
            ),
            FittedBox(
              alignment: Alignment.bottomCenter,
              child: FlatButton.icon(
                  minWidth: getProportionateScreenWidth(280),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            checkIngredients(singleObject.ingredients)));
                  },
                  icon: Icon(
                    Icons.delivery_dining,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Check Ingredients Prices',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'SansPro'),
                  ),
                  color: Colors.orange[400]),
            ),
          ],
        ),
      ),
    );
  }
}
