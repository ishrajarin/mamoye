import 'package:flutter/material.dart';
import 'package:mamoyee/theme/app_colors.dart';
import 'package:mamoyee/login-signup/login_page.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

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
                    style: TextStyle(color: AppColors.primary, fontSize: 16),
                  ),
                ),
              ),

              /// Image and Text
              Column(
                children: [
                  Image.asset(
                    'assets/images/3rd.png',
                    height: 250,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Real Support When It Matters Most',
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
                      'Maamoyee connects you with licensed professionals and a community of moms who understand. You’re never alone in this journey.',
                      style: TextStyle(fontSize: 14, color: AppColors.lightText),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Every small step counts. With the right support, healing is possible—and you’re already on the way.',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primary,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),

              /// Page Indicator and Gradient Button
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.circle_outlined, size: 10, color: AppColors.border),
                      SizedBox(width: 6),
                      Icon(Icons.circle_outlined, size: 10, color: AppColors.border),
                      SizedBox(width: 6),
                      Icon(Icons.circle, size: 10, color: AppColors.primary),
                    ],
                  ),
                  const SizedBox(height: 25),

                  // Gradient-styled Get Started button
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
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
                          'Get Started',
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
