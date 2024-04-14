import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_swap/repositories/repositories.dart';
import 'package:text_swap/states/states.dart';
import 'package:text_swap/styles/styles.dart';

class ReaderSelectionCubit extends Cubit<ReaderSelection?> {

  final TextRepository repository;

  ReaderSelectionCubit(this.repository) : super(null);

  select(int textID) async {

    emit(ReaderSelection(
      textID: textID,
      textData: await repository
        .getText(textID),
    ));
  }
}

class ReaderSelection {

  final int textID;
  final TextData textData;

  ReaderSelection({
    required this.textID,
    required this.textData,
  });

  List<Widget> renderText(ReaderSettings readerSettings) {

    final style = TextStyle(
      fontSize: readerSettings.fontSize,
      color: readerSettings.color,
      fontFamily: AppFonts
        .get(readerSettings.fontFamily),
    );

    final spacer = SizedBox(
      height: readerSettings.fontSize,
    );

    final List<Widget> paragraphs = textData.lines
      .map((it) => [
        RichText(
          text: TextSpan(
            text: it,
            style: style,
          ),
        ),
        spacer,
      ])
      .expand((it) => it)
      .toList();

    return [
      RichText(
        text: TextSpan(
          text: textData.heading,
          style: style.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: readerSettings.fontSize * 1.3,
          ),
        ),
      ),
      spacer,
      ...paragraphs,
    ];
  }
}
