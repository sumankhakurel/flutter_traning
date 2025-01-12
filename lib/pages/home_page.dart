import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String name;
  final String password;
  const HomePage({
    super.key,
    required this.name,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Home Page', style: TextStyle(color: Colors.white)),
        leading: Icon(
          Icons.security_update_good_sharp,
          color: Colors.white,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Notifications clicked')),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name : $name"),
            Text("Password: $password"),
          ],
        ),
      ),
    );
  }
}
