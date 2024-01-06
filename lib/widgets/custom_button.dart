import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onPressedCallBack;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressedCallBack,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressedCallBack();
      },
      child: Container(
        decoration: ShapeDecoration(
          color: const Color.fromARGB(255, 16, 80, 120),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
        child: Text(
          textAlign: TextAlign.center,
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}
