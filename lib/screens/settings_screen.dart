import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkMode = false;
  String _language = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Gradient Header
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFE14AA7), Color(0xFFAB54EF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
            ),
            padding: const EdgeInsets.only(top: 48, left: 16, right: 16, bottom: 24),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 12),
                const Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Settings List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildSizedTile(
                  child: _buildTile(
                    Icons.person_outline,
                    "Profile",
                    "View or update your profile",
                    onTap: () => Navigator.pushNamed(context, "/profile"),
                  ),
                ),
                _buildSizedTile(
                  child: _buildTile(
                    Icons.language,
                    "Language",
                    _language,
                    onTap: _changeLanguage,
                  ),
                ),
                const SizedBox(height: 8),
                _buildSizedTile(
                  child: _buildSwitchTile(
                    icon: Icons.notifications_active,
                    title: "Enable Notifications",
                    value: _notificationsEnabled,
                    onChanged: (val) => setState(() => _notificationsEnabled = val),
                  ),
                ),
                _buildSizedTile(
                  child: _buildSwitchTile(
                    icon: Icons.dark_mode,
                    title: "Dark Mode",
                    value: _darkMode,
                    onChanged: (val) => setState(() => _darkMode = val),
                  ),
                ),
                const SizedBox(height: 8),
                _buildSizedTile(
                  child: _buildTile(
                    Icons.help_outline,
                    "Help & Support",
                    "FAQs and contact info",
                    onTap: () => Navigator.pushNamed(context, "/help"),
                  ),
                ),
                _buildSizedTile(
                  child: _buildTile(
                    Icons.privacy_tip,
                    "Privacy Policy",
                    "Read our privacy terms",
                    onTap: () => Navigator.pushNamed(context, "/privacy"),
                  ),
                ),
                _buildSizedTile(
                  child: _buildTile(
                    Icons.logout,
                    "Logout",
                    "Log out from your account",
                    color: Colors.red,
                    onTap: () => _confirmLogout(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSizedTile({required Widget child}) {
    return SizedBox(
      height: 80,
      child: child,
    );
  }

  Widget _buildTile(
      IconData icon,
      String title,
      String subtitle, {
        Color color = Colors.black87,
        VoidCallback? onTap,
      }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: AppColors.purple),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SwitchListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        secondary: Icon(icon, color: AppColors.purple),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        value: value,
        onChanged: onChanged,
        activeColor: AppColors.pink,
      ),
    );
  }

  void _changeLanguage() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "🌍 Select Language",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text("English"),
                onTap: () {
                  setState(() => _language = "English");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text("Bangla"),
                onTap: () {
                  setState(() => _language = "Bangla");
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Add logout logic here
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text("Logout", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
