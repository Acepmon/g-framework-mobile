import 'package:flutter/material.dart';
import 'package:gframework/themes.dart';
import 'package:gframework/utils/Constants.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:gframework/common/platform/platformScaffold.dart';
import 'package:gframework/common/widgets/basicDrawer.dart';

class HomeScreen extends StatefulWidget {
  final ThemeBloc themeBloc;

  HomeScreen({Key key, this.themeBloc}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _saveCurrentRoute("/HomeScreen");
  }

  _saveCurrentRoute(String lastRoute) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('LastScreenRoute', lastRoute);
  }

  void choiceAction(String choice) {
    if (choice == Constants.FirstItem) {
      print('I First Item');
    } else if (choice == Constants.SecondItem) {
      print('I Second Item');
    } else if (choice == Constants.ThirdItem) {
      print('I Third Item');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Home Screen",
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   backgroundColor: Colors.white,
      //   iconTheme: IconThemeData(color: Colors.black),
      //   elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 6.0,
      // ),
      appBar: new AppBar(
        title: new Text('G Framework'),
        backgroundColor: Color(0xff8c3a3a),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      drawer: BasicDrawer(),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('This is the Home screen'),
            ],
          ),
        ),
      ),
    );
  }
}
