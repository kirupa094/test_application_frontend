import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_application/resource/provider/provider.dart';
import 'package:test_application/screens/auth/register_screen.dart';
import 'package:test_application/screens/on_board/on_board_screen.dart';
import 'package:test_application/screens/profile/profile_screen.dart';
import 'package:test_application/utils/custom_function.dart';
import 'package:test_application/widgets/custom_button.dart';
import 'package:test_application/widgets/custom_snack_bar.dart';
import 'package:test_application/widgets/custom_text_field.dart';
import 'package:test_application/widgets/header_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email = '';
  late String password = '';
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
                const HeaderWidget(
                  title: 'Login',
                  width: 80,
                ),
                const SizedBox(
                  height: 15,
                ),
                loginForm(),
                const SizedBox(
                  height: 20,
                ),
                loginAccountText()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginForm() {
    return Form(
      key: _form,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomTextFieldWidget(
            hintText: 'Phone number or email',
            obscureText: false,
            isPassword: false,
            validator: (value) {
              if (!CustomFunction.isNotEmpty(value!)) {
                return "Email or mobile Number Can't be empty";
              } else if (!CustomFunction.validateNumberOnly(value) &&
                  !CustomFunction.isValidEmail(value)) {
                return 'Enter valid email';
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
            height: 4,
          ),
          const Text(
            'Enter mobile number without leading + or 00 or country code',
            style: TextStyle(
              color: Color(0xFF5D5D5D),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Forgot Your Password?',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF5D5D5D),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CustomButton(
                    isIcon: true,
                    title: 'SIGN IN',
                    onPressedCallBack: () => {
                      if (_form.currentState!.validate()) {callLoginApi()}
                    },
                  ),
                  Positioned(
                    child: isLoading
                        ? const Center(
                            child: SizedBox(
                              width: 25,
                              height: 25,
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : const SizedBox.shrink(),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget loginAccountText() {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            const TextSpan(
              text: 'Do not have an account? ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF5D5D5D),
              ),
            ),
            TextSpan(
              text: 'Register ',
              recognizer: TapGestureRecognizer()
                ..onTap = () => navigateToRegisterScreen(context),
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

  void navigateToRegisterScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterScreen()),
    );
  }

  void navigateToOnboardScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const OnBoardScreen()),
    );
  }

  void callLoginApi() async {
    setState(() {
      isLoading = true;
    });

    final userBloc = Provider.of(context).userBloc;

    Map<String, String> loginData = {
      'email': email,
      'password': password,
    };

    try {
      await userBloc
          .callLoginApi(
            loginData,
          )
          .then((value) => {
                userBloc.setUserToken(value),
                setState(() {
                  isLoading = false;
                }),
                userBloc.getProfileInfo(value),
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
