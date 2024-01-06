import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_application/widgets/custom_button.dart';
import 'package:test_application/widgets/custom_text_field.dart';
import 'package:test_application/widgets/header_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              onPressed: () {
                Navigator.pop(context);
              },
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomTextFieldWidget(
                        hintText: 'First Name',
                        onChanged: (value) {},
                        obscureText: false,
                        validator: (va) {},
                        isPassword: false,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomTextFieldWidget(
                        hintText: 'Last Name',
                        onChanged: (value) {},
                        obscureText: false,
                        validator: (va) {},
                        isPassword: false,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldWidget(
                  hintText: 'Eamil Address',
                  textInputType: TextInputType.emailAddress,
                  onChanged: (value) {},
                  obscureText: false,
                  validator: (va) {},
                  isPassword: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldWidget(
                  hintText: 'Password',
                  onChanged: (value) {},
                  obscureText: true,
                  validator: (va) {},
                  isPassword: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                          print(value.name);
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
                        onChanged: (value) {},
                        obscureText: false,
                        validator: (va) {},
                        isPassword: false,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldWidget(
                  hintText: 'Referral Code',
                  onChanged: (value) {},
                  obscureText: false,
                  validator: (va) {},
                  isPassword: false,
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
                      title: 'Register',
                      onPressedCallBack: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
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
                          recognizer: TapGestureRecognizer()..onTap = () {},
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
