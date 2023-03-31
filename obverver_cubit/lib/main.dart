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

  int? current;
  int? nextCurrent;

  void tambahData() {
    emit(state + 1);
  }

  void kurangData() {
    emit(state - 1);
  }

// memantau perubahan state dengan fitur observer pada Bloc
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    // memantau perubahan widgetnya
    print(change);
    current = change.currentState;
    nextCurrent = change.nextState;
  }

// memantau terjadi error
  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
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
                  child: Column(
                    children: [
                      Text(
                        '${snapshot.data}',
                        style: const TextStyle(fontSize: 50),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Current : ${mycounter.current}',
                        style: const TextStyle(fontSize: 50),
                      ),
                      Text(
                        'Next : ${mycounter.nextCurrent}',
                        style: const TextStyle(fontSize: 50),
                      ),
                    ],
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
