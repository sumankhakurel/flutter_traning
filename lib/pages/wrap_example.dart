import 'package:demo2/model/profilemodel.dart';
import 'package:demo2/pages/stack_ui_design.dart';
import 'package:demo2/widgets/profilecard.dart';
import 'package:flutter/material.dart';

class WrapExample extends StatelessWidget {
  const WrapExample({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Profilemodel> profiledata = [
      Profilemodel(
          name: "Apple",
          colour: Colors.blueAccent,
          icon: Icons.verified_user_outlined),
      Profilemodel(
          name: "Kathmandu", colour: Colors.red, icon: Icons.location_city),
      Profilemodel(name: "Ram", colour: Colors.orange, icon: Icons.person),
      Profilemodel(name: "Book", colour: Colors.green, icon: Icons.book),
      Profilemodel(name: "Ball", colour: Colors.blueAccent, icon: Icons.ballot),
      Profilemodel(
          name: "Cat", colour: Colors.tealAccent, icon: Icons.animation),
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 10,
          runSpacing: 20,
          children: List.generate(
            profiledata.length,
            (index) => MenuCard(
              title: profiledata[index].name,
              color: profiledata[index].colour,
              icon: profiledata[index].icon,
            ),
          ),
        ),
      ),
    );
  }
}
