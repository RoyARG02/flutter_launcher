import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:flutter_launcher/data/theme_bloc/theme_bloc.dart';

import 'package:flutter_launcher/screens/all_apps_screen.dart';
import 'package:flutter_launcher/screens/home_screen.dart';
import 'package:flutter_launcher/ui/themes.dart';
import 'package:flutter_launcher/utils/get_apps.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await HydratedBlocDelegate.build();
  await getInstalledApps();
  runApp(
    BlocProvider<ThemeState>(
      create: (_) => ThemeState(),
      child: Root(),
    ),
  );
}

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeState, bool>(
      builder: (_, state) {
        print('Rebuild');
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: buildSystemOverlayStyle(
            isDarkThemeBrightness: BlocProvider.of<ThemeState>(context).state,
          ),
          child: MaterialApp(
            home: Common(),
            debugShowCheckedModeBanner: false,
            theme: buildTheme(isDarkThemeBrightness: state),
          ),
        );
      },
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
