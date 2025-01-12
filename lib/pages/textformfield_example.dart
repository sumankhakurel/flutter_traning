import 'package:demo2/pages/gridview_example.dart';
import 'package:demo2/pages/home_page.dart';
import 'package:demo2/pages/navigation_example.dart';
import 'package:flutter/material.dart';

class TextformfieldExample extends StatefulWidget {
  const TextformfieldExample({super.key});

  @override
  State<TextformfieldExample> createState() => _TextformfieldExampleState();
}

class _TextformfieldExampleState extends State<TextformfieldExample> {
  final _namecontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();

    _namecontroller.dispose();
    _passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text('Login Page', style: TextStyle(color: Colors.white)),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _namecontroller,
                validator: (value) {
                  if (value == null || value == "") {
                    return "Value is required";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Enter Your Name",
                  // hintStyle: TextStyle()

                  label: Text("Full Name"),
                  // labelStyle: TextStyle()

                  fillColor: Colors.blue[50],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                controller: _passwordcontroller,
                decoration: InputDecoration(
                    hintText: "Enter Your Password",
                    // hintStyle: TextStyle()
                    label: Text("Password"),
                    // labelStyle: TextStyle()
                    fillColor: Colors.blue[50],
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  if (_formkey.currentState!.validate()) {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => GridviewExample(),
                    //     ));

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(
                          name: _namecontroller.text,
                          password: _passwordcontroller.text,
                        ),
                      ),
                      (route) => false,
                    );

                    // Navigator.pushAndRemoveUntil(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => NavigationExample()),
                    //   (route) => false,
                    // );
                  }
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //       duration: Duration(seconds: 1),
                  //       content: Text('Login clicked')),
                  // );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
