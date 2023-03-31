import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

/*
- Basic Cubit
*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

// membuat class cubit dengan mengesktend package cubit
class CounterCubit extends Cubit<int> {
  CounterCubit({this.initialData = 0})
      : super(initialData); // redirrect constructor dengan paramenter optional

  int initialData;
  void tambahData() {
    emit(state + 1);
  }

  void kurangData() {
    emit(state - 1);
  }
}

class HomePage extends StatelessWidget {
  CounterCubit mycounter =
      CounterCubit(); // membuat variable yang menampung class CounterCubit()

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Cubit App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
              initialData: mycounter.initialData,
              stream: mycounter.stream,
              builder: (context, snapshot) {
                return Center(
                  child: Text(
                    '${snapshot.data}',
                    style: const TextStyle(fontSize: 50),
                  ),
                );
              }),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  mycounter.kurangData();
                },
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  mycounter.tambahData();
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
