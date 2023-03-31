import 'package:bloc_builder/bloc/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  Counter myCounter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Flutter Bloc - Bloc Listener',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocListener<Counter, int>(
              bloc: myCounter,
              listener: (context, state) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text('Ini Snackbar'),
                  ),
                );
              },
              listenWhen: (previous, current) {
                if (current == 10) {
                  return true;
                } else {
                  return false;
                }
              },
              child: BlocBuilder<Counter, int>(
                  bloc: myCounter,
                  builder: (context, state) {
                    return Text(
                      '$state',
                      style: const TextStyle(fontSize: 50),
                    );
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    myCounter.decrement();
                  },
                  icon: const Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    myCounter.increment();
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
