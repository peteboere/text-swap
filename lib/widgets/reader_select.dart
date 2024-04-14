import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_swap/states/states.dart';

/// Dropdown for controlling text selection.
class ReaderSelect extends StatefulWidget {

  const ReaderSelect({super.key});

  @override
  ReaderSelectState createState() => ReaderSelectState();
}

class ReaderSelectState extends State<ReaderSelect> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReaderSelectionCubit, ReaderSelection?>(
      builder: (context, readerSelection) {

        final ReaderSelectionCubit cubit = context
          .read<ReaderSelectionCubit>();

        final textTheme = Theme
          .of(context).textTheme;

        return Container(
          height: 47,
          decoration: BoxDecoration(
            color: const Color(0xffebebe1),
            borderRadius: BorderRadius.circular(14),
          ),
          child: DropdownButton<int>(
            value: readerSelection?.textID,
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
            ),
            icon: const Padding(
              padding: EdgeInsets.only(
                left: 7,
              ),
              child: Icon(Icons.book_outlined),
            ),
            iconSize: 24,
            elevation: 16,
            dropdownColor: const Color(0xfffafaf5),
            alignment: AlignmentDirectional.centerEnd,
            style: textTheme.labelLarge,
            onChanged: (int? textID) {
              setState(() {
                cubit.select(textID ?? 1);
              });
            },
            items: const [
              DropdownMenuItem(
                value: 1,
                child: Text('Text 1'),
              ),
              DropdownMenuItem(
                value: 2,
                child: Text('Text 2'),
              ),
            ],
          ),
        );
      },
    );
  }
}
