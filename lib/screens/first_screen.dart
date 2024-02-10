import 'package:finalpro/widgets/counter_widget.dart';
import 'package:finalpro/widgets/cubit_widget.dart';
import 'package:flutter/material.dart';

class HomeScreenOne extends StatelessWidget {
  const HomeScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff2D2F41),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.safety_check_sharp,
            color: Colors.white,
            size: 100,
          ),
          CounterWidget(
            name: 'ahmed',
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(
                top: 50,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CubitWidgetWithText(
                    icon: 'assets/apple.svg',
                    clr: Colors.white,
                    txt: 'Apple',
                  ),
                  CubitWidgetWithText(
                    icon: 'assets/apple.svg',
                    clr: Colors.white,
                    txt: 'Apple',
                  ),
                  CubitWidgetWithText(
                    icon: 'assets/apple.svg',
                    clr: Colors.white,
                    txt: 'Apple',
                  ),
                  CubitWidgetWithText(
                    icon: 'assets/apple.svg',
                    clr: Colors.white,
                    txt: 'Apple',
                  ),
                  CubitWidgetWithText(
                    icon: 'assets/apple.svg',
                    clr: Colors.white,
                    txt: 'Apple',
                  ),
                  CubitWidgetWithText(
                    icon: 'assets/apple.svg',
                    clr: Colors.white,
                    txt: 'Apple',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
