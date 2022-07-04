import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:postech_id_card/model.dart';
import 'package:postech_id_card/widgets/colors.dart';
import 'package:postech_id_card/widgets/id_card.dart';
import 'package:postech_id_card/info.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
    */

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // priarySwatch: Colors.blue,
        primaryColor: postechRed,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  final Curve _curve = Curves.easeInOutCubic;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 750));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor:
      //     ColorTween(begin: Colors.white, end: postechGray).lerp(0.16),
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        /*
        title: Image.asset(
          'assets/images/postech_logo.png',
          height: AppBar().preferredSize.height * 0.25,
        ),
        */
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
      ),
      body: Center(
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
                          begin: Offset(-(48 + 1) / width, .0),
                          end: Offset((48 + 1) / width, .0))
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
                      child: SizedBox(
                        width: 96,
                        height: 32,
                        child: Center(
                          child: Text(
                            "학부",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        isBachelor = true;
                        _controller.reverse;
                        print(isBachelor);
                      },
                    ),
                    GestureDetector(
                      child: SizedBox(
                        width: 96,
                        height: 32,
                        child: Center(
                          child: Text(
                            "대학원",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        isBachelor = false;
                        _controller.forward;
                        print(isBachelor);
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 50.0),
            IdCard(
              bgColor: postechRed,
              id: idBachelor,
            ),
          ],
        ),
      ),
    );
  }
}
