import 'package:bloc_package_example/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit_counter.dart';

class IncDecPage extends StatefulWidget {
  const IncDecPage({super.key});

  @override
  State<IncDecPage> createState() => _IncDecPageState();
}

class _IncDecPageState extends State<IncDecPage> {
  @override
  Widget build(BuildContext context) {
    // final counterCubit = BlocProvider.of<CubitCounter>(context);
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterIncrement());
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Incremented by 1")));
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(
            height: 19,
          ),
          FloatingActionButton(
            onPressed: () {
              // counterCubit.decrement();
              counterBloc.add(CounterDecrement());
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Decremented by 1")));
            },
            tooltip: 'Increment',
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
