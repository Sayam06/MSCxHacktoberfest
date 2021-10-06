import 'package:flutter/material.dart';
import 'package:task_1_zairza/screens/2_A.dart';
import 'package:task_1_zairza/screens/2_B.dart';
import 'package:task_1_zairza/screens/3.dart';
import 'package:task_1_zairza/screens/4.dart';
import 'package:task_1_zairza/screens/7.dart';
import 'package:task_1_zairza/screens/Signin.dart';
import 'package:task_1_zairza/screens/Signup.dart';
import 'package:task_1_zairza/modals/details.dart';
import 'package:task_1_zairza/screens/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final appDocDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  Hive.registerAdapter(DetailsAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ECommerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Page2B(),
    );
  }
}

