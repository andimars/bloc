import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  Stream<int> countStream() async* {
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(
        const Duration(seconds: 1),
      );
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Rebuild');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream APP'),
      ),
      body: StreamBuilder(
        stream: countStream(),
        builder: (context, snapshot) {
          // cek kondisi data
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text(
                'Loading...',
                style: TextStyle(fontSize: 50),
              ),
            );
          } else {
            return Center(
              child: Text(
                '${snapshot.data}',
                style: const TextStyle(fontSize: 50),
              ),
            );
          }
        },
      ),
    );
  }
}
