import 'package:flutter/material.dart';

class ExpandedExample extends StatelessWidget {
  const ExpandedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 100,
            width: 200,
            color: Colors.blue,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            // height: 100,
            width: 200,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
