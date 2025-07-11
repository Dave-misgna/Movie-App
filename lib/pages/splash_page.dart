import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  final VoidCallback onInitializationComplete;
  const SplashPage({super.key, required this.onInitializationComplete});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ethioflix",
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/letter-d.png'), fit: BoxFit.contain)),
      ),),
    );
  }
}
