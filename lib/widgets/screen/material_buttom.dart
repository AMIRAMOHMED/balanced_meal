import 'package:flutter/material.dart';

class MaterialButtom extends StatelessWidget {
  const MaterialButtom(
      {super.key,
      required this.text,
      required this.colorText,
      required this.colorButtom,
      required this.fun,
      required this.paddingHori,
      required this.paddingVer,
      required this.borderRadius});

  final double paddingHori, paddingVer, borderRadius;
  final Color colorText, colorButtom;
  final Function fun;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: colorButtom,
      padding:
          EdgeInsets.symmetric(horizontal: paddingHori, vertical: paddingVer),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      onPressed: () {
        fun();
      },
      child: Text(
        text,
        style: TextStyle(
          color: colorText,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
