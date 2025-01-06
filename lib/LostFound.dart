import 'package:flutter/material.dart';
import 'report_lost_person_page.dart';

class LostAndFoundPage extends StatelessWidget {
  const LostAndFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mock data for demonstration
    final List<Map<String, String>> lostPeople = [
      {'name': 'John Doe', 'details': 'Last seen near Central Park.'},
      {'name': 'Jane Smith', 'details': 'Reported missing on Jan 2, 2025.'},
      {'name': 'Rahim Khan', 'details': 'Lost during a flood evacuation.'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lost & Found'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lost Persons',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade700,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: lostPeople.length,
                itemBuilder: (context, index) {
                  final person = lostPeople[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        person['name']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(person['details']!),
                      trailing: Icon(
                        Icons.info_outline,
                        color: Colors.green.shade700,
                      ),
                      onTap: () {
                        // Placeholder for a detailed page
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Details for ${person['name']}'),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to the "Report Lost Person" form page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReportLostPersonPage(),
                  ),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('Report Lost Person'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



