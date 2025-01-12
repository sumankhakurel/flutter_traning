import 'package:flutter/material.dart';

class MediaquaryExample extends StatelessWidget {
  const MediaquaryExample({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text('MediaQuery Example')),
      body: Center(
        child: Text(
          'Screen Width: $screenWidth\nScreen Height: $screenHeight',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
