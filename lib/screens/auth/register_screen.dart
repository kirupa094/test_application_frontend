import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_application/resource/provider/provider.dart';
import 'package:test_application/screens/auth/login_screen.dart';
import 'package:test_application/screens/on_board/on_board_screen.dart';
import 'package:test_application/screens/profile/profile_screen.dart';
import 'package:test_application/utils/custom_function.dart';
import 'package:test_application/widgets/custom_button.dart';
import 'package:test_application/widgets/custom_snack_bar.dart';
import 'package:test_application/widgets/custom_text_field.dart';
import 'package:test_application/widgets/header_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late String firstName = '';
  late String lastName = '';
  late String email = '';
  late String password = '';
  late String mobileNumber = '';
  late String countrycode = '';
  late String referralCode = '';
  bool isLoading = false;

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () => navigateToOnboardScreen(context),
              padding:
                  const EdgeInsets.only(right: 15, left: 0, top: 15, bottom: 0),
              color: Colors.black,
              iconSize: 32,
              icon: const Icon(Icons.close),
            )
          ],
        ),
        body: Container(
          margin: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderWidget(title: 'Register'),
                const SizedBox(
                  height: 15,
                ),
                registerForm(),
                const SizedBox(
                  height: 20,
                ),
                alreadyHaveAccountText()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget registerForm() {
    return Form(
      key: _form,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CustomTextFieldWidget(
                  hintText: 'First Name',
                  obscureText: false,
                  validator: (value) {
                    if (!CustomFunction.isNotEmpty(value!)) {
                      return "First Name Can't be empty";
                    }
                    return null;
                  },
                  onChanged: (fName) {
                    setState(() {
                      firstName = fName;
                    });
                  },
                  isPassword: false,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: CustomTextFieldWidget(
                  hintText: 'Last Name',
                  obscureText: false,
                  isPassword: false,
                  validator: (value) {
                    if (!CustomFunction.isNotEmpty(value!)) {
                      return "Last Name Can't be empty";
                    }
                    return null;
                  },
                  onChanged: (fName) {
                    setState(() {
                      lastName = fName;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFieldWidget(
            hintText: 'Email Address',
            textInputType: TextInputType.emailAddress,
            obscureText: false,
            isPassword: false,
            validator: (value) {
              if (!CustomFunction.isNotEmpty(value!)) {
                return "Email Can't be empty";
              } else if (!CustomFunction.isValidEmail(value)) {
                return "Enter valid email";
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFieldWidget(
            hintText: 'Password',
            obscureText: true,
            isPassword: true,
            validator: (value) {
              if (!CustomFunction.isNotEmpty(value!)) {
                return "Password Can't be empty";
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.5,
                      color: Color.fromARGB(255, 235, 235, 228),
                    ),
                  ),
                ),
                child: CountryCodePicker(
                  flagWidth: 25,
                  onChanged: (value) {
                    setState(() {
                      countrycode = value.code!;
                    });
                  },
                  showDropDownButton: true,
                  textStyle: const TextStyle(color: Colors.black),
                  initialSelection: 'United Kingdom',
                  showCountryOnly: false,
                  showOnlyCountryWhenClosed: false,
                  alignLeft: false,
                  padding: const EdgeInsets.all(0),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: CustomTextFieldWidget(
                  textInputType: TextInputType.number,
                  hintText: 'Mobile',
                  obscureText: false,
                  isPassword: false,
                  validator: (value) {
                    if (!CustomFunction.isNotEmpty(value!)) {
                      return "Mobile Number Can't be empty";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      mobileNumber = value;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFieldWidget(
            hintText: 'Referral Code',
            obscureText: false,
            isPassword: false,
            validator: (value) {
              if (!CustomFunction.isNotEmpty(value!)) {
                return "Referral Code Can't be empty";
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                referralCode = value;
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          RichText(
            textAlign: TextAlign.left,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'By Clicking Sign up You agree to the following ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF5D5D5D),
                  ),
                ),
                TextSpan(
                  text: 'Terms and Conditions ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 16, 80, 120),
                  ),
                ),
                TextSpan(
                  text: 'without reservation.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF5D5D5D),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                isIcon: true,
                title: 'REGISTER',
                onPressedCallBack: () => {
                  if (_form.currentState!.validate()) {callRegisterApi()}
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget alreadyHaveAccountText() {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            const TextSpan(
              text: 'Already have an account? ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF5D5D5D),
              ),
            ),
            TextSpan(
              text: 'Login ',
              recognizer: TapGestureRecognizer()
                ..onTap = () => navigateToLoginScreen(context),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 16, 80, 120),
              ),
            ),
            const TextSpan(
              text: 'now',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF5D5D5D),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToLoginScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  void navigateToOnboardScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const OnBoardScreen()),
    );
  }

  void callRegisterApi() async {
    setState(() {
      isLoading = true;
    });

    final userBloc = Provider.of(context).userBloc;

    Map<String, String> registerData = {
      'email': email,
      'password': password,
      "first_name": firstName,
      "last_name": lastName,
      "mobile_number": mobileNumber,
      "referral_code": referralCode,
    };

    try {
      await userBloc
          .callRegisterAPi(
            registerData,
          )
          .then((value) => {
                userBloc.setUserToken(value),
                setState(() {
                  isLoading = false;
                }),
                userBloc.getProfileInfo(userBloc.getUserToken()),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                ),
              });
    } catch (e) {
      debugPrint('Error: $e');
      setState(() {
        isLoading = false;
      });
      _showValidationSnackBar(e.toString());
    }
  }

  void _showValidationSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: CustomSnackBar(error: message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
