import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFF8A8A), Color(0xFFE52030)],
          ),
        ),
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(seconds: 1),
          child: Stack(
            children: [
              const Center(
                child: Text(
                  'Foodgo',
                  style: TextStyle(
                    fontSize: 65,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'cursive',
                  ),
                ),
              ),
              Positioned(
                bottom: -90,
                left: -40,
                child: Image.asset(
                  'assets/burger_1.png',
                  width: screenWidth * 0.85,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                bottom: -45,
                right: 15,
                child: Image.asset(
                  'assets/burger_2.png',
                  width: screenWidth * 0.48,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
