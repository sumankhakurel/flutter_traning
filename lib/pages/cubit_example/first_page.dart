import 'package:demo2/cubit/user_cubit.dart';
import 'package:demo2/pages/cubit_example/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final _namecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _namecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
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
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<UserCubit>().updateUser(_namecontroller.text);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("User Added")));
                  }
                },
                child: Text("Save Data")),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage(),
                      ));
                },
                child: Text("See Data")),
          ],
        ),
      ),
    );
  }
}
