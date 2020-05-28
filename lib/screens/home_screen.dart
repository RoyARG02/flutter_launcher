import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_launcher/data/static_data.dart';
import 'package:flutter_launcher/data/theme_bloc/theme_bloc.dart';
import 'package:flutter_launcher/widgets/home_app_icon.dart';

class Home extends StatefulWidget {
  final Function goToApps;
  Home({this.goToApps});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  ThemeState _themeStateBloc;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeStateBloc = BlocProvider.of<ThemeState>(context);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      extendBody: true,
      // extendBodyBehindAppBar: true,
      body: CustomScrollView(
        // provide a key for tests
        key: Key('home_screen_list'),
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        slivers: <Widget>[
          SliverPadding(
            padding:
                const EdgeInsets.all(8.0).add(MediaQuery.of(context).padding),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return HomeAppIcon(app: installedApps[index]);
                },
                childCount: installedApps.length,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.palette),
                    onPressed: () =>
                        _themeStateBloc.add(!_themeStateBloc.state),
                  ),
                  IconButton(
                    // provide a key for tests
                    key: Key('goto_all_apps_button'),
                    icon: Icon(Icons.arrow_forward),
                    onPressed: widget.goToApps,
                  ),
                ],
              ),
              // child: Align(
              //   alignment: Alignment.centerRight,
              //   child: IconButton(
              //     icon: Icon(Icons.arrow_forward),
              //     onPressed: widget.goToApps,
              //   ),
              // ),
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
