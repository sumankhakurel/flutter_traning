import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  Future<void> loadTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final isDarkTheme = prefs.getBool("theme") ?? false;
    emit(isDarkTheme ? DarkThemeState() : LightThemeState());
  }

  Future<void> toggleTheme() async {
    final isCurrentlyDark = state is DarkThemeState;
    final newTheme = isCurrentlyDark ? LightThemeState() : DarkThemeState();
    emit(newTheme);

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool("theme", !isCurrentlyDark);
  }
}
