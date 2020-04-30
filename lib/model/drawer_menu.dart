import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DrawerMenu {
  String title;
  IconData icon;
  bool isExpanded;
  DrawerMenu({this.title, this.icon, this.isExpanded = false});

  static List<DrawerMenu> getDrawerMenu() {
    List<DrawerMenu> drawerItems = [
      DrawerMenu(title: "Flutter", icon: Icons.home),
      DrawerMenu(title: "Android", icon: Icons.android),
      DrawerMenu(title: "iOS", icon: Icons.phone_iphone),
      DrawerMenu(title: "React Native", icon: Icons.phone)
    ];
    return drawerItems;
  }
}
