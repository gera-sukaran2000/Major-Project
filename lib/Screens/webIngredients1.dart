import 'package:flutter/material.dart';
import 'package:tastewing/Providers/CheckBoxList.dart';
import 'package:tastewing/Providers/DataFetch.dart';
import 'package:toast/toast.dart';

class checkIngredients extends StatefulWidget {
  List<dynamic> recipeDataIngredients;
  checkIngredients(this.recipeDataIngredients);

  @override
  State<checkIngredients> createState() => _checkIngredientsState();
}

class _checkIngredientsState extends State<checkIngredients> {
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
    for (int x = 0; x < widget.recipeDataIngredients.length; x++) {
      ingredients.add(CheckBoxState(label: widget.recipeDataIngredients[x]));
    }
    super.didChangeDependencies();
  }

  List<CheckBoxState> ingredients = [];
  List<String> checkedIngredients = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: getProportionateScreenWidth(20),
                  right: getProportionateScreenWidth(30)),
              child: Row(
                children: [
                  Text(
                    'Check ingredients you need!',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: 'SansPro'),
                  ),
                  Spacer(),
                  Icon(
                    Icons.dining,
                    color: Colors.orange.shade400,
                    size: 30,
                  )
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Divider(
              color: Colors.black,
              endIndent: 15,
              indent: 15,
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.all(12),
                children: [...ingredients.map(buildSingleCheckBox).toList()],
              ),
            ),
            Spacer(),
            FittedBox(
              alignment: Alignment.bottomCenter,
              child: FlatButton.icon(
                  minWidth: getProportionateScreenWidth(280),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  onPressed: () {
                    ingredients.forEach((element) {
                      if (element.value == true) {
                        checkedIngredients.add(element.label);
                      }
                    });
                    if (checkedIngredients.length <= 0) {
                      return Toast.show('No ingredients selected!', context,
                          duration: 2);
                    }
                    print(checkedIngredients.toString());
                  },
                  icon: Icon(
                    Icons.arrow_right_alt,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Next',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'SansPro'),
                  ),
                  color: Colors.orange[400]),
            )
          ],
        ),
      ),
    );
  }

  CheckboxListTile buildSingleCheckBox(CheckBoxState checkbox) {
    return CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.orange.shade400,
        value: checkbox.value,
        title: Text(
          checkbox.label,
          style: TextStyle(fontSize: 18),
        ),
        onChanged: (value) {
          return setState(() {
            checkbox.value = value;
          });
        });
  }
}
