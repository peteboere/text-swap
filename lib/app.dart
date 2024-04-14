import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './repositories/repositories.dart';
import './states/states.dart';
import './styles/styles.dart';
import './widgets/widgets.dart';

class App extends StatelessWidget {

  const App({super.key});

  @override
  Widget build(BuildContext context) {

    return RepositoryProvider(
      create: (context) => TextRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ReaderSettingsCubit>(
            create: (BuildContext context) => ReaderSettingsCubit(),
          ),
          BlocProvider<ReaderSelectionCubit>(
            create: (BuildContext context) {

              final textRepository = RepositoryProvider.of<TextRepository>(context);
              ReaderSelectionCubit cubit = ReaderSelectionCubit(textRepository);

              /*
               * Initialise text selection as
               * text loading is asynchronous.
               */
              cubit.select(1);

              return cubit;
            },
          ),
        ],
        child: MaterialApp(
          theme: baseTheme(),
          home: BlocBuilder<ReaderSettingsCubit, ReaderSettings>(
            builder: (context, readerSettings) {
              return Scaffold(
                appBar: const ReaderAppBar(),
                backgroundColor: readerSettings.backgroundColor,
                body: const ReaderPane(),
                drawer: const Profile(),
              );
            },
          ),
        ),
      ),
    );
  }
}
