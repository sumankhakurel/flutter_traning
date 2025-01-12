import 'package:demo2/pages/stack_ui_design.dart';
import 'package:demo2/widgets/profilecard.dart';
import 'package:flutter/material.dart';

class ListviewExample extends StatelessWidget {
  const ListviewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('ListView Example')),
        body: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return MenuCard(
              title: '$index',
              color: Colors.teal,
              icon: Icons.group_add,
            );
          },
        ));
  }
}
