import 'package:demo2/pages/cubit_example/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SharedPrefExample extends StatelessWidget {
  const SharedPrefExample({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Theme Mode"),
        centerTitle: true,
      ),
      backgroundColor: isDarkTheme ? Colors.black : Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(isDarkTheme ? "Dark Theme" : "Light Theme"),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  context.read<ThemeCubit>().toggleTheme();
                },
                child: Text("Change Theme Mode")),
          ],
        ),
      ),
    );
  }
}
