import 'package:flutter/material.dart';
import 'package:flutter_launcher/data/app_metadata.dart';
import 'package:flutter_launcher/widgets/home_app_icon.dart';

class Home extends StatefulWidget {
  final VoidCallback _invokeAllApps;
  Home(this._invokeAllApps);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      extendBody: true,
      // extendBodyBehindAppBar: true,
      body: CustomScrollView(
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
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: widget._invokeAllApps,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
