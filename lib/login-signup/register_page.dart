import 'package:flutter/material.dart';
import 'package:mamoyee/login-signup/login_page.dart';
import 'package:mamoyee/theme/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreeToTerms = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),
              Center(child: Image.asset('assets/images/logo.png', height: 120)),

              const SizedBox(height: 16),
              const Center(
                child: Text('Maamoyee',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87)),
              ),
              const SizedBox(height: 8),
              const Center(
                  child: Text('Sign Up to continue...',
                      style: TextStyle(fontSize: 16, color: Colors.black54))),
              const SizedBox(height: 30),

              // Email Field
              _buildTextField(
                controller: _emailController,
                label: 'Email Address',
                icon: Icons.email,
              ),

              const SizedBox(height: 16),

              // Password Field
              _buildTextField(
                controller: _passwordController,
                label: 'Password',
                icon: Icons.lock,
                obscure: _obscurePassword,
                toggleObscure: () => setState(() => _obscurePassword = !_obscurePassword),
              ),

              const SizedBox(height: 16),

              // Confirm Password Field
              _buildTextField(
                controller: _confirmPasswordController,
                label: 'Confirm Password',
                icon: Icons.lock_outline,
                obscure: _obscureConfirmPassword,
                toggleObscure: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
              ),

              const SizedBox(height: 16),

              // Terms & Conditions
              Row(
                children: [
                  Checkbox(
                    value: _agreeToTerms,
                    activeColor: AppColors.primary,
                    onChanged: (value) => setState(() => _agreeToTerms = value ?? false),
                  ),
                  const Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'I agree to the '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(color: Colors.red),
                          ),
                          TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Terms & Conditions.',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Register Button (Gradient)
              SizedBox(
                height: 50,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.purple, AppColors.pink],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: _agreeToTerms
                        ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Registration successful! Please log in.")),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      disabledBackgroundColor: AppColors.border,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 16, color: AppColors.white),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscure = false,
    VoidCallback? toggleObscure,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [AppColors.purple, AppColors.pink]),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white),
          prefixIcon: Icon(icon, color: Colors.white),
          suffixIcon: toggleObscure != null
              ? IconButton(
            icon: Icon(obscure ? Icons.visibility_off : Icons.visibility, color: Colors.white),
            onPressed: toggleObscure,
          )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}
