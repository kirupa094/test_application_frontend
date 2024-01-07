import 'package:test_application/model/profile_model.dart';

abstract class UserRepository {
  Future<dynamic> loginApiCall(Map<String, String> data);
  Future<dynamic> registerApiCall(Map<String, String> data);
  Future<ProfileModel> getProfileInfo(String token);
}
