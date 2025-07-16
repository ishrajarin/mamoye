import 'package:flutter/material.dart';
import 'package:mamoyee/onboarding_Screens/splash_screen.dart';
import 'package:mamoyee/screens/appointments_screen.dart';
import 'package:mamoyee/screens/q&a_screen.dart';
import 'onboarding_Screens/onboarding_screen1.dart';
import 'screens/home_screen.dart';
import 'package:mamoyee/meditation/meditation_screen.dart';
import 'screens/breathing_screen.dart';
import 'screens/diary_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/notification_screen.dart';
import 'screens/diet_screen.dart';
import 'screens/mood_screen.dart';
import 'screens/privacy_policy_screen.dart';
import 'screens/help_support_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const SplashScreen(),
  '/onboarding1': (context) => OnboardingScreen1(),
  '/home': (context) => HomeScreen(),
  '/meditation': (context) => MeditationScreen(),
  '/breathing': (context) => BreathingScreen(),
  '/diary': (context) => DiaryScreen(),
  '/profile': (context) => ProfileScreen(),
  '/settings': (context) => SettingsScreen(),
  '/notifications': (context) => NotificationScreen(),
  '/diet': (context) => DietScreen(),
  '/appointments': (context) => AppointmentsScreen(),
  '/mood': (context) => MoodTrackerScreen(),
  '/qa': (context) => QAScreen(),
  '/privacy': (context) => PrivacyPolicyScreen(),
  '/help': (context) => HelpSupportScreen(),
};
