import 'package:flutter/material.dart';
import '../../../../shared/widgets/custom_button.dart'; // Öňki ýasan düwmämiz

class TripSelectorPanel extends StatefulWidget {
  final bool isDarkMode;
  const TripSelectorPanel({super.key, required this.isDarkMode});

  @override
  State<TripSelectorPanel> createState() => _TripSelectorPanelState();
}

class _TripSelectorPanelState extends State<TripSelectorPanel> {
  // Input Controllers
  final TextEditingController _fromController = TextEditingController(
    text: "Häzirki ýerim",
  );
  final TextEditingController _toController = TextEditingController();

  bool isSpes = false;

  @override
  Widget build(BuildContext context) {
    final bgColor = widget.isDarkMode ? const Color(0xFF1A1A40) : Colors.white;
    final textColor = widget.isDarkMode ? Colors.white : Colors.black87;
    final inputColor = widget.isDarkMode
        ? Colors.white.withOpacity(0.05)
        : Colors.grey.shade100;

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tutawaç (Handle)
          Center(
            child: Container(
              width: 50,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          Text(
            "Nirä gitmeli?",
            style: TextStyle(color: textColor.withOpacity(0.6), fontSize: 14),
          ),
          const SizedBox(height: 10),

          // 1. INPUT FIELDS (A -> B)
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: inputColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                _buildInputRow(
                  Icons.my_location,
                  _fromController,
                  textColor,
                  "Nireden?",
                  Colors.green,
                ),
                Divider(color: textColor.withOpacity(0.1)),
                _buildInputRow(
                  Icons.location_on,
                  _toController,
                  textColor,
                  "Nirä? (Aşgabat...)",
                  Colors.red,
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          _buildChip(
            "Spes (+10)",
            isSpes,
            (v) => setState(() => isSpes = !isSpes),
            color: Colors.amber,
          ),

          const SizedBox(height: 25),

          // 3. BAHA & DÜWME
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Takmynan",
                    style: TextStyle(
                      color: textColor.withOpacity(0.6),
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "~ 65 TMT",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Expanded(
                child: CustomButton(
                  text: "ÇAGYRMAK",
                  onPressed: () {
                    // Sargyt etmek...
                  },
                  colors: const [
                    Color(0xFF3949AB),
                    Color(0xFF1A237E),
                  ], // Indigo Gradient
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInputRow(
    IconData icon,
    TextEditingController ctrl,
    Color textColor,
    String hint,
    Color iconColor,
  ) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 20),
        const SizedBox(width: 15),
        Expanded(
          child: TextField(
            controller: ctrl,
            style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: textColor.withOpacity(0.4)),
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChip(
    String label,
    bool isActive,
    Function(bool) onTap, {
    Color color = Colors.indigoAccent,
  }) {
    return GestureDetector(
      onTap: () => onTap(!isActive),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? color : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isActive ? color : Colors.grey.withOpacity(0.5),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
