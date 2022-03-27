import 'package:flutter/material.dart';
import 'package:plant_disease_detector/screens/upload-screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Plant Disease Detector',
      home: UploadScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


