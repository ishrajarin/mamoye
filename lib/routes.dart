import 'package:flutter/material.dart';
import 'package:mamoyee/screens/appointments_screen.dart'; 
import 'package:mamoyee/screens/q&a_screen.dart';
import 'onboarding_Screens/onboarding_screen1.dart';
import 'screens/home_screen.dart';
import 'screens/meditation_screen.dart';
import 'screens/breathing_screen.dart';
import 'screens/diary_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/notification_screen.dart';
import 'screens/diet_screen.dart';
import 'screens/my_mood_screen.dart';
import 'screens/privacy_policy_screen.dart';
import 'screens/help_support_screen.dart';

Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => OnboardingScreen1(),
  '/home': (context) => HomeScreen(),
  '/meditation': (context) => MeditationScreen(),
  '/breathing': (context) => BreathingScreen(),
  '/diary': (context) => DiaryScreen(),
  '/profile': (context) => ProfileScreen(),
  '/settings': (context) => SettingsScreen(),
  '/notifications': (context) => NotificationScreen(),
  '/diet': (context) => DietScreen(),
  '/appointments': (context) => AppointmentsScreen(),
  '/mood': (context) => MyMoodScreen(),
  '/qa': (context) => QAScreen(),
  '/privacy': (context) => PrivacyPolicyScreen(),
  '/help': (context) => HelpSupportScreen(),
};
