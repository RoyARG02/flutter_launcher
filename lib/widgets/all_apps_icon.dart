import 'package:flutter/material.dart';
import 'package:flutter_launcher/data/app_metadata.dart';
import 'package:launcher_assist/launcher_assist.dart';

class AllAppsIcon extends StatelessWidget {
  final AppMetaData app;
  AllAppsIcon({this.app});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).accentColor,
            width: 4.0,
          ),
        ),
        padding: const EdgeInsets.all(2.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.memory(
                app.imageBytes,
                height: 48.0,
                width: 48.0,
              ),
            ),
            Text(
              app.label,
              style: Theme.of(context).textTheme.subhead,
              maxLines: 1,
              overflow: TextOverflow.fade,
            )
          ],
        ),
      ),
      onTap: () => LauncherAssist.launchApp(app.packageName),
    );
  }
}
