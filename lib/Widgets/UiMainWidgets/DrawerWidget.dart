import 'package:flutter/material.dart';
import 'package:tastewing/Providers/DrawerItem.dart';

class DrawerWidget extends StatelessWidget {
//callback function

  final ValueChanged<DrawerItem> onSelectedItem;

  DrawerWidget({this.onSelectedItem});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildDrawerItems(context),
        ],
      ),
    );
  }

  Widget buildDrawerItems(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 32, 16, 0),
      child: SingleChildScrollView(
        child: Column(
            children: DrawerItems.all
                .map((item) => ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                      leading: Icon(
                        item.icon,
                        color: Colors.white,
                      ),
                      title: Text(
                        item.title,
                        style: TextStyle(color: Colors.white, fontSize: 21),
                      ),
                      onTap: () => onSelectedItem(item),
                    ))
                .toList()),
      ),
    );
  }
}
