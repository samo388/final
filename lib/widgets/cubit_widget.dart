import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CubitWidgetWithText extends StatelessWidget {
  final Color clr;
  final String icon;
  final String txt;
  const CubitWidgetWithText({
    super.key,
    required this.clr,
    required this.icon,
    this.txt = 'Default',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
              height: 100,
              width: 100,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: clr,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: SvgPicture.asset(
                icon,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              txt,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
