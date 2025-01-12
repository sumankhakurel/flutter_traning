import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class ImageDemo extends StatelessWidget {
  const ImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.black26,
            child: Image.asset("assets/images/4.png"),
          ),
          Icon(FeatherIcons.airplay),
          ElevatedButton(
              onPressed: () {
                print("Hello");
              },
              child: Text("Click me")),
          Mybutton(
            name: "sas",
          ),
          Mybutton(
            name: "aasa",
          ),
        ],
      ),
    );
  }
}

class Mybutton extends StatelessWidget {
  final String name;

  const Mybutton({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 200,
        width: 200,
        color: Colors.blue,
        child: Text(name),
      ),
    );
  }
}
