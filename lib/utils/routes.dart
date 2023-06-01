import 'package:bloc_structure_template/pages/splash/bloc/splash_bloc.dart';
import 'package:bloc_structure_template/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const routeSplash = '/splash';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeSplash:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => BlocProvider(
                  create: (create) => SplashBloc(),
                  child: const SplashScreen(),
                ));
    }
  }
}
