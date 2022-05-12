import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:tastewing/Providers/ApiDataFetch.dart';
import 'package:tastewing/Providers/DataFetch.dart';
import 'package:tastewing/Widgets/HomeScreen/SingleRecipeDisplay.dart';
import 'package:toast/toast.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback openDrawer;

  HomeScreen({this.openDrawer});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var foodSelected = false;
  var beverageSelected = false;
  var dessertSelected = false;
  TextEditingController _searchKeyController = TextEditingController();

  @override
  void didChangeDependencies() {
    // Provider.of<RecipeDataList>(context).getData();
    print(RecipeDataList.allRecipes.length);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final recipes = Provider.of<RecipeDataList>(context).values;

    double getProportionateScreenHeight(double inputHeight) {
      double screenHeight = MediaQuery.of(context).size.height;
      return (inputHeight / 812.0) * screenHeight;
    }

    double getProportionateScreenWidth(double inputWidth) {
      double screenWidth = MediaQuery.of(context).size.width;
      return (inputWidth / 375.0) * screenWidth;
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(60),
          ),
          Container(
            margin: EdgeInsets.only(
              left: getProportionateScreenWidth(10),
            ),
            child: IconButton(
              icon: FaIcon(FontAwesomeIcons.alignLeft),
              color: Colors.black,
              onPressed: widget.openDrawer,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: getProportionateScreenWidth(20)),
                child: Text(
                  'Hello,User',
                  style: TextStyle(
                      color: Colors.black, fontSize: 30, fontFamily: 'SansPro'),
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(right: getProportionateScreenWidth(15)),
                child: SizedBox(
                  height: getProportionateScreenHeight(40),
                  width: getProportionateScreenWidth(60),
                  child: AspectRatio(
                    aspectRatio: 0.85,
                    child: Container(
                      child: Image.asset('assets/images/female.png'),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(7),
          ),
          Container(
            margin: EdgeInsets.only(left: getProportionateScreenWidth(20)),
            child: Text(
              'What Are We Cooking Today ?',
              style: TextStyle(
                  color: Colors.black, fontSize: 22, fontFamily: 'SansPro'),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
                controller: _searchKeyController,
                decoration: InputDecoration(
                    prefixIcon: GestureDetector(
                      onTap: () async {
                        if (_searchKeyController.text.isEmpty) {
                          return Toast.show(
                              'Please enter something to search!', context,
                              duration: 2);
                        }

                        final value = await Provider.of<ApiRecipeList>(context,
                                listen: false)
                            .getData(_searchKeyController.text.trim());
                        if (value == 1) {
                          return Toast.show(
                              'No such record found! please check your search',
                              context,
                              duration: 2);
                        }
                        _searchKeyController.clear();
                        Navigator.of(context).pushNamed('SearchedRecipes');
                      },
                      child: Icon(
                        Icons.search,
                        color: HexColor('#3E5481'),
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: HexColor('#F4F5F7'))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: HexColor('#3E5481')))),
                textInputAction: TextInputAction.search,
                onSubmitted: (_) async {
                  if (_searchKeyController.text.isEmpty) {
                    return Toast.show(
                        'Please enter something to search', context,
                        duration: 2);
                  }

                  final value =
                      await Provider.of<ApiRecipeList>(context, listen: false)
                          .getData(_searchKeyController.text);
                  if (value == 1) {
                    return Toast.show(
                        'No such record found! check your search again',
                        context,
                        duration: 2);
                  }
                  Navigator.of(context).pushNamed('SearchedRecipes');
                }),
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          Container(
              margin: EdgeInsets.only(left: getProportionateScreenWidth(25)),
              child: Text('Eat what makes you happy',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Josefin',
                  ))),
          Expanded(
            child: StreamBuilder(
              stream: Firestore.instance.collection('Recipes/').snapshots(),
              builder: (ctx, stx) {
                stx.data.documents.forEach((document) {
                  RecipeDataList.allRecipes.add(RecipeData(
                      id: document.documentID,
                      title: document['title'],
                      imageUrl: document['imageUrl'],
                      noOfServings: document['noOfServings'],
                      cookTime: document['cookTime'],
                      directions: document['Directions'],
                      ingredients: document['Ingredients']));
                });
                return CarouselSlider.builder(
                    itemCount: stx.data.documents.length,
                    itemBuilder: (context, index, realIndex) => RecipeDisplay(
                          singleObject: RecipeDataList.allRecipes[realIndex],
                        ),
                    options: CarouselOptions(
                      scrollDirection: Axis.horizontal,
                      enableInfiniteScroll: false,
                      height: getProportionateScreenHeight(530),
                      enlargeCenterPage: true,
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}
