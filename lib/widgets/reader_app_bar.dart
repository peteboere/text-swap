import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../states/states.dart';
import '../styles/styles.dart';
import './reader_select.dart';
import './settings.dart';

/// Customised app bar.
class ReaderAppBar extends StatelessWidget implements PreferredSizeWidget {

  const ReaderAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ReaderSettingsCubit, ReaderSettings>(
      builder: (context, readerSettings) {
        return AppBar(
          leading: Container(), // Disable default actions.
          backgroundColor: readerSettings.backgroundColor,
          actions: [
            Builder(
              builder: (context) => Padding(
                padding: const EdgeInsets.only(
                  left: 14,
                  right: 7,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    size: 35,
                    color: readerSettings.color,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 0,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.settings_outlined,
                  size: 31,
                  color: readerSettings.color,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const ReaderSettingsCard(),
                    barrierColor: Colors.transparent,
                    isScrollControlled: true,
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(
                right: AppInsets.horizontal,
              ),
              child: ReaderSelect(),
            ),
          ],
        );
      },
    );
  }
}
