import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:tastewing/Check.dart';
import 'package:tastewing/Providers/ApiDataFetch.dart';
import 'package:tastewing/Widgets/HomeScreen/SingleRecipeDisplay.dart';

class SearchedRecipes extends StatefulWidget {
  const SearchedRecipes({Key key}) : super(key: key);

  @override
  State<SearchedRecipes> createState() => _SearchedRecipesState();
}

class _SearchedRecipesState extends State<SearchedRecipes> {
  double getProportionateScreenHeight(double inputHeight) {
    double screenHeight = MediaQuery.of(context).size.height;
    return (inputHeight / 812.0) * screenHeight;
  }

  double getProportionateScreenWidth(double inputWidth) {
    double screenWidth = MediaQuery.of(context).size.width;
    return (inputWidth / 375.0) * screenWidth;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final recipes = Provider.of<ApiRecipeList>(context).recipelist;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              height: getProportionateScreenHeight(140),
              width: double.infinity,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: HexColor('#3E5481'),
                    ),
                  ),
                ),
                Flexible(
                  flex: 5,
                  fit: FlexFit.tight,
                  child: Image(
                    image: AssetImage('assets/images/logo.png'),
                    alignment: Alignment.center,
                    fit: BoxFit.fitWidth,
                  ),
                )
              ]),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Divider(
              endIndent: 0,
              indent: 0,
              color: Colors.grey.shade200,
              thickness: 5,
            ),
            Container(
              height: getProportionateScreenHeight(580),
              width: double.infinity,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: getProportionateScreenHeight(5),
                      mainAxisSpacing: getProportionateScreenWidth(5),
                      childAspectRatio: 0.66),
                  itemBuilder: (context, index) => CheckDart(recipes[index]),
                  itemCount: recipes.length),
            ),
          ],
        ),
      ),
    );
  }
}
