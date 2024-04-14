import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../states/states.dart';
import '../styles/styles.dart';

class ReaderSettingsCard extends StatelessWidget {

  const ReaderSettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 20,
      ),
      decoration: const BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.zero,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ReaderSettingsTable(),
          IconButton(
            icon: const Icon(Icons.close),
            iconSize: AppFontSizes.closeButton,
            padding: const EdgeInsets
              .symmetric(vertical: 20),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class ReaderSettingsTable extends StatelessWidget {

  const ReaderSettingsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReaderSettingsCubit, ReaderSettings>(
      builder: (context, readerSettings) {

        final ReaderSettingsCubit cubit = context
          .read<ReaderSettingsCubit>();

        final theme = Theme
          .of(context);

        final textTheme = theme.textTheme;
        final color = textTheme.labelLarge?.color ?? AppColors.color;
        final bgColor = textTheme.labelLarge?.backgroundColor ?? AppColors.backgroundColor;

        const rowDecoration = BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Color(0xffcccccc),
            ),
          ),
        );

        Widget headerCell(String text) {
          return TableCell(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Text(
                text,
                style: textTheme.labelLarge,
              ),
            ),
          );
        }

        Widget dataCell(Widget child) {
          return TableCell(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
              ),
              child: child,
            ),
          );
        }

        ButtonStyle buttonStyle({bool selected=false}) {
          return ButtonStyle(
            side: MaterialStateProperty.all<BorderSide>(
              BorderSide(
                color: selected ? color : bgColor,
                width: selected ? 1 : 0,
              ),
            ),
            fixedSize: MaterialStateProperty.all<Size>(
              const Size.fromHeight(45),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        }

        Widget fontSizeIcon({double size=18}) {
          return Text(
            'A',
            style: TextStyle(
              fontSize: size,
              color: color,
              height: .8,
            ),
          );
        }

        return Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: FixedColumnWidth(120),
            1: FlexColumnWidth(),
          },
          children: [
            TableRow(
              decoration: rowDecoration,
              children: [
                headerCell('Font size'),
                dataCell(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        style: buttonStyle(
                          selected: readerSettings.fontSize == ReaderFontSizes.small,
                        ),
                        child: fontSizeIcon(),
                        onPressed: () {
                          cubit.setFontSize(ReaderFontSizes.small);
                        },
                      ),
                      TextButton(
                        style: buttonStyle(
                          selected: readerSettings.fontSize == ReaderFontSizes.medium,
                        ),
                        child: fontSizeIcon(size: 23),
                        onPressed: () {
                          cubit.setFontSize(ReaderFontSizes.medium);
                        },
                      ),
                      TextButton(
                        style: buttonStyle(
                          selected: readerSettings.fontSize == ReaderFontSizes.large,
                        ),
                        child: fontSizeIcon(size: 28),
                        onPressed: () {
                          cubit.setFontSize(ReaderFontSizes.large);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: rowDecoration,
              children: [
                headerCell('Font'),
                dataCell(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        style: buttonStyle(
                          selected: readerSettings.fontFamily == ReaderFontFamilies.modern,
                        ),
                        child: Text(
                          'Modern',
                          style: TextStyle(
                            color: color,
                            fontFamily: AppFonts.get(ReaderFontFamilies.modern),
                          ),
                        ),
                        onPressed: () {
                          cubit.setFontFamily(ReaderFontFamilies.modern);
                        },
                      ),
                      TextButton(
                        style: buttonStyle(
                          selected: readerSettings.fontFamily == ReaderFontFamilies.classic,
                        ),
                        child: Text(
                          'Classic',
                          style: TextStyle(
                            color: color,
                          ),
                        ),
                        onPressed: () {
                          cubit.setFontFamily(ReaderFontFamilies.classic);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: rowDecoration,
              children: [
                headerCell('Dark mode'),
                dataCell(const _DarkModeToggle()),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _DarkModeToggle extends StatefulWidget {

  const _DarkModeToggle();

  @override
  _DarkModeState createState() => _DarkModeState();
}

class _DarkModeState extends State<_DarkModeToggle> {

  @override
  Widget build(BuildContext context) {

    ReaderSettingsCubit readerSettingsCubit = context
      .read<ReaderSettingsCubit>();

    return Switch(
      value: readerSettingsCubit.state.darkMode,
      onChanged: (value) {
        setState(() {
          readerSettingsCubit.toggleDarkMode(value);
        });
      },
    );
  }
}
