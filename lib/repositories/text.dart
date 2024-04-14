import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;

class TextRepository {

  Future<TextData> getText(int textID) async {

    var text = await rootBundle
      .loadString('assets/documents/$textID.txt');

    // Break the raw text data into lines.
    List<String> lines = text
      .trim()
      .split(RegExp(r'\n{2,}'))
      .map((String it) => it
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim())
      .toList();

    return TextData(
      heading: lines.first,
      lines: lines.sublist(1),
    );
  }
}

class TextData {

  final String heading;
  final List<String> lines;

  TextData({
    required this.heading,
    required this.lines,
  });
}
