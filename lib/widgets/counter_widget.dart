import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  final String name;
  const CounterWidget({super.key, required this.name});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int x = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    x--;
                  });
                },
                icon: const Icon(
                  CupertinoIcons.minus,
                  color: Colors.white,
                ),
              ),
              Text(
                x.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    x++;
                  });
                },
                icon: const Icon(
                  CupertinoIcons.add,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Text(
          widget.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
