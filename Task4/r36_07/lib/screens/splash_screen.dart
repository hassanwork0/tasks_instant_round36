import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

    _animationController.forward();

    // Navigate to Home Screen (or onboarding screen 2 once implemented) after 3 seconds
    Timer(Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFA5A6A), // Vibrant coral/pink-red
              Color(0xFFE81B30), // Solid warm red
            ],
          ),
        ),
        child: Stack(
          children: [
            // Center Logo
            Align(
              alignment: Alignment(0, -0.15),
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Image.asset(
                    'assets/image/logo_foodgo.png',
                    width: size.width * 0.55,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            // Overlapping Burgers at the Bottom
            Positioned(
              left: -size.width * 0.12,
              bottom: -size.height * 0.02,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Image.asset(
                  'assets/image/burger_triple.png',
                  width: size.width * 0.62,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              right: -size.width * 0.08,
              bottom: -size.height * 0.04,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Image.asset(
                  'assets/image/burger_single.png',
                  width: size.width * 0.58,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
