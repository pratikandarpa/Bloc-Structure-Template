import 'package:bloc_structure_template/pages/splash/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        if (state is SplashInitialState) {
          print("Initial state detected");
          BlocProvider.of<SplashBloc>(context).add( OpenScreenEvent());
        }
        return Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.blue,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Text(
                      'Bloc Template',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Center(
                child: Text(
                  'Welcome to Flutter',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    ),
    );
  }
}