import 'package:flutter/material.dart';
import 'package:postech_id_card/views/illegal_body.dart';
import 'package:postech_id_card/views/main_body.dart';

AppBar getAppBar(int index) {
  switch (index) {
    case 0:
      return AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/postech_text.png', height: 33.6 / 2.25),
            const SizedBox(width: 14),
            const Text(
              "모바일 학생증",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        elevation: .0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
      );
    case 1:
      return AppBar(
        title: const Text(
          "사용 내역",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: .0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
      );
    case 2:
      return AppBar(
        title: const Text(
          "학생증 관리",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: .0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
      );
    case 3:
      return AppBar(
        title: const Text(
          "설정",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: .0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
      );
    default:
      return AppBar(
        title: const Text(
          "ILLEGAL APPROACH",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: .0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
      );
  }
}

Widget getBody(int index) {
  switch (index) {
    case 0:
      return const MainBody();
    case 1:
    case 2:
    case 3:
    default:
      return const IllegalBody();
  }
}
