import 'package:flutter/material.dart';

class IrrigationDashboard extends StatelessWidget {
  const IrrigationDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Smart Irrigation",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            Text(
              "Dashboard",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// STATUS CARDS
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: const [
                StatusCard(
                  icon: Icons.power_settings_new,
                  title: "Active Zones",
                  value: "1 / 1",
                ),
                StatusCard(
                  icon: Icons.water_drop,
                  title: "Avg Moisture",
                  value: "53%",
                ),
              ],
            ),
            const SizedBox(height: 20),

            /// IRRIGATION ZONES
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const Icon(Icons.grass, color: Colors.green, size: 18),
                  const SizedBox(width: 6),
                  const Text(
                    "Irrigation Zones",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  //add new zone button
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Green background
                    ),
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(Icons.add, color: Colors.white, size: 30),
                        Text(
                          'Add new zone',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            const ZoneCard(
              title: "Front Lawn",
              size: "120 m²",
              moisture: 0.53,
              status: "Active",
            ),
          ],
        ),
      ),
    );
  }
}

class StatusCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const StatusCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardDecoration(),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.green, size: 60),
          const Spacer(),
          Text(title, style: const TextStyle(color: Colors.grey)),
          Text(
            value,
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class ZoneCard extends StatelessWidget {
  final String title;
  final String size;
  final double moisture;
  final String status;

  const ZoneCard({
    super.key,
    required this.title,
    required this.size,
    required this.moisture,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(size, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: moisture,
            minHeight: 8,
            borderRadius: BorderRadius.circular(8),
          ),
          const SizedBox(height: 6),
          Text("Soil Moisture ${(moisture * 100).toInt()}%"),
          Text(
            "Status: $status",
            style: TextStyle(
              color: status == "Active" ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

BoxDecoration cardDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        blurRadius: 8,
        offset: const Offset(0, 4),
      ),
    ],
  );
}
