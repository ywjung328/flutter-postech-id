import 'package:flutter/material.dart';
import 'package:postech_id_card/model.dart';
import 'package:postech_id_card/widgets/colors.dart';

String stuName = "포닉스";
int stuId = 20220000;
String stuMajor = "컴퓨터공학과";

TextStyle txtStyle1 = TextStyle(color: postechGray);
TextStyle txtStyle2 =
    const TextStyle(color: Colors.black, fontWeight: FontWeight.bold);

Identification idBachelor = Identification(
  process: Process.bachelor,
  name: "포닉스",
  major: "컴퓨터공학과",
  studentId: 20188102,
);

Identification idMaster = Identification(
  process: Process.master,
  name: "포닉스",
  major: "컴퓨터공학과",
  studentId: 20222202,
);

Identification currentId = idBachelor;
bool isBachelor = true;
