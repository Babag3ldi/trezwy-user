import 'package:flutter/material.dart';

class OtpTimer extends StatelessWidget {
  final int secondsRemaining;
  final bool canResend;
  final VoidCallback onResend;

  const OtpTimer({
    super.key,
    required this.secondsRemaining,
    required this.canResend,
    required this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Kod gelmedimi? ",
          style: TextStyle(color: Colors.white.withOpacity(0.5)),
        ),
        GestureDetector(
          onTap: canResend ? onResend : null,
          child: Text(
            canResend 
              ? "Gaýtadan iber" 
              : "00:${secondsRemaining.toString().padLeft(2, '0')}",
            style: TextStyle(
              color: canResend ? Colors.cyanAccent : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}