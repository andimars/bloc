import 'package:bloc_builder/routes/route.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final router = MyRoute();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,

      // Named Route Access :
      // initialRoute: "/",
      // routes: {
      //   "/": (context) => BlocProvider.value(
      //         value: mycounter,
      //         child: const HomePage(),
      //       ),
      //   "/other": (context) => BlocProvider.value(
      //         value: mycounter,
      //         child: const OtherPage(),
      //       ),
      // },
      onGenerateRoute: router.onRoute,
    );
  }
}
