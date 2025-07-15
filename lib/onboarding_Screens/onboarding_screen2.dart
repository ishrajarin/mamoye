import 'package:flutter/material.dart';
import 'package:mamoyee/theme/app_colors.dart';
import 'package:mamoyee/onboarding_Screens/onboarding_screen3.dart';
import 'package:mamoyee/login-signup/login_page.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              /// Image + Texts
              Column(
                children: [
                  Image.asset(
                    'assets/images/2nd.png',
                    height: 250,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Track Your Emotional Well-being',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Easily monitor your mood, thoughts, and health. Maamoyee helps you recognize patterns and stay connected with how you feel—day by day.',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.lightText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),

              /// Page Indicator + Gradient Button
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.circle_outlined, size: 10, color: AppColors.border),
                      SizedBox(width: 6),
                      Icon(Icons.circle, size: 10, color: AppColors.primary),
                      SizedBox(width: 6),
                      Icon(Icons.circle_outlined, size: 10, color: AppColors.border),
                    ],
                  ),
                  const SizedBox(height: 25),

                  // Gradient-styled button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.purple, AppColors.pink],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OnboardingScreen3(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(fontSize: 16, color: AppColors.white),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
