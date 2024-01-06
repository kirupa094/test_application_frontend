abstract class UserRepository {
  Future<dynamic> loginApiCall(Map<String, String> data);
  Future<dynamic> registerApiCall(Map<String, String> data);
}
