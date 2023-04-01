import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './pages/home.dart';
import 'bloc/user_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => UserBloc(),
        child: const HomePage(),
      ),
    );
  }
}
