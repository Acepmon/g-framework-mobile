import 'package:flutter/material.dart';
import 'package:gframework/themes/AppBlock.dart';
import 'package:gframework/themes/MyTheme.dart';

class SettingsPage extends StatelessWidget {
  final AppBloc bloc;

  SettingsPage({Key key, @required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          "Settings",
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                StreamBuilder(
                    stream: bloc.outTheme,
                    builder: (context, AsyncSnapshot<AppTheme> snapshot) {
                      return DropdownButton<AppTheme>(
                        hint: Text("Select a theme:"),
                        value: snapshot.data,
                        items: myThemes.map((AppTheme appTheme) {
                          return DropdownMenuItem<AppTheme>(
                            value: appTheme,
                            child: Text(appTheme.name),
                          );
                        }).toList(),
                        onChanged: bloc.inTheme,
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
