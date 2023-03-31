import 'package:bloc_builder/404/404.dart';
import 'package:bloc_builder/pages/home_page.dart';
import 'package:bloc_builder/pages/other_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter.dart';

// Generated Route Access
class MyRoute {
  final Counter mycounter = Counter();
  Route onRoute(settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: mycounter,
            child: const HomePage(),
          ),
        );
      case "/other":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: mycounter,
            child: const OtherPage(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundPage(),
        );
    }
  }
}
