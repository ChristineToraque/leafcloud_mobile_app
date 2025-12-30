import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  final List<Map<String, dynamic>> historyData = [
    {
      "timestamp": "2025-11-15T10:00:00Z",
      "n_ppm": 120.0,
      "p_ppm": 40.0,
      "k_ppm": 160.0,
      "ec": 750.0,
      "ph": 6.2,
      "temp_c": 24.5
    },
    {
      "timestamp": "2025-11-15T12:00:00Z",
      "n_ppm": 125.0,
      "p_ppm": 42.0,
      "k_ppm": 165.0,
      "ec": 760.0,
      "ph": 6.3,
      "temp_c": 24.8
    },
    {
      "timestamp": "2025-11-15T14:00:00Z",
      "n_ppm": 130.0,
      "p_ppm": 45.0,
      "k_ppm": 170.0,
      "ec": 770.0,
      "ph": 6.4,
      "temp_c": 25.0
    },
    {
      "timestamp": "2025-11-15T16:00:00Z",
      "n_ppm": 135.0,
      "p_ppm": 47.0,
      "k_ppm": 175.0,
      "ec": 780.0,
      "ph": 6.5,
      "temp_c": 25.2
    },
    {
      "timestamp": "2025-11-15T18:00:00Z",
      "n_ppm": 140.0,
      "p_ppm": 48.0,
      "k_ppm": 180.0,
      "ec": 790.0,
      "ph": 6.6,
      "temp_c": 25.5
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        backgroundColor: Colors.green[700],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: historyData.length,
        itemBuilder: (context, index) {
          final entry = historyData[index];
          final timestamp = DateFormat.yMMMd().add_jm().format(DateTime.parse(entry['timestamp']));

          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    timestamp,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.green[800],
                    ),
                  ),
                  const Divider(height: 20, thickness: 1),
                  Row(
                    children: [
                      _buildDataColumn(context, 'N', '${entry['n_ppm']} ppm', Icons.eco),
                      _buildDataColumn(context, 'P', '${entry['p_ppm']} ppm', Icons.grass),
                      _buildDataColumn(context, 'K', '${entry['k_ppm']} ppm', Icons.local_florist),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildDataColumn(context, 'EC', '${entry['ec']} µS/cm', Icons.flash_on),
                      _buildDataColumn(context, 'pH', '${entry['ph']}', Icons.waves),
                      _buildDataColumn(context, 'Temp', '${entry['temp_c']} °C', Icons.thermostat),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDataColumn(BuildContext context, String label, String value, IconData icon) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: Colors.green[600], size: 28),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}