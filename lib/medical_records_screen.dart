import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MedicalRecordsScreen extends StatefulWidget {
  const MedicalRecordsScreen({super.key});

  @override
  State<MedicalRecordsScreen> createState() => _MedicalRecordsScreenState();
}

class _MedicalRecordsScreenState extends State<MedicalRecordsScreen> {
  late Future<List<Map<String, String>>> futureRecords;

  @override
  void initState() {
    super.initState();
    futureRecords = fetchRecords();
  }

  Future<List<Map<String, String>>> fetchRecords() async {
    final response = await http.get(Uri.parse('http://localhost:5000/patients'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.cast<Map<String, String>>();
    }
    throw Exception('Failed to load records');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Medical Records')),
      body: FutureBuilder<List<Map<String, String>>>(
        future: futureRecords,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final records = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: records.length,
              itemBuilder: (context, index) {
                final record = records[index];
                return Card(
                  child: ListTile(
                    title: Text(record['name'] ?? 'Unknown'),
                    subtitle: Text(
                      'Condition: ${record['condition']}\nDate: ${record['date']}',
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Selected: ${record['name']}')),
                      );
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}