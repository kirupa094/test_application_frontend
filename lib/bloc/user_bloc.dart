import 'package:test_application/resource/repo/user_repository.dart';
import 'package:test_application/resource/repo/user_repository_impl.dart';

class UserBloc {
  String _userToken = '';

  static final UserBloc _bloc = UserBloc._constructor();

  factory UserBloc() => _bloc;

  final UserRepository _userRepository;

  UserBloc._constructor() : _userRepository = UserRepositoryImpl();

  //User Token
  String getUserToken() {
    return _userToken;
  }

  setUserToken(String token) {
    _userToken = token;
  }

  Future<dynamic> callLoginApi(
      String token, String lang, Map<String, String> data, String id) async {
    return _userRepository.loginApiCall(
      data,
    );
  }

  Future<dynamic> callRegisterAPi(
      String token, String lang, Map<String, String> data, String id) async {
    return _userRepository.registerApiCall(
      data,
    );
  }
}
