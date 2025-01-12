import 'package:demo2/core/apppallet.dart';
import 'package:demo2/core/theme/theme.dart';
import 'package:demo2/cubit/user_cubit.dart';
import 'package:demo2/pages/api_Example/api_example.dart';
import 'package:demo2/pages/api_Example/cubit/post_cubit.dart';
import 'package:demo2/pages/api_example.dart';
import 'package:demo2/pages/cubit_example/first_page.dart';
import 'package:demo2/pages/navigation_example.dart';
import 'package:demo2/pages/textformfield_example.dart';
import 'package:demo2/pages/wrap_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => UserCubit(),
      ),
      BlocProvider(
        create: (context) => PostCubit(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      // themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: ApiExample1(),
    );
  }
}
