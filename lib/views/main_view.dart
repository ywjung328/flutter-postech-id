import 'package:flutter/material.dart';
import 'package:postech_id_card/widgets/colors.dart';
import 'package:postech_id_card/widgets/widget_getter.dart';
import 'package:unicons/unicons.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final Curve _curve = Curves.easeInOutCubic;

  int _currentIndex = 0;
  Offset _currentOffset = Offset(.0, .0);
  Offset _targetOffset = Offset(.0, .0);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    void _onItemTap(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: getAppBar(_currentIndex),
      body: getBody(_currentIndex),
      bottomNavigationBar: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: width - 36,
              child: Divider(thickness: 1.0, color: Colors.grey.shade300),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: BottomNavigationBar(
                showUnselectedLabels: false,
                type: BottomNavigationBarType.fixed,
                elevation: .0,
                backgroundColor: Colors.transparent,
                unselectedItemColor: postechGray,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(UniconsLine.credit_card),
                    label: "메인",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(UniconsLine.history_alt),
                    label: "사용 내역",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(UniconsLine.files_landscapes_alt),
                    label: "학생증 관리",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(UniconsLine.elipsis_double_v_alt),
                    label: "설정",
                  ),
                ],
                currentIndex: _currentIndex,
                selectedItemColor: postechRed,
                onTap: (index) {
                  _targetOffset = Offset(index * 1.0, 0);
                  _controller.forward();
                  _currentOffset = _targetOffset;
                  _onItemTap(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
