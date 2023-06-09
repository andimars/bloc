import 'package:flutter_bloc/flutter_bloc.dart';

import './pages/home.dart';
import 'package:flutter/material.dart';

import 'bloc/theme.dart';

class Apps extends StatelessWidget {
  const Apps({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeBloc myTheme = context.read<ThemeBloc>();
    return BlocBuilder<ThemeBloc, bool>(
      bloc: myTheme,
      builder: (context, state) {
        return MaterialApp(
          theme: state == true ? ThemeData.light() : ThemeData.dark(),
          home: const HomePage(),
        );
      },
    );
  }
}
