class UserBloc {
  String _userToken = '';

  static final UserBloc _bloc = UserBloc._constructor();

  factory UserBloc() => _bloc;

  UserBloc._constructor();

  //User Token
  String getUserToken() {
    return _userToken;
  }

  setUserToken(String token) {
    _userToken = token;
  }
  
}
