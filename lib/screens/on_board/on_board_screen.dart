import 'package:flutter/material.dart';
import 'package:test_application/screens/auth/register_screen.dart';
import 'package:test_application/screens/on_board/carousel.dart';
import 'package:test_application/widgets/custom_button.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              topWidgets(),
              const Spacer(),
              const Carousel(),
              const SizedBox(
                height: 20,
              ),
              welcomeText(),
              const SizedBox(
                height: 14,
              ),
              bottomButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget topWidgets() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          color: const Color.fromARGB(255, 198, 80, 219),
          'assets/images/app_icon.png',
          width: 40,
          height: 40,
          fit: BoxFit.contain,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40.0,
              height: 40.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange,
              ),
              child: const Center(
                child: Text(
                  'EN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 40.0,
              height: 40.0,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.orange,
              ),
              child: const Center(
                child: Text(
                  'USD',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget welcomeText() {
    return const Text(
      'Welcome to User App',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color.fromARGB(255, 137, 134, 134),
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget bottomButton(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(
          title: 'LOGIN',
          onPressedCallBack: () {},
        ),
        CustomButton(
          title: 'REGISTER',
          onPressedCallBack: () => navigateToRegisterScreen(context),
        )
      ],
    );
  }

  void navigateToRegisterScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  const RegisterScreen()),
    );
  }
}
