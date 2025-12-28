import 'package:flutter/material.dart';

class OtpHeader extends StatelessWidget {
  final String phoneNumber;

  const OtpHeader({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.indigoAccent.withOpacity(0.2),
                blurRadius: 20,
              )
            ]
          ),
          child: const Icon(Icons.lock_person_rounded, size: 50, color: Colors.white),
        ),
        const SizedBox(height: 30),
        const Text(
          "Tassyklama Kody",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Biz şu nomere 4 sanly kod ugratdyk:\n$phoneNumber",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 16),
        ),
      ],
    );
  }
}