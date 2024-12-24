import 'package:flutter/material.dart';

class EmergencyContactsPage extends StatelessWidget {
  const EmergencyContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Contacts'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildContactTile(
            name: 'Police',
            phone: '999',
            icon: Icons.local_police,
          ),
          _buildContactTile(
            name: 'Fire Service',
            phone: '9555555',
            icon: Icons.fire_extinguisher,
          ),
          _buildContactTile(
            name: 'Ambulance',
            phone: '12345',
            icon: Icons.local_hospital,
          ),
          _buildContactTile(
            name: 'Disaster Hotline',
            phone: '654321',
            icon: Icons.phone_in_talk,
          ),
        ],
      ),
    );
  }

  Widget _buildContactTile({
    required String name,
    required String phone,
    required IconData icon,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(name),
        subtitle: Text(phone),
        trailing: IconButton(
          icon: const Icon(Icons.phone, color: Colors.green),
          onPressed: () {
            // Integrate phone dialer functionality here
          },
        ),
      ),
    );
  }
}
