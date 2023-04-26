import 'package:seekmax/core/errors/exceptions.dart';
import 'package:seekmax/core/shared_pereference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginLocalDataSource {
  Future<bool> cacheJwtAccessToken({required String token});
}

class LoginLocalDataSourceImpl extends LoginLocalDataSource {
  SharedPreferences sharedPreferences;
  LoginLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<bool> cacheJwtAccessToken({required String token}) async {
    if (token.isNotEmpty) {
      return sharedPreferences.setString(CACHED_JWT_TOKEN, token);
    } else {
      throw LocalDataSourceException(message: "caching_token_exception");
    }
  }
}
