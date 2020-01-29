import 'package:flutter/material.dart';
import 'package:flutter_launcher/data/app_metadata.dart';
import 'package:launcher_assist/launcher_assist.dart';

class HomeAppIcon extends StatelessWidget {
  final AppMetaData app;
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
              app.imageBytes,
              height: 96.0,
              width: 96.0,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                app.label,
                style: Theme.of(context).accentTextTheme.body2,
                maxLines: 1,
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
      ),
      onTap: () => LauncherAssist.launchApp(app.packageName),
    );
  }
}
