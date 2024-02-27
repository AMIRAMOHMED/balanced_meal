import 'package:flutter/material.dart';

class CustomeTextFormFeild extends StatelessWidget {
  const CustomeTextFormFeild({
    Key? key,
    required this.textController,
    required this.foucseController,
    required this.onFeildFun,
    required this.hintText,
    required this.suffixText,
    required this.textInPutAction,
  }) : super(key: key);

  final FocusNode foucseController;
  final Function(String) onFeildFun;
  final String hintText, suffixText;
  final TextEditingController textController;
  final TextInputAction textInPutAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      focusNode: foucseController,
      onFieldSubmitted: onFeildFun,
      textInputAction: textInPutAction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Value cannot be empty";
        } else if (value.length < 2) {
          return "Value must be at least two characters";
        } else if (value.length > 5) {
          return "Value cannot exceed five characters";
        }
        return null;
      },
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFEAECF0),
          ),
        ),
        hintText: hintText,
        suffix: Text(suffixText),
        filled: true,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFEAECF0),
          ),
        ),
        fillColor: Colors.white,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFEAECF0)),
        ),
      ),
    );
  }
}
