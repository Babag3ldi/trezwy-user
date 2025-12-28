import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trezwyy_user/features/home/presentation/screens/home_screen.dart';

import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/shake_widget.dart';
import '../widgets/otp_header.dart';
import '../widgets/otp_input_field.dart';
import '../widgets/otp_timer.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;

  const OtpScreen({super.key, required this.phoneNumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late AnimationController _shakeController;

  bool _isLoading = false;
  int _secondsRemaining = 60;
  late Timer _timer;
  bool _canResend = false;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _startTimer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });

    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _shakeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _shakeController.reset();
      }
    });
  }

  void _startTimer() {
    setState(() {
      _secondsRemaining = 60;
      _canResend = false;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        setState(() {
          _timer.cancel();
          _canResend = true;
        });
      } else {
        setState(() => _secondsRemaining--);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _otpController.dispose();
    _focusNode.dispose();
    _shakeController.dispose();
    super.dispose();
  }

  void _verifyOtp() async {
    String code = _otpController.text.trim();

    if (code.isEmpty || code.length != 4) {
      setState(() {
        _errorText = code.isEmpty ? "Haýyş, kody giriziň" : "Kod 4 san bolmaly";
      });

      _shakeController.forward();
      return;
    }

    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 2));

    setState(() => _isLoading = false);

    Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
  }

  void _resendCode() {
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000023),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF000023), Color(0xFF001030)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 20),

                OtpHeader(phoneNumber: widget.phoneNumber),

                const SizedBox(height: 50),

                ShakeWidget(
                  controller: _shakeController,
                  child: OtpInputField(
                    controller: _otpController,
                    focusNode: _focusNode,
                    hasError: _errorText != null,
                    onChanged: (v) {
                      if (_errorText != null) setState(() => _errorText = null);
                      setState(() {});
                      if (v.length == 4) _verifyOtp();
                    },
                  ),
                ),

                if (_errorText != null) ...[
                  const SizedBox(height: 10),
                  Text(
                    _errorText!,
                    style: const TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],

                const SizedBox(height: 30),

                OtpTimer(
                  secondsRemaining: _secondsRemaining,
                  canResend: _canResend,
                  onResend: _resendCode,
                ),

                const SizedBox(height: 50),

                CustomButton(
                  text: "TASSYKLAMAK",
                  isLoading: _isLoading,
                  onPressed: _verifyOtp,
                  colors: const [Color(0xFF00C853), Color(0xFF69F0AE)],
                  shadowColor: Colors.greenAccent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
