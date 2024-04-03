import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_swap/counter/counter.dart';


class HomeView extends StatelessWidget {

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          'This is a long string that will be broken over several lines. ' * 100,
          textAlign: TextAlign.justify,
        ),
      ),
      // body: Center(
      //   child: BlocBuilder<CounterCubit, int>(
      //     builder: (context, state) {
      //       return Text('$state', style: textTheme.displayMedium);
      //     },
      //   ),
      // ),
      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   children: <Widget>[
      //     FloatingActionButton(
      //       key: const Key('counterView_increment_floatingActionButton'),
      //       child: const Icon(Icons.add),
      //       onPressed: () => context.read<CounterCubit>().increment(),
      //     ),
      //     const SizedBox(height: 8),
      //     FloatingActionButton(
      //       key: const Key('counterView_decrement_floatingActionButton'),
      //       child: const Icon(Icons.remove),
      //       onPressed: () => context.read<CounterCubit>().decrement(),
      //     ),
      //   ],
      // ),
    );
  }
}
