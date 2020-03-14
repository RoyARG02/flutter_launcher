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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white.withOpacity(0.75),
      statusBarIconBrightness: Brightness.dark,
    ));
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handlePageChange(int newPage) {
    _controller.animateToPage(newPage,
        duration: Duration(milliseconds: 750), curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: PageView(
        controller: _controller,
        children: <Widget>[
          Home(goToApps: () => this._handlePageChange(1)),
          AllAppsScreen(goToHome: () => this._handlePageChange(0)),
        ],
      ),
    );
  }
}
