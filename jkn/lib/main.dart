import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jkn/components/drawer/custom_drawer.dart';
import 'package:jkn/configs/colors.dart';
import 'package:jkn/plugins/color.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as cloud_firestore;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
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
  // 変数
  String? data = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 背景色
      backgroundColor: AppColor.backGroundColor,
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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              return ListTile(
                leading: Image.network(
                  document.get('img'),
                  fit: BoxFit.cover,
                ),
                title: Text(document.get('user')),
                subtitle: Text(document.get('msg')),
                isThreeLine: true,
                // onTap: () {},
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
