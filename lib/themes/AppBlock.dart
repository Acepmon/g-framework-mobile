import 'package:gframework/themes/MyTheme.dart';
import 'package:rxdart/rxdart.dart';

class AppBloc {
  final _theme = BehaviorSubject<AppTheme>();
  Function(AppTheme) get inTheme => _theme.sink.add;
  Stream<AppTheme> get outTheme => _theme.stream;
  AppBloc() {
    print('— — — -APP BLOC INIT — — — — ');
  }
  dispose() {
    print('— — — — -APP BLOC DISPOSE — — — — — -');
    _theme.close();
  }
}
