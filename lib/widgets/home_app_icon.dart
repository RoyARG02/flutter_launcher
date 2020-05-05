import 'package:flutter/material.dart';

import 'package:device_apps/device_apps.dart';

class HomeAppIcon extends StatelessWidget {
  final ApplicationWithIcon app;
  HomeAppIcon({this.app});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(4.0),
        color: Theme.of(context).accentColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.memory(
              app.icon,
              height: 96.0,
              width: 96.0,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                app.appName,
                style: Theme.of(context).accentTextTheme.bodyText1,
                maxLines: 1,
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
      ),
      onTap: () => DeviceApps.openApp(app.packageName),
    );
  }
}
