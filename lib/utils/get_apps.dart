import 'package:flutter/cupertino.dart';
import 'package:flutter_launcher/data/app_metadata.dart';
import 'package:launcher_assist/launcher_assist.dart';

Future<void> getInstalledApps() {
  return LauncherAssist.getAllApps().then((data) => addAllApps(data));
}

void addAllApps(List<dynamic> allApps) {
  installedApps = sortAppsByName(
    Iterable<AppMetaData>.generate(
      allApps.length,
      (i) => AppMetaData(
          label: allApps[i]["label"],
          imageBytes: allApps[i]["icon"],
          packageName: allApps[i]["package"]),
    )
        .where((app) => app.packageName != "com.isocode.flutter_launcher")
        .toList(),
  );
}

List<AppMetaData> sortAppsByName(List<AppMetaData> allApps) {
  int j;
  AppMetaData tmp;
  for (int i = 1; i < allApps.length; ++i) {
    j = i - 1;
    tmp = allApps[i];
    while (j > -1 &&
        tmp.label.toLowerCase().compareTo(allApps[j].label.toLowerCase()) < 0) {
      allApps[j + 1] = allApps[j];
      j--;
    }
    allApps[j + 1] = tmp;
  }
  allApps.forEach((f) => debugPrint(f.toString()));
  return allApps;
}
