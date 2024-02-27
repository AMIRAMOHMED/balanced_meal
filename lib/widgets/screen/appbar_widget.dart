import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  const AppBarWidget({Key? key, required this.text}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text),
      backgroundColor: Colors.white, // or any color you prefer
    );
  }
}
