import 'package:flutter/material.dart';
import 'package:hiremi_task/ui/onboarding_screen.dart';
import 'package:hiremi_task/ui/screens/jobs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Screen',
      home: const OnboardingScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/jobs': (context) => const Jobs(),
      },
    );
  }
}
