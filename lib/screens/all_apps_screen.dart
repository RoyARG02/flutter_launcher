import 'package:flutter/material.dart';
import 'package:flutter_launcher/data/app_metadata.dart';
import 'package:flutter_launcher/widgets/all_apps_icon.dart';

class AllAppsScreen extends StatelessWidget {
  final Function _invokeHome;
  AllAppsScreen(this._invokeHome);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Scrollbar(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              leading: BackButton(
                onPressed: _invokeHome,
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
