import 'package:flutter/material.dart';

// コンポーネント
import ' widgets /home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //変数
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JKN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'JKN'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //変数
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body
      body: HomeScreen(),
    );
  }
}
