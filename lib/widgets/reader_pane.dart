import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../states/states.dart';
import '../styles/styles.dart';

/// Main pane for rendering text.
class ReaderPane extends StatelessWidget {

  const ReaderPane({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        top: 10,
        right: AppInsets.horizontal,
        bottom: 30,
        left: AppInsets.horizontal,
      ),
      child: BlocBuilder<ReaderSettingsCubit, ReaderSettings>(
        builder: (context, readerSettings) {
          return BlocBuilder<ReaderSelectionCubit, ReaderSelection?>(
            builder: (context, readerSelection) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: readerSelection?.renderText(readerSettings) ?? [],
              );
            },
          );
        },
      ),
    );
  }
}
