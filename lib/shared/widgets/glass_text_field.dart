import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GlassTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool isPhone;
  final TextCapitalization textCapitalization;

  const GlassTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.isPhone = false,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        style: const TextStyle(color: Colors.white, fontSize: 16),
        cursorColor: Colors.indigoAccent,
        inputFormatters: isPhone
            ? [LengthLimitingTextInputFormatter(8), FilteringTextInputFormatter.digitsOnly]
            : [],
        validator: validator,
        decoration: InputDecoration(
          // --- ÜÝTGEDILEN ÝER: PrefixIcon içine Row saldyk ---
          prefixIcon: isPhone
              ? Padding(
                  padding: const EdgeInsets.only(left: 12, right: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // MÖHÜM: Diňe gereklisiçer ýer tutýar
                    children: [
                      Icon(icon, color: Colors.indigoAccent.withOpacity(0.8)),
                      const SizedBox(width: 10),
                      const Text(
                        "+993", // Hemişe görünýän kod
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Owadanlyk üçin kiçijik çyzyk (separator)
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        width: 1,
                        height: 20,
                        color: Colors.white24,
                      ),
                    ],
                  ),
                )
              : Icon(icon, color: Colors.indigoAccent.withOpacity(0.8)),
          
          // prefixText indi gerek däl, ony aýyrýarys (null)
          prefixText: null, 
          
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 12),
        ),
      ),
    );
  }
}