import 'package:flutter/material.dart';
import 'package:test_application/widgets/custom_text_field.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Register',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomTextFieldWidget(
                hintText: 'First Name',
                onChanged: (value) {},
                obscureText: true,
                validator: (va) {},
                isPassword: true,
                
              )
            ],
          ),
        ),
      ),
    );
  }
}
