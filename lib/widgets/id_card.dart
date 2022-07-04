import 'package:flutter/material.dart';
import 'package:postech_id_card/model.dart';
import 'package:postech_id_card/widgets/colors.dart';
import 'package:postech_id_card/info.dart';

class IdCard extends StatefulWidget {
  final Color bgColor;
  final Identification id;

  const IdCard({Key? key, required this.bgColor, required this.id})
      : super(key: key);

  @override
  State<IdCard> createState() => _IdCardState();
}

class _IdCardState extends State<IdCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: width * .6,
          height: width * .6,
          decoration: BoxDecoration(
            color: widget.bgColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(width * .045),
              topRight: Radius.circular(width * .045),
            ),
            boxShadow: [
              BoxShadow(
                color: widget.bgColor.withOpacity(0.25),
                blurRadius: width * .15,
                spreadRadius: width * .015,
              ),
            ],
          ),
        ),
        Container(
          width: width * .6,
          height: width * .3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(width * .045),
              bottomRight: Radius.circular(width * .045),
            ),
            boxShadow: [
              BoxShadow(
                color: postechGray.withOpacity(0.2),
                blurRadius: width * .15,
                spreadRadius: width * .015,
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: "성명  ", style: txtStyle1),
                  TextSpan(text: "${widget.id.getName()}\n", style: txtStyle2),
                  TextSpan(text: "학번  ", style: txtStyle1),
                  TextSpan(text: "${widget.id.getId()}\n", style: txtStyle2),
                  TextSpan(text: "과정  ", style: txtStyle1),
                  TextSpan(
                      text: "${widget.id.getProcess().toStr}\n",
                      style: txtStyle2),
                  TextSpan(text: "학과  ", style: txtStyle1),
                  TextSpan(
                      text: widget.id.getMajor().toString(), style: txtStyle2),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
