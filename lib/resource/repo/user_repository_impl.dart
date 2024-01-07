import 'package:test_application/model/profile_model.dart';
import 'package:test_application/resource/repo/user_repository.dart';
import 'package:test_application/resource/services/errors/network_error.dart';
import 'package:test_application/resource/services/http_service.dart';

class UserRepositoryImpl extends UserRepository {
  final HttpService _httpService;

  UserRepositoryImpl() : _httpService = HttpService();
  final String pathLogin = '/login.php';
  final String pathRegister = '/register.php';
  final String pathGetProfile = '/home.php';
  final String pathUpdateProfile = '/update.php';

  @override
  Future loginApiCall(Map<String, String> data) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
    };
    var response = await _httpService.postFormData(
      pathLogin,
      data,
      headers: headers,
    );
    var status = response['status'];
    if (status == 200) {
      return response['token'];
    }
    throw NetworkError("Failed to submit");
  }

  @override
  Future registerApiCall(Map<String, String> data) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
    };

    var response = await _httpService.postFormData(
      pathRegister,
      data,
      headers: headers,
    );
    var status = response['status'];
    if (status == 201) {
      return response['token'];
    }
    throw NetworkError("Failed to submit");
  }

  @override
  Future<ProfileModel> getProfileInfo(String token) async {
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    var response = await _httpService.get(pathGetProfile, headers: headers);
    var success = response['status'];
    if (success == 200) {
      var data = response;
      return ProfileModel.fromParsedJson(data);
    }
    throw NetworkError("Fetching Data failed Error: ${response['message']}");
  }

  @override
  Future updateProfileApiCall(Map<String, String> data, String token) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await _httpService.postFormData(
     pathUpdateProfile,
      data,
      headers: headers,
    );
    var status = response['status'];
    if (status == 200) {
      return response['token'];
    }
    throw NetworkError("Failed to submit");
  }
}
