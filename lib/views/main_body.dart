import 'package:flutter/material.dart';

import '../info.dart';
import '../widgets/colors.dart';
import '../widgets/id_card.dart';

class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final Curve _curve = Curves.easeInOutCubic;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Center(
                child: Container(
                  width: 192,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(200.0),
                  ),
                ),
              ),
              SlideTransition(
                position: Tween<Offset>(
                        begin: Offset(-48 / width, .0),
                        end: Offset(48 / width, .0))
                    .animate(
                        CurvedAnimation(parent: _controller, curve: _curve)),
                child: Center(
                  child: Container(
                    width: 96 + 2,
                    height: 32 + 2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(200.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300.withOpacity(.7),
                          blurRadius: 8.0,
                          spreadRadius: 6.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) => SizedBox(
                        width: 96,
                        height: 32,
                        child: Center(
                          child: Text(
                            "학부",
                            style: TextStyle(
                              color: ColorTween(
                                      begin: Colors.black,
                                      end: Colors.grey.shade500)
                                  .evaluate(CurvedAnimation(
                                      parent: _controller, curve: _curve)),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      isBachelor = true;
                      _controller.reverse();
                    },
                  ),
                  GestureDetector(
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) => SizedBox(
                        width: 96,
                        height: 32,
                        child: Center(
                          child: Text(
                            "대학원",
                            style: TextStyle(
                              color: ColorTween(
                                      begin: Colors.grey.shade500,
                                      end: Colors.black)
                                  .evaluate(CurvedAnimation(
                                      parent: _controller, curve: _curve)),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      isBachelor = false;
                      _controller.forward();
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 72.0),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) => Stack(
              children: [
                FadeTransition(
                  opacity: Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
                      parent: _controller,
                      curve: Interval(.0, .5, curve: _curve.flipped))),
                  child: IdCard(
                    bgColor: postechRed,
                    id: idBachelor,
                  ),
                ),
                FadeTransition(
                  opacity: CurvedAnimation(
                      parent: _controller,
                      curve: Interval(.5, 1.0, curve: _curve)),
                  child: IdCard(
                    bgColor: postechYellow,
                    id: idMaster,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 96.0),
          const Text("아따 귀찮아라"),
        ],
      ),
    );
  }
}
