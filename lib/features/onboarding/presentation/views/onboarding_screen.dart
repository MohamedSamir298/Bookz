import 'package:bookz_app/features/onboarding/presentation/widgets/onboarding_body_widget.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const OnboardingBodyWidget(),
    );
  }
}
