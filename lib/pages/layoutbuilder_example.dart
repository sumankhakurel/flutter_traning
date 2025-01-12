import 'package:flutter/material.dart';

class LayoutbuilderExample extends StatelessWidget {
  const LayoutbuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.minWidth > 600) {
          return Container(
              color: Colors.green, child: Center(child: Text('Wide Screen')));
        } else {
          return Container(
              color: Colors.blue, child: Center(child: Text('Narrow Screen')));
        }
      },
    );
  }
}
