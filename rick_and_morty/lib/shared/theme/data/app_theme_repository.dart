import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AppThemeRepository {
  String? get theme;
  void changeTheme(String theme);
}

@Injectable(as: AppThemeRepository)
class AppThemeRepositoryImpl implements AppThemeRepository {
  AppThemeRepositoryImpl(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;
  final _themeKey = 'themeNameKey';

  @override
  void changeTheme(String theme) {
    _sharedPreferences.setString(_themeKey, theme);
  }

  @override
  String? get theme => _getTheme();

  String? _getTheme() {
    try {
      return _sharedPreferences.getString(_themeKey);
    } catch (_) {
      return null;
    }
  }
}
