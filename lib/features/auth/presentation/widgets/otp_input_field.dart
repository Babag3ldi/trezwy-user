import 'package:flutter/material.dart';

class OtpInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String) onChanged;
  final bool hasError; // <--- TÄZE GOŞULAN

  const OtpInputField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    this.hasError = false, // <--- DEFAULT FALSE
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Gizlin Input
        Opacity(
          opacity: 0,
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: TextInputType.number,
            maxLength: 4,
            onChanged: onChanged,
          ),
        ),
        
        // Görünýän Gutujyklar
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) => _buildDigitBox(index)),
        ),
      ],
    );
  }

  Widget _buildDigitBox(int index) {
    String char = "";
    if (index < controller.text.length) {
      char = controller.text[index];
    }
    
    bool isActive = index == controller.text.length;
    bool isFilled = index < controller.text.length;

    // --- REŇK LOGIKASY ---
    Color borderColor;
    if (hasError) {
      borderColor = Colors.redAccent; // Ýalňyş bolsa GYZYL
    } else if (isActive) {
      borderColor = Colors.cyanAccent; // Ýazylyp durka MAWY
    } else if (isFilled) {
      borderColor = Colors.indigoAccent; // Doly bolsa GÖK
    } else {
      borderColor = Colors.white24; // Boş bolsa AK
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 60,
      height: 70,
      decoration: BoxDecoration(
        // Ýalňyş bolsa fonuny hem çalaja gyzardýarys
        color: hasError 
            ? Colors.redAccent.withOpacity(0.1) 
            : (isFilled ? Colors.indigoAccent.withOpacity(0.1) : Colors.white.withOpacity(0.05)),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: borderColor,
          width: isActive || hasError ? 2 : 1, // Error bolsa galyňlaşýar
        ),
        boxShadow: isActive 
            ? [BoxShadow(color: Colors.cyanAccent.withOpacity(0.3), blurRadius: 15)] 
            : [],
      ),
      child: Center(
        child: Text(
          char,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            // Ýalňyş bolsa harpy hem gyzartmak isleseňiz:
            color: hasError ? Colors.redAccent : Colors.white,
          ),
        ),
      ),
    );
  }
}