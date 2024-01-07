class ProfileModel {
  final String firstName;
  final String lastName;
  final String mobileNumber;
  final String mobileCode;
  final String email;

  ProfileModel.fromParsedJson(Map<String, dynamic> result)
      : firstName = result['first_name'] ?? '',
        lastName = result['last_name'] ?? '',
        mobileNumber = result['mobile_number'] ?? '',
        mobileCode = result['mobile_code'] ?? '',
        email = result['email'] ?? '';
}
