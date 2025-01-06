import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SectionHeader(title: "Account Settings"),
          _buildListTile(
            icon: Icons.person,
            title: "Edit Profile",
            onTap: () {
              // Navigate to Edit Profile Page
            },
          ),
          _buildListTile(
            icon: Icons.lock,
            title: "Change Password",
            onTap: () {
              // Navigate to Change Password Page
            },
          ),
          _buildListTile(
            icon: Icons.logout,
            title: "Logout",
            onTap: () {
              // Handle Logout Logic
            },
          ),
          const SizedBox(height: 20),
          const SectionHeader(title: "App Preferences"),
          _buildSwitchTile(
            icon: Icons.notifications,
            title: "Notifications",
            value: true,
            onChanged: (value) {
              // Toggle Notifications
            },
          ),
          _buildListTile(
            icon: Icons.palette,
            title: "Theme",
            onTap: () {
              // Open Theme Selection Dialog
            },
          ),
          _buildListTile(
            icon: Icons.language,
            title: "Language",
            onTap: () {
              // Open Language Selection Page
            },
          ),
          const SizedBox(height: 20),
          const SectionHeader(title: "Privacy & Security"),
          _buildListTile(
            icon: Icons.privacy_tip,
            title: "Manage Permissions",
            onTap: () {
              // Navigate to Permissions Page
            },
          ),
          _buildListTile(
            icon: Icons.policy,
            title: "Privacy Policy",
            onTap: () {
              // Show Privacy Policy
            },
          ),
          _buildListTile(
            icon: Icons.rule,
            title: "Terms & Conditions",
            onTap: () {
              // Show Terms & Conditions
            },
          ),
          const SizedBox(height: 20),
          const SectionHeader(title: "Support & Help"),
          _buildListTile(
            icon: Icons.help,
            title: "FAQs",
            onTap: () {
              // Navigate to FAQs Page
            },
          ),
          _buildListTile(
            icon: Icons.contact_support,
            title: "Contact Support",
            onTap: () {
              // Navigate to Contact Support Page
            },
          ),
          const SizedBox(height: 20),
          const SectionHeader(title: "About"),
          _buildListTile(
            icon: Icons.info,
            title: "About the App",
            onTap: () {
              // Show About the App Page
            },
          ),
          ListTile(
            leading: const Icon(Icons.code),
            title: const Text("App Version"),
            subtitle: const Text("1.0.0"),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile(
      secondary: Icon(icon, color: Colors.green),
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
    );
  }
}
