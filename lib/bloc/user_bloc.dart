import 'package:rxdart/rxdart.dart';
import 'package:test_application/resource/repo/user_repository.dart';
import 'package:test_application/resource/repo/user_repository_impl.dart';
import 'package:test_application/resource/services/errors/network_error.dart';
import 'package:test_application/resource/services/errors/unauthenticated_error_response.dart';
import 'package:test_application/screens/profile/ui_state.dart';

class UserBloc {
  String _userToken = '';

  static final UserBloc _bloc = UserBloc._constructor();

  factory UserBloc() => _bloc;

  final UserRepository _userRepository;

  final BehaviorSubject<UIState> _profileInfoController;

  UserBloc._constructor()
      : _userRepository = UserRepositoryImpl(),
        _profileInfoController = BehaviorSubject<UIState>.seeded(IdleUIState());

  //User Token
  String getUserToken() {
    return _userToken;
  }

  setUserToken(String token) {
    _userToken = token;
  }

  Stream<UIState> get profileInfo => _profileInfoController.stream;

  Future<dynamic> callLoginApi(Map<String, String> data) async {
    return _userRepository.loginApiCall(
      data,
    );
  }

  Future<dynamic> callRegisterAPi(Map<String, String> data) async {
    return _userRepository.registerApiCall(
      data,
    );
  }

  getProfileInfo(String token) async {
    _profileInfoController.sink.add(LoadingUIState());
    try {
      var result =
          await _userRepository.getProfileInfo(token);
      _profileInfoController.sink.add(ResultUIState(result));
    } on UnAuthenticatedErrorResponse catch (e) {
      _profileInfoController.sink.add(UnAuthenticatedUIState(e.message));
    } on NetworkError catch (e) {
      _profileInfoController.sink.add(ErrorUIState(e.message));
    } catch (e) {
      _profileInfoController.sink.add(ErrorUIState(e.toString()));
    }
  }


}
