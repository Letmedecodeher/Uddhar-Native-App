import 'dart:async';

class LostPersonsService {
  static Future<List<Map<String, String>>> fetchLostPersons() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    return [
      {
        'name': 'John Doe',
        'description': 'Last seen in Dhaka.',
      },
      {
        'name': 'Jane Smith',
        'description': 'Last seen in Chittagong.',
      },
      {
        'name': 'Rahim Khan',
        'description': 'Last seen in Sylhet.',
      },
    ];
  }
}
