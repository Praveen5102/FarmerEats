import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../screens/introuduction.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBkkG7hF8qZh-95Idf6vRsiy5GxElPONWw",
          appId: "1:275462088117:android:5a3df8e42c14e5932ba5fc",
          messagingSenderId: "275462088117",
          projectId: "farmereats-80b67"
      ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Introduction Cards',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Nunito',
      ),
      home: const IntroductionScreen(),
    );
  }
}
