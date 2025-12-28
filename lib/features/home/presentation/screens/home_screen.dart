import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart'; // MapController üçin

// Importlar
import '../widgets/home_drawer.dart';
import '../widgets/map_view.dart';
import '../widgets/trip_selector_panel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Global Key: Drawer-y programmatik açmak üçin
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final MapController _mapController = MapController();
  
  // State: Dark Mode (Hakyky taslamada muny Providerde saklamaly)
  bool _isDarkMode = true; 

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // Drawer (Gapdal Menýu)
      drawer: HomeDrawer(
        isDarkMode: _isDarkMode,
        onThemeChanged: _toggleTheme,
        onLanguageChanged: () {
          // Dil çalyşmak logikasy...
        },
      ),
      body: Stack(
        children: [
          // 1. KARTA (Iň aşakda)
          MapView(
            isDarkMode: _isDarkMode,
            mapController: _mapController,
          ),

          // 2. MENU DÜWMESI (Ýokarda çepde)
          Positioned(
            top: 50,
            left: 20,
            child: _buildFloatingButton(
              icon: Icons.menu,
              onTap: () => _scaffoldKey.currentState?.openDrawer(),
            ),
          ),

          // 3. SARGYT PANELI (Iň aşakda)
          Positioned(
            left: 0, 
            right: 0, 
            bottom: 0,
            child: TripSelectorPanel(isDarkMode: _isDarkMode),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: _isDarkMode ? const Color(0xFF000023) : Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), 
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Icon(
          icon, 
          color: _isDarkMode ? Colors.white : Colors.black87
        ),
      ),
    );
  }
}