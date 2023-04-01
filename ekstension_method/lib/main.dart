import 'package:bloc_builder/bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './pages/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  UserBloc userBloc = UserBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => userBloc,
        child: HomePage(),
      ),
    );
  }
}
