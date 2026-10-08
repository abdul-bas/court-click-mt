import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    @override
  void initState() {
    super.initState();
   // Future function to navigate to the next page
    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;

      Navigator.pushNamed(context, '/userName');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          // Netflix Logo Animation Using Lottie Json
          child: Lottie.asset('assets/lotties/Netflix Logo Swoop.json'),
        ),
      ),
    );
  }
}
