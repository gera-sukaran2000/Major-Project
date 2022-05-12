import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerItem {
  final String title;
  final IconData icon;

  const DrawerItem({@required this.icon, @required this.title});
}

class DrawerItems {
  static const home = DrawerItem(icon: FontAwesomeIcons.home, title: 'Home');
  static const logout = DrawerItem(icon: Icons.logout, title: 'Logout');
  static const settings = DrawerItem(icon: Icons.settings, title: 'Settings');

  static final List<DrawerItem> all = [home, settings, logout];
}
