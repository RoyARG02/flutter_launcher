import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_launcher/screens/all_apps_screen.dart';

import 'package:flutter_launcher/screens/home_screen.dart';
import 'package:flutter_launcher/ui/themes.dart';
import 'package:flutter_launcher/utils/get_apps.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getInstalledApps();
  runApp(Root());
}

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      home: Common(),
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
    );
  }
}

class Common extends StatefulWidget {
  @override
  _CommonState createState() => _CommonState();
}

class _CommonState extends State<Common> {
  PageController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void gotoAllApps() {
    _controller.animateToPage(1,
        duration: Duration(milliseconds: 750), curve: Curves.fastOutSlowIn);
  }

  void gotoHome() {
    _controller.animateToPage(0,
        duration: Duration(milliseconds: 750), curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: PageView(
        controller: _controller,
        children: <Widget>[
          Home(gotoAllApps),
          AllAppsScreen(gotoHome),
        ],
      ),
    );
  }
}
