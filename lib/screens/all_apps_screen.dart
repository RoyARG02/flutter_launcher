import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_launcher/data/static_data.dart';
import 'package:flutter_launcher/data/theme_bloc/theme_bloc.dart';
import 'package:flutter_launcher/widgets/all_apps_icon.dart';

class AllAppsScreen extends StatelessWidget {
  final Function goToHome;
  AllAppsScreen({this.goToHome});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Scrollbar(
        child: CustomScrollView(
          // provide a key for tests
          key: Key('all_apps_list'),
          physics:
              AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          slivers: <Widget>[
            SliverAppBar(
              brightness: BlocProvider.of<ThemeState>(context).state
                  ? Brightness.dark
                  : Brightness.light,
              floating: true,
              snap: true,
              leading: BackButton(
                onPressed: goToHome,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return AllAppsIcon(
                      app: installedApps[index],
                    );
                  },
                  childCount: installedApps.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
