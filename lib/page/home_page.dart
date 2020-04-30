import 'package:DrawerMenu/model/drawer_menu.dart';
import 'package:DrawerMenu/page/menu_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<DrawerMenu> drawerItems = DrawerMenu.getDrawerMenu();
  int _selectedDrawerIndex = 0;
  static const FLUTTER = 0;
  static const ANDROID = 1;
  static const IOS = 2;
  static const REACTNATIVE = 3;

  @override
  Widget build(BuildContext context) {
    final themeMenu = Theme.of(context).copyWith(dividerColor: 
        Colors.transparent);
    return Scaffold(
      appBar: AppBar(
        title: Text(drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    maxRadius: 50,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('John Doe'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('JohnDoe@gmail.com')
                ],
              ),
            ),
            ListView.builder(
                itemCount: drawerItems.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _drawerMenuItem(index, drawerItems[index], themeMenu);
                }),
          ],
        ),
      ),
      body: _getDrawerFragment(_selectedDrawerIndex),
    );
  }

  // get menu by index
  Widget _getDrawerFragment(int pos) {
    switch (pos) {
      case FLUTTER:
        return FlutterPage();
      case ANDROID:
        return AndroidPage();
      case IOS:
        return IOSPage();
      case REACTNATIVE:
        return ReactNativePage();

      default:
        return Text("Error");
    }
  }

  // set selected menu
  void _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop();
  }

  // build menu title
  Widget _buildHeaderContent(DrawerMenu d, int index) {
    return ListTile(
      leading: Icon(d.icon),
      title: Text(
        d.title,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      selected: index == _selectedDrawerIndex,
      onTap: () => _onSelectItem(index),
    );
  }

  // build expanded content menu
  Widget _buildExpandableContent(DrawerMenu d, int index) {
    return ListTile(
      title: Text(
        'Sub Menu ${d.title}',
        style: TextStyle(color: Colors.black45),
      ),
      selected: index == _selectedDrawerIndex,
      onTap: () => _onSelectItem(index),
    );
  }

  // menu item
  Widget _drawerMenuItem(int index, DrawerMenu d, ThemeData menuTheme) {
    return Theme(
      data: menuTheme,
      child: ExpansionPanelList(
        animationDuration: Duration(milliseconds: 50),
        children: [
          ExpansionPanel(
              headerBuilder: (context, isExpand) =>
                  _buildHeaderContent(d, index),
              body: _buildExpandableContent(d, index),
              isExpanded: d.isExpanded)
        ],
        expansionCallback: (_, isExpanded) =>
            _actionExpanded(index, isExpanded),
      ),
    );
  }

  // action expand and collapse drawer menu
  void _actionExpanded(int index, isExpand) {
    if (!isExpand) {
      setState(() {
        drawerItems.asMap().forEach((key, value) {
          value.isExpanded = key == index;
        });
      });
    } else {
      setState(() => drawerItems[index].isExpanded = false);
    }
  }
}
