import 'package:app_bloc/themes/my_themes.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(MyThemes.getTheme("default"));
  void changeTheme({required String theme}) {
    if (!MyThemes.genres.contains(theme)) {
      theme = "default";
    }
    emit(MyThemes.getTheme(theme));
  }
}
