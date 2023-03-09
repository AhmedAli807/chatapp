import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/google_provider.dart';
import 'package:untitled1/login_screen.dart';
import 'package:untitled1/register_screen.dart';
import 'package:untitled1/welcome.dart';
import 'chat_screen.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>GoogleProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Welcome(),
        builder: EasyLoading.init(),
      ),
    );
  }
}

