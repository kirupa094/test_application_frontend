import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  const HeaderWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 120,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          bottom: -10,
          child: Image.asset(
            color: const Color.fromARGB(255, 16, 80, 120),
            'assets/images/bg_image.png',
            width: 120,
            height: 20,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
