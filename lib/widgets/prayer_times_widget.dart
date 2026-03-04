import 'package:flutter/material.dart';

class PrayerTimesWidget extends StatelessWidget {
  const PrayerTimesWidget({super.key, required this.prayerName, required this.prayerTime});
  final String prayerName;
  final String prayerTime; 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: .spaceAround,
        children: [Text(prayerName), Text(prayerTime)],
      ),
    );
  }
}
