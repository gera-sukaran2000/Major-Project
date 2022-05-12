import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tastewing/Providers/DrawerItem.dart';
import 'package:tastewing/Screens/HomeScreen.dart';
import 'package:tastewing/Widgets/UiMainWidgets/DrawerWidget.dart';

class MainUi extends StatefulWidget {
  @override
  _MainUiState createState() => _MainUiState();
}

class _MainUiState extends State<MainUi> {
  double xOffset;
  double yOffset;
  double scaleFactor;
  bool isDrawerOpen;
  DrawerItem item = DrawerItems.home;

  @override
  void initState() {
    super.initState();
    closeDrawer();
  }

  void openDrawer() {
    setState(() {
      xOffset = 200;
      yOffset = 150;
      scaleFactor = 0.6;
      isDrawerOpen = true;
    });
  }

  void closeDrawer() {
    setState(() {
      xOffset = 0;
      yOffset = 0;
      scaleFactor = 1;
      isDrawerOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#2E3E5C'),
        body: Stack(
          children: [
            builDrawer(),
            buildHomePage(),
          ],
        ));
  }

  Widget builDrawer() => SafeArea(
          child: Container(
        width: xOffset,
        child: DrawerWidget(
          onSelectedItem: (item) {
            setState(() => this.item = item);
            closeDrawer();
          },
        ),
      ));

  Widget buildHomePage() {
    return WillPopScope(
      onWillPop: () async {
        if (isDrawerOpen) {
          closeDrawer();
          return false;
        } else {
          return true;
        }
      },
      child: GestureDetector(
        onTap: closeDrawer,
        child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(scaleFactor),
            child: AbsorbPointer(
              absorbing: isDrawerOpen,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(isDrawerOpen ? 20 : 0),
                child: Container(
                    color: isDrawerOpen ? Colors.white24 : Colors.white,
                    child: getDrawerPage()),
              ),
            )),
      ),
    );
  }

  Widget getDrawerPage() {
    switch (item) {
      case DrawerItems.home:
      default:
        return HomeScreen(
          openDrawer: openDrawer,
        );
    }
  }
}
