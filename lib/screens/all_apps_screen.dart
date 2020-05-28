import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_launcher/data/static_data.dart';
import 'package:flutter_launcher/data/theme_bloc/theme_bloc.dart';
import 'package:flutter_launcher/widgets/all_apps_icon.dart';

class AllAppsScreen extends StatefulWidget {
  final Function goToHome;
  AllAppsScreen({this.goToHome});

  @override
  _AllAppsScreenState createState() => _AllAppsScreenState();
}

class _AllAppsScreenState extends State<AllAppsScreen> {
  ThemeState _themeStateBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeStateBloc = BlocProvider.of<ThemeState>(context);
  }

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
              floating: true,
              snap: true,
              leading: BackButton(
                onPressed: widget.goToHome,
              ),
              actions: <Widget>[
                PopupMenuButton<String>(
                  onSelected: (selected) =>
                      _handleOptionSelect(selected, context),
                  itemBuilder: (_) {
                    return _buildAllAppsScreenOptions()
                        .map(
                          (String option) => PopupMenuItem<String>(
                            value: option,
                            child: Text(option),
                          ),
                        )
                        .toList();
                  },
                ),
              ],
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

  List<String> _buildAllAppsScreenOptions() {
    return <String>[
      'Change Theme',
    ];
  }

  void _handleOptionSelect(String selected, BuildContext context) {
    switch (selected) {
      case 'Change Theme':
        _themeStateBloc.add(!_themeStateBloc.state);
    }
  }
}
