import 'package:test_application/resource/repo/user_repository.dart';
import 'package:test_application/resource/services/errors/network_error.dart';
import 'package:test_application/resource/services/http_service.dart';

class UserRepositoryImpl extends UserRepository {
  final HttpService _httpService;

  UserRepositoryImpl() : _httpService = HttpService();
  final String pathLogin = '/login.php';
  final String pathRegister = '/register.php';

  @override
  Future loginApiCall(Map<String, String> data) async {
    Map<String, String> headers = {'Accept': 'application/json'};

    var response = await _httpService.postFormData(
      pathLogin,
      data,
      headers: headers,
    );
    var status = response['status'];
    if (status== 200) {
      print(response['token']);
      return 'tok';
    }
    throw NetworkError("Failed to submit");
  }

  @override
  Future registerApiCall(Map<String, String> data) async {
        Map<String, String> headers = {'Accept': 'application/json'};

    var response = await _httpService.postFormData(
      pathLogin,
      data,
      headers: headers,
    );
    var status = response['status'];
    if (status== 200) {
      print(response['token']);
      return 'tok';
    }
    throw NetworkError("Failed to submit");
  }

}
