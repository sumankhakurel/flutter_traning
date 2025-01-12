import 'package:demo2/pages/stack_ui_design.dart';
import 'package:demo2/pages/textformfield_example.dart';
import 'package:demo2/pages/wrap_example.dart';
import 'package:flutter/material.dart';

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentIndex = 0;

  final List<Widget> screens = [
    StackUiDesign(),
    TextformfieldExample(),
    WrapExample()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.usb_rounded),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stacked_bar_chart),
            label: 'Stack Example',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Wrap Example',
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
