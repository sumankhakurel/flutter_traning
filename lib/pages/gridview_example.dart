import 'package:demo2/pages/stack_ui_design.dart';
import 'package:demo2/widgets/profilecard.dart';
import 'package:flutter/material.dart';

class GridviewExample extends StatelessWidget {
  const GridviewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
            itemCount: 10,
            scrollDirection: Axis.vertical,
            // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //   maxCrossAxisExtent: 200,
            //   crossAxisSpacing: 10.0,
            //   mainAxisSpacing: 10.0,          // ),

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 2 / 1,
              mainAxisExtent: 100,
            ),
            itemBuilder: (context, index) => MenuCard(
                  title: '$index',
                  color: Colors.teal,
                  icon: Icons.group_add,
                )),
      ),
    );
  }
}
