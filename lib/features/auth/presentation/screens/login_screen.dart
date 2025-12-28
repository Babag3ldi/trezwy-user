import 'package:flutter/material.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/glass_text_field.dart';
import 'index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _isLoading = false;

  void _submit() async {
    // 1. Walidasiýa barlagy
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // 2. Ýüklenýär (Loading) görkezmek
    setState(() => _isLoading = true);

    // Klawiaturany ýapmak
    FocusScope.of(context).unfocus();

    // 3. Simulyasiýa (Backend soragy)
    await Future.delayed(const Duration(seconds: 2));

    setState(() => _isLoading = false);

    // 4. Indiki sahypa geçmek (OTP)
    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>
              OtpScreen(phoneNumber: "+993 ${_phoneController.text}"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Ekranyň ölçegleri
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(
        context,
      ).unfocus(), // Boş ýere basylanda klawiatura ýapylýar
      child: Scaffold(
        backgroundColor: const Color(0xFF000023),
        body: Container(
          // Owadan Gradient Arka fon
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF000023), Color(0xFF001030)],
            ),
          ),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // --- 1. LOGO & HEADER ---
                      _buildLogo(),
                      const SizedBox(height: 30),

                      const Text(
                        "Hoş Geldiňiz!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Siz içdiňiz, biz sürýäris.",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 40),

                      // --- 2. INPUT FIELDS ---
                      GlassTextField(
                        controller: _nameController,
                        hint: "Adyňyz",
                        icon: Icons.person_outline_rounded,
                        textCapitalization: TextCapitalization.sentences,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Adyňyzy ýazmak hökmany";
                          }
                          if (value.length < 3) {
                            return "Adyňyz gysga bolmaly däl";
                          }
                          return null;
                        },
                      ),

                      GlassTextField(
                        controller: _phoneController,
                        hint: "XX XX XX (Nomeriňiz)",
                        icon: Icons.phone_android_rounded,
                        keyboardType: TextInputType.number,
                        isPhone: true,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Telefon nomer hökmany";
                          }
                          if (value.length < 8) {
                            return "Nomer doly däl (8 san bolmaly)";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 40),
                      CustomButton(
                        text: "GIRMEK",
                        isLoading: _isLoading, // Loading bolanda aýlanýar
                        onPressed: _submit,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.05),
        border: Border.all(
          color: Colors.indigoAccent.withOpacity(0.5),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.indigoAccent.withOpacity(0.2),
            blurRadius: 30,
            spreadRadius: 10,
          ),
        ],
      ),
      child: const Icon(
        Icons.local_taxi_rounded, // Ýa-da car_rental
        size: 60,
        color: Colors.white,
      ),
    );
  }
}
