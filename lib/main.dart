import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tastewing/Check.dart';
import 'package:tastewing/Providers/ApiDataFetch.dart';
import 'package:tastewing/Providers/DataFetch.dart';
import 'package:tastewing/Screens/Authentication.dart';
import 'package:tastewing/Screens/HomeScreen.dart';
import 'package:tastewing/Screens/OtpVerify.dart';
import 'package:tastewing/Screens/ProfileScreen.dart';
import 'package:tastewing/Screens/RecipeUploadingPage2.dart';
import 'package:tastewing/Screens/SearchedRecipes.dart';
import 'package:tastewing/Screens/UiMain1.dart';
import 'package:tastewing/Screens/onboarding.dart';
import 'package:tastewing/Screens/webIngredients1.dart';
import 'package:tastewing/Screens/webIngredients2.dart';
import 'package:tastewing/Widgets/RecipeScreen.dart/upperView.dart';

int initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences _shared = await SharedPreferences.getInstance();
  initScreen = _shared.getInt('initScreen');
  await _shared.setInt('initScreen', 1);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => RecipeDataList(),
        ),
        ChangeNotifierProvider(create: (ctx) => ApiRecipeList()),
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: webScraping(),
            // initialRoute: (initScreen == 0 || initScreen == null)
            //     ? 'onBoard'
            //     : 'loginScreen',
            routes: {
              'onBoard': (context) => StartingScreen(),
              'upload2': (context) => Upload2(),
              'loginScreen': (context) => LoginScreen(),
              'otpScreen': (context) => OtpScreen(),
              'mainUi': (context) => MainUi(),
              'SearchedRecipes': (context) => SearchedRecipes(),
            }),
      ),
    );
  }
}
