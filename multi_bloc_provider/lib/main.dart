import 'package:bloc_builder/bloc/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'bloc/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final CounterBloc myCounter = CounterBloc();
  final ThemeBloc myTheme = ThemeBloc();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => CounterBloc(),
      ),
      BlocProvider(
        create: (context) => ThemeBloc(),
      ),
    ], child: Apps()

        // BlocBuilder<ThemeBloc, bool>(
        //   bloc: myTheme,
        //   builder: (context, state) {
        //     return MaterialApp(
        //       theme: state == true ? ThemeData.light() : ThemeData.dark(),
        //       debugShowCheckedModeBanner: false,
        //       home: BlocProvider(
        //         create: (context) => CounterBloc(),
        //         child: HomePage(),
        //       ),
        //     );
        //   },
        // ),
        );

    // return BlocProvider(
    //   create: (context) => myTheme,
    //   child: BlocBuilder<ThemeBloc, bool>(
    //     bloc: myTheme,
    //     builder: (context, state) {
    //       return MaterialApp(
    //         theme: state == true ? ThemeData.light() : ThemeData.dark(),
    //         debugShowCheckedModeBanner: false,
    //         home: BlocProvider(
    //           create: (context) => CounterBloc(),
    //           child: HomePage(),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
