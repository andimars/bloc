import 'package:bloc_builder/bloc/counter.dart';
import 'package:bloc_builder/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = context.read<UserBloc>();
    // Counter myCounter = context.read<Counter>(); // hanya membac 1x (pertama kali)
    // Counter myCounter = context.watch<Counter>(); // membaca berkali-kali (ketika state bloc berubah) membuild dari scaffold
    // String namaUser = context.select<UserBloc, String>(
    //   (value) => value.state['nama'],
    // );
    // int umurUser = context.select<UserBloc, int>(
    //   (value) => value.state['age'],
    // );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Builder(builder: (context) {
              String namaUser = context.select<UserBloc, String>(
                (value) => value.state['nama'],
              );
              return Text('Nama : $namaUser');
            }),
            Builder(builder: (context) {
              int umurUser = context.select<UserBloc, int>(
                (value) => value.state['age'],
              );
              return Text('Umur : $umurUser');
            }),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => userBloc.gantiUmur(
                    userBloc.state['age'] - 1,
                  ),
                  icon: const Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () => userBloc.gantiUmur(
                    userBloc.state['age'] + 1,
                  ),
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
