import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocinternetconnectlostex/blocs/internetbloc/intenetbloc.dart';
import 'package:flutterblocinternetconnectlostex/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: MaterialApp(debugShowCheckedModeBanner: false,
        home: Homescreen(),
      ),
    );
  }
}

