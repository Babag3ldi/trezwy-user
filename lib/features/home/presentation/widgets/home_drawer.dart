import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onThemeChanged; // Temany çalyşmak üçin
  final VoidCallback onLanguageChanged; // Dili çalyşmak üçin

  const HomeDrawer({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Tema görä reňkler
    final bgColor = isDarkMode ? const Color(0xFF000023) : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final iconColor = isDarkMode ? Colors.white70 : Colors.black54;

    return Drawer(
      backgroundColor: bgColor,
      child: Column(
        children: [
          // 1. HEADER (Ulanyjy Maglumaty)
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isDarkMode
                    ? [const Color(0xFF3949AB), const Color(0xFF1A237E)]
                    : [Colors.blueAccent, Colors.blue],
              ),
            ),
            currentAccountPicture: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                color: Colors.white.withOpacity(0.2), // Arka fon
              ),
              child: const Icon(Icons.person, size: 40, color: Colors.white),
            ),
            accountName: const Text(
              "Merdan Atayew",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            accountEmail: const Text(
              "+993 65 12 34 56",
              style: TextStyle(color: Colors.white70),
            ),
          ),

          // 2. MENU ITEMS
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildTile(
                  Icons.history_rounded,
                  "Sargytlarym",
                  iconColor,
                  textColor,
                  () {},
                ),
                _buildTile(
                  Icons.person_outline_rounded,
                  "Profil",
                  iconColor,
                  textColor,
                  () {},
                ),
                _buildTile(
                  Icons.credit_card_rounded,
                  "Töleg usullary",
                  iconColor,
                  textColor,
                  () {},
                ),
                const Divider(),
                _buildTile(
                  Icons.settings_outlined,
                  "Sazlamalar",
                  iconColor,
                  textColor,
                  () {},
                ),
                _buildTile(
                  Icons.help_outline_rounded,
                  "Kömek & Goldaw",
                  iconColor,
                  textColor,
                  () {},
                ),
              ],
            ),
          ),

          // 3. SETTINGS (Theme & Language)
          Container(
            padding: const EdgeInsets.all(16),
            color: isDarkMode
                ? Colors.white.withOpacity(0.05)
                : Colors.grey.shade100,
            child: Column(
              children: [
                // TEMA ÇALYŞMAK
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Gije Rejimi",
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Switch(
                      value: isDarkMode,
                      activeThumbColor: Colors.indigoAccent,
                      onChanged: (v) => onThemeChanged(),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // DIL ÇALYŞMAK
                InkWell(
                  onTap: onLanguageChanged,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: iconColor.withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Dil / Язык", style: TextStyle(color: textColor)),
                        Row(
                          children: [
                            Text(
                              "TKM",
                              style: TextStyle(
                                color: iconColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Wersiýa 1.0.0",
                  style: TextStyle(color: iconColor, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTile(
    IconData icon,
    String title,
    Color iconColor,
    Color textColor,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title, style: TextStyle(color: textColor, fontSize: 16)),
      onTap: onTap,
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 14,
        color: Colors.grey,
      ),
    );
  }
}
