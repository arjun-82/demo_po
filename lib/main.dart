import 'package:arjun_portfolio/portfolio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDmuPuWqyIjRSegCi7c_tj-HK-NYSZGhCU",
      authDomain: "portfolio-8ac6d.firebaseapp.com",
      projectId: "portfolio-8ac6d",
      storageBucket: "portfolio-8ac6d.appspot.com", 
      messagingSenderId: "353939471043",
      appId: "1:353939471043:web:0aa7b5a6153c213d554076",
    ),
  );

  runApp(const Portfolio());
}
