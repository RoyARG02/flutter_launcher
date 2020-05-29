import 'package:flutter/services.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:flutter_launcher/ui/themes.dart';

const String themeStatePrefsKey = 'isDarkTheme';

class ThemeState extends HydratedBloc<bool, bool> {
  ThemeState() : super() {
    SystemChrome.setSystemUIOverlayStyle(
        buildSystemOverlayStyle(isDarkThemeBrightness: state));
  }

  @override
  bool get initialState => super.initialState ?? false;

  @override
  bool fromJson(Map<String, dynamic> json) {
    try {
      return json[themeStatePrefsKey];
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, bool> toJson(bool state) {
    try {
      return {themeStatePrefsKey: state};
    } catch (_) {
      return null;
    }
  }

  @override
  Stream<bool> mapEventToState(bool event) async* {
    SystemChrome.setSystemUIOverlayStyle(
        buildSystemOverlayStyle(isDarkThemeBrightness: event));
    yield event;
  }
}
