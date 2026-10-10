
import 'package:flutter/material.dart';

void main() {
  runApp(const PrayerTimesApp());
}

class PrayerTimesApp extends StatelessWidget {
  const PrayerTimesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'مواقيت الصلاة',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFF4F6F8),
      ),
      home: const PrayerHomePage(),
    );
  }
}

class PrayerHomePage extends StatelessWidget {
  const PrayerHomePage({super.key});

  final Map<String, String> prayerTimes = const {
    'الفجر': '04:30 ص',
    'الظهر': '12:00 م',
    'العصر': '03:15 م',
    'المغرب': '05:45 م',
    'العشاء': '07:15 م',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مواقيت الصلاة'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // كارت الصلاة القادمة
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Column(
                children: [
                  Text(
                    'الصلاة القادمة',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'العصر - 03:15 م',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // قائمة مواعيد الصلوات
            Expanded(
              child: ListView.builder(
                itemCount: prayerTimes.length,
                itemBuilder: (context, index) {
                  String key = prayerTimes.keys.elementAt(index);
                  String value = prayerTimes[key]!;
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.access_time_filled, color: Colors.teal),
                      title: Text(
                        key,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}