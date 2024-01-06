import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onPressedCallBack;
  final bool isIcon;
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressedCallBack,
    this.isIcon = false,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
            SizedBox(
              width: isIcon ? 10 : 0,
            ),
            isIcon
                ? const Icon(
                    Icons.arrow_forward_sharp,
                    color: Colors.white,
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
