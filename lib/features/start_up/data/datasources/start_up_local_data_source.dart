import 'package:seekmax/core/shared_pereference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StartUpLocalDataSource {
  bool isUserLoggedIn();
  String getCachedJwtAccessToken();
}

class StartUpLocalDataSourceImpl extends StartUpLocalDataSource {
  final SharedPreferences sharedPreferences;

  StartUpLocalDataSourceImpl({required this.sharedPreferences});
  @override
  bool isUserLoggedIn() {
    return getCachedJwtAccessToken().isNotEmpty;
  }

  @override
  String getCachedJwtAccessToken() {
    final token = sharedPreferences.getString(CACHED_JWT_TOKEN);
    return (token != null && token.isNotEmpty) ? token : '';
  }
}
