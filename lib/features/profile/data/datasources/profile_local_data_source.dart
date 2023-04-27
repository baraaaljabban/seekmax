import 'package:seekmax/core/shared_pereference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProfileLocalDataSource {
  void clearJWTToken();
}

class ProfileLocalDataSourceImpl extends ProfileLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProfileLocalDataSourceImpl({required this.sharedPreferences});
  @override
  void clearJWTToken() {
    sharedPreferences.remove(CACHED_JWT_TOKEN);
  }
}
