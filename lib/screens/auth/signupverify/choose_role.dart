import 'package:flutter/material.dart';
import 'select_priorites.dart'; // Add this import at the top of the file

class RoleSelectionPage extends StatefulWidget {
  const RoleSelectionPage({super.key});

  @override
  State<RoleSelectionPage> createState() => _RoleSelectionPageState();
}

class _RoleSelectionPageState extends State<RoleSelectionPage> {
  String?
      _selectedRole; // Tracks the selected role (Driver, Passenger, or Both)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Circles
          Positioned(
            left: -24,
            top: -93,
            child: Opacity(
              opacity: 0.20,
              child: Container(
                width: 425,
                height: 246,
                child: Stack(
                  children: [
                    // Background circles (omitted for brevity, same as your original code)
                  ],
                ),
              ),
            ),
          ),

          // Main Content
          Positioned(
            left: 0,
            top: 44,
            child: Container(
              height: 391,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button (optional)
                  Container(
                    width: double.infinity,
                    height: 44,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FlutterLogo(
                            size: 16), // Replace with your back button icon
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Title and Description
                  Container(
                    width: double.infinity,
                    height: 102,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Choose your Role',
                          style: TextStyle(
                            color: Color(0xFF0F1728),
                            fontSize: 30,
                            fontFamily: 'Public Sans',
                            fontWeight: FontWeight.w700,
                            height: 1.27,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 343,
                          child: Text(
                            'Are you joining as a Driver, a Passenger, or Both? Select the option that best fits your role.',
                            style: TextStyle(
                              color: Color(0xFF667084),
                              fontSize: 14,
                              fontFamily: 'Public Sans',
                              fontWeight: FontWeight.w600,
                              height: 1.43,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Role Selection Cards
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Driver Card
                      Expanded(
                        child: _buildRoleCard(
                          role: 'Driver',
                          isSelected: _selectedRole == 'Driver',
                          onTap: () => _selectRole('Driver'),
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Passenger Card
                      Expanded(
                        child: _buildRoleCard(
                          role: 'Passenger',
                          isSelected: _selectedRole == 'Passenger',
                          onTap: () => _selectRole('Passenger'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Both Card
                  _buildRoleCard(
                    role: 'Both',
                    isSelected: _selectedRole == 'Both',
                    onTap: () => _selectRole('Both'),
                  ),
                ],
              ),
            ),
          ),

          // Continue Button
          Positioned(
            left: 16,
            top: 722,
            child: GestureDetector(
              onTap: _selectedRole != null
                  ? () {
                      // Handle continue action
                      print('Selected Role: $_selectedRole');
                    }
                  : null,
              child: Container(
                width: 343,
                height: 44,
                padding: const EdgeInsets.all(12),
                decoration: ShapeDecoration(
                  color: _selectedRole != null
                      ? const Color(0xFF4BBDD8)
                      : const Color(
                          0xFFCFD4DC), // Disabled color if no role is selected
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Continue',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Public Sans',
                        fontWeight: FontWeight.w500,
                        height: 1.50,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Status Bar (optional)
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 375,
              height: 44,
              padding: const EdgeInsets.only(
                top: 14,
                left: 30,
                right: 21.75,
                bottom: 14,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '9:41',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 18,
                          height: 10,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://via.placeholder.com/18x10"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          width: 15.27,
                          height: 10.97,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://via.placeholder.com/15x11"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          width: 26.98,
                          height: 13,
                          child: Stack(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build a role selection card
  Widget _buildRoleCard({
    required String role,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: ShapeDecoration(
          color: const Color(0xFFF2F3F6),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: isSelected
                  ? const Color(0xFF4BBDD8)
                  : const Color(0xFFF2F3F6),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FlutterLogo(size: 85), // Replace with your role-specific icon
            const SizedBox(height: 12),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 18,
                  height: 18,
                  padding: const EdgeInsets.all(8),
                  decoration: ShapeDecoration(
                    color: isSelected
                        ? const Color(0xFF4BBDD8)
                        : const Color(0xFFCFD4DC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  role,
                  style: const TextStyle(
                    color: Color(0xFF0F1728),
                    fontSize: 14,
                    fontFamily: 'Public Sans',
                    fontWeight: FontWeight.w600,
                    height: 1.29,
                    letterSpacing: -0.08,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Method to handle role selection
  void _selectRole(String role) {
    setState(() {
      _selectedRole = role;
    });
  }
}
