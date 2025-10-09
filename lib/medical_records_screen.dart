import 'package:flutter/material.dart';

class MedicalRecordsScreen extends StatelessWidget {
  const MedicalRecordsScreen({Key? key}) : super(key: key);

  // Mock data; replace with http call to backend /patients or /records endpoint
  final List<Map<String, String>> _mockRecords = [
    {'name': 'John Doe', 'condition': 'Hypertension', 'date': '2025-10-01'},
    {'name': 'Jane Smith', 'condition': 'Diabetes', 'date': '2025-09-15'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Medical Records')),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: _mockRecords.length,
        itemBuilder: (context, index) {
          final record = _mockRecords[index];
          return Card(
            child: ListTile(
              title: Text(record['name']!),
              subtitle: Text('Condition: ${record['condition']}\nDate: ${record['date']}'),
              onTap: () {
                // Add navigation to detailed record view later
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Selected: ${record['name']}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}