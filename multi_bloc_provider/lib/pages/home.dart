import 'package:bloc_builder/bloc/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterBloc myCounter = context.read<CounterBloc>();
    ThemeBloc myTheme = context.read<ThemeBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'HOME',
            style: TextStyle(fontSize: 35),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<CounterBloc, int>(
              bloc: myCounter,
              builder: (context, state) {
                return Text(
                  '$state',
                  style: const TextStyle(fontSize: 50, color: Colors.red),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    myCounter.remove();
                  },
                  icon: const Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    myCounter.add();
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // memanggil bloc theme
          myTheme.changeTheme();
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
