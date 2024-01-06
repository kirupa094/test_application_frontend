import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final String hintText;
  final Function(String) onChanged;
  final bool obscureText;
  final String? Function(String?) validator;
  final TextAlign textAlign;
  final bool isPassword;
  final TextInputType textInputType; 
  const CustomTextFieldWidget({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.obscureText,
    required this.validator,
    this.textAlign = TextAlign.left,
    this.textInputType=TextInputType.text,
    required this.isPassword,
  }) : super(key: key);

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  late bool _obscureText;
  @override
  void initState() {
    _obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      onChanged: widget.onChanged,
      cursorColor: const Color(0xFF231F20),
      obscureText: _obscureText,
      textAlign: widget.textAlign,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        errorMaxLines: 3,
        errorStyle: const TextStyle(fontSize: 14, height: 1),
        suffixIconColor: const Color.fromARGB(255, 118, 118, 118),
        suffixIcon: widget.isPassword
            ? InkWell(
                child: Icon(
                  color: const Color.fromARGB(255, 118, 118, 118),
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                })
            : null,
        border: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
          borderSide: BorderSide(color: Color.fromARGB(255, 235, 235, 228), width: 2.0),
        ),
        filled: true,
        fillColor: Colors.white,
        labelText: widget.hintText,
        labelStyle: const TextStyle(
          color: Color(0xFF5D5D5D),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 235, 235, 228), width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Color.fromARGB(255, 204, 0, 0),
        )),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 204, 0, 0),
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
          borderSide: BorderSide(color: Color.fromARGB(255, 235, 235, 228), width: 2.0),
        ),
      ),
    );
  }
}
