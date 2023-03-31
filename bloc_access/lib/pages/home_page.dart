import 'package:bloc_builder/bloc/counter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'merah.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Counter mycounter = BlocProvider.of<Counter>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/other");
        },
        child: const Icon(Icons.arrow_forward),
      ),
      appBar: AppBar(
        title: const Center(child: Text('BLOC ACCESS')),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Material(
              color: Colors.green,
              child: InkWell(
                onTap: () {
                  //decrement
                  mycounter.decrement();
                },
                child: const SizedBox(
                  height: 100,
                  width: 100,
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const MerahWidget(),
            Material(
              color: Colors.blue,
              child: InkWell(
                onTap: () {
                  //increment

                  mycounter.increment();
                },
                child: const SizedBox(
                  height: 100,
                  width: 100,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
