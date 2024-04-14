import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:text_swap/styles/styles.dart';

class ReaderFontFamilies {
  static const String modern = AppFonts.sansSerif;
  static const String classic = AppFonts.serif;
}

class ReaderFontSizes {
  static const double small = 24;
  static const double medium = 32;
  static const double large = 36;
}

class ReaderSettings {

  double fontSize;
  String fontFamily;
  bool darkMode;

  ReaderSettings({
    required this.fontSize,
    required this.fontFamily,
    required this.darkMode,
  });

  ReaderSettings copyWith({
    double? fontSize,
    String? fontFamily,
    bool? darkMode,
  }) {
    return ReaderSettings(
      fontSize: fontSize ?? this.fontSize,
      fontFamily: fontFamily ?? this.fontFamily,
      darkMode: darkMode ?? this.darkMode,
    );
  }

  Color get color {
    return darkMode
      ? Colors.white
      : Colors.black;
  }

  Color get backgroundColor {
    return darkMode
      ? const Color(0xff121212)
      : Colors.white;
  }
}

class ReaderSettingsCubit extends Cubit<ReaderSettings> {

  ReaderSettingsCubit() : super(ReaderSettings(
    fontSize: ReaderFontSizes.medium,
    fontFamily: ReaderFontFamilies.modern,
    darkMode: false,
  ));

  void setFontSize(double fontSize) {
    emit(state.copyWith(
      fontSize: fontSize,
    ));
  }

  void setFontFamily(String fontFamily) {
    emit(state.copyWith(
      fontFamily: fontFamily,
    ));
  }

  void toggleDarkMode(bool toggle) {
    emit(state.copyWith(
      darkMode: toggle,
    ));
  }
}
