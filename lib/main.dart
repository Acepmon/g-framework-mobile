import 'package:flutter/material.dart';
import 'package:gframework/routes.dart';
import 'package:gframework/themes/AppBlock.dart';
import 'package:gframework/themes/MyTheme.dart';
import 'package:gframework/ui/homeScreen.dart';
import 'package:gframework/ui/splashScreen.dart';
import 'package:gframework/themes.dart';

//void main() => runApp(MyApp());

void main() => runApp(new ThemeSwitcherApp());

class ThemeSwitcherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeBloc themeBloc = ThemeBloc();
    return StreamBuilder<ThemeData>(
      initialData: themeBloc.initialTheme().data,
      stream: themeBloc.themeDataStream,
      builder: (BuildContext context, AsyncSnapshot<ThemeData> snapshot) {
        return MaterialApp(
          title: 'G Framework',
          theme: snapshot.data,
          routes: routes,
          home: SplashScreen(),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'My Login App',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: routes,
      home: SplashScreen(),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'CRS',
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     home: MyHomePage(title: 'Customer Register System'),
  //   );
  // }
}

// class MyApp extends StatefulWidget {
//   @override
//   MyAppState createState() {
//     return new MyAppState();
//   }
// }

// class MyAppState extends State<MyApp> {
//   AppBloc bloc;

//   @override
//   void initState() {
//     super.initState();
//     bloc = new AppBloc();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     bloc.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //bloc: bloc,
//       body: StreamBuilder(
//           initialData: myThemes[0],
//           stream: bloc.outTheme,
//           builder: (context, AsyncSnapshot<AppTheme> snapshot) {
//             return MaterialApp(
//                 theme: snapshot.hasData
//                     ? _buildThemeData(snapshot.data)
//                     : ThemeData(),
//                 routes: routes,
//                 home: SplashScreen());
//           }),
//     );
//   }

//   _buildThemeData(AppTheme appTheme) {
//     return ThemeData(
//       brightness: appTheme.theme.brightness,
//       primarySwatch: appTheme.theme.primarySwatch,
//     );
//   }
// }
