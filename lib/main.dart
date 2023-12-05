import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_app_task/bloc/taskbloc.dart';
import 'package:bloc_app_task/screens/taskscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => TaskBloc(), // Initialisez le TaskBloc
        child:
            TaskScreen(), // Définission du TaskScreen comme l'écran d'accueil
      ),
    );
  }
}
