import 'package:bookz_app/features/splash/presentation/widgets/splash_body_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SplashBodyWidget()),
    );
  }
}
