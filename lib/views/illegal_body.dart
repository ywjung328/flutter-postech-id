import 'package:flutter/material.dart';

class IllegalBody extends StatelessWidget {
  const IllegalBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("This page has approached illegally,\n please report bug"),
    );
  }
}
