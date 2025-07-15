import 'package:flutter/material.dart';
import 'package:mamoyee/theme/app_colors.dart';
import 'package:mamoyee/screens/home_screen.dart'; // ✅ Home screen import
import 'package:mamoyee/login-signup/register_page.dart'; // ✅ Register screen import

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),

            // Logo
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 140,
              ),
            ),

            const SizedBox(height: 10),

            // App Title and Subtitle
            const Text(
              'Maamoyee',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const Text(
              'Login as Patient',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 40),

            // Mobile Number Label
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Mobile Number", style: TextStyle(color: Colors.black87)),
            ),
            const SizedBox(height: 8),

            // Mobile Number Input
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.purple, AppColors.pink],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: '01XXXXXXXXX',
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  filled: true,
                  fillColor: Colors.transparent,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Password Label
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Password", style: TextStyle(color: Colors.black87)),
            ),
            const SizedBox(height: 8),

            // Password Input
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.purple, AppColors.pink],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextFormField(
                obscureText: _obscureText,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: '********',
                  hintStyle: const TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.white,
                    ),
                    onPressed: () => setState(() => _obscureText = !_obscureText),
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Forgot Password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {}, // TODO: Handle Forgot Password
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Gradient Log In Button -> Navigates to HomeScreen
            SizedBox(
              width: double.infinity,
              height: 50,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.purple, AppColors.pink],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>  HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Log In',
                    style: TextStyle(fontSize: 16, color: AppColors.white),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // SignUp Link to RegisterScreen
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don’t have an account? "),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterScreen()),
                    );
                  },
                  child: const Text(
                    "SignUp Now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
