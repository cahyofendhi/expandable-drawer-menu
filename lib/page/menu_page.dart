import 'package:flutter/material.dart';

class FlutterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return pageContent('Flutter Page');
  }
}

class AndroidPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return pageContent('Android Page');
  }
}

class IOSPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return pageContent('iOS Page');
  }
}

class ReactNativePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return pageContent('React Native Page');
  }
}

Widget pageContent(String title) {
  return Center(
    child: Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
    ),
  );
}
