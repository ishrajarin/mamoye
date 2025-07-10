import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class HelpSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help & Support"),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              "Frequently Asked Questions",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildFaqTile("How do I reset my password?", "You can reset your password by going to the Profile section and selecting 'Forgot Password'."),
            _buildFaqTile("How do I update my profile?", "Navigate to the Profile section and tap on 'Edit Profile'."),
            _buildFaqTile("Is my data safe?", "Yes, your data is securely stored and encrypted."),
            const SizedBox(height: 24),
            const Text(
              "Contact Us",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ListTile(
              leading: const Icon(Icons.email, color: AppColors.purple),
              title: const Text("Email"),
              subtitle: const Text("support@mamoyee.com"),
            ),
            ListTile(
              leading: const Icon(Icons.phone, color: AppColors.purple),
              title: const Text("Phone"),
              subtitle: const Text("+880-123-456-789"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqTile(String question, String answer) {
    return ExpansionTile(
      title: Text(question, style: const TextStyle(fontWeight: FontWeight.w600)),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
          child: Text(answer),
        )
      ],
    );
  }
}
