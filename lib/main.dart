import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'package:your_app/screens/task_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen(),
      routes: {
        '/tasks': (context) => TaskListScreen(),
      },
    );
  }
}

