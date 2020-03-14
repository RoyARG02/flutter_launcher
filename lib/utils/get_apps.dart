import 'package:flutter/material.dart';

import 'package:device_apps/device_apps.dart';

import 'package:flutter_launcher/data/static_data.dart';

Future<void> getInstalledApps() {
  return DeviceApps.getInstalledApplications(includeAppIcons: true).then(
    (data) => installedApps = sortAppsByName(data),
  );
}

List<Application> sortAppsByName(List<Application> allApps) {
  // * Remove launcher package from list of installed apps
  allApps
      .removeWhere((app) => app.packageName == "com.isocode.flutter_launcher");

  int j;
  Application tmp;
  for (int i = 1; i < allApps.length; ++i) {
    j = i - 1;
    tmp = allApps[i];
    while (j > -1 &&
        tmp.appName.toLowerCase().compareTo(allApps[j].appName.toLowerCase()) <
            0) {
      allApps[j + 1] = allApps[j];
      j--;
    }
    allApps[j + 1] = tmp;
  }
  allApps.forEach((f) => debugPrint(f.toString()));
  return allApps;
}
