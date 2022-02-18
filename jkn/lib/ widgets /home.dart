import 'package:flutter/material.dart';
import 'package:jkn/components/drawer/custom_drawer.dart';
import 'package:jkn/plugins/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 背景色
      backgroundColor: HexColor('1c252e'),
      extendBodyBehindAppBar: true,
      // appBar
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      // drawer
      drawer: const CustomDrawer(),
      // body
      body: const Center(
        child: Text(
          'JKN',
          style: TextStyle(
            color: Colors.white,
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
