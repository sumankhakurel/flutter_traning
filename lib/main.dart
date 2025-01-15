import 'package:demo2/core/apppallet.dart';
import 'package:demo2/core/theme/theme.dart';
import 'package:demo2/cubit/user_cubit.dart';
import 'package:demo2/pages/api_Example/api_example.dart';
import 'package:demo2/pages/api_Example/cubit/post_cubit.dart';
import 'package:demo2/pages/api_example.dart';
import 'package:demo2/pages/cubit_example/first_page.dart';
import 'package:demo2/pages/cubit_example/theme_cubit/theme_cubit.dart';
import 'package:demo2/pages/hive_example/cubit/product_cubit.dart';
import 'package:demo2/pages/hive_example/hive_example.dart';
import 'package:demo2/pages/hive_example/model/product_model.dart';
import 'package:demo2/pages/navigation_example.dart';
import 'package:demo2/pages/shared_pref/shared_pref_example.dart';
import 'package:demo2/pages/textformfield_example.dart';
import 'package:demo2/pages/wrap_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  await Hive.openBox<ProductModel>('products');
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => UserCubit(),
      ),
      BlocProvider(
        create: (context) => PostCubit(),
      ),
      BlocProvider(
        create: (context) => ThemeCubit(),
      ),
      BlocProvider(
        create: (context) => ProductCubit()..loadProduct(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ThemeCubit>().loadTheme();
    return BlocSelector<ThemeCubit, ThemeState, bool>(
      selector: (state) {
        if (state is DarkThemeState) {
          return true;
        }
        return false;
      },
      builder: (context, isDarkTheme) {
        return MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: HiveExample(),
        );
      },
    );
  }
}
