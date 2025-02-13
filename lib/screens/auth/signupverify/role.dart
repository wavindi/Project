import 'package:flutter/material.dart';
import '../../home/home_page.dart';


class RolePage extends StatefulWidget {
  const RolePage({super.key});

  @override
  State<RolePage> createState() => _RolePageState();
}

class _RolePageState extends State<RolePage> {
  String? selectedRole;
  final ValueNotifier<bool> isButtonActive = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background decorative circles
            _buildBackgroundCircles(),
            
            // Main content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  
                  const SizedBox(height: 20),
                  
                  // Content Section
                  _buildContentSection(),
                  
                  const Spacer(),
                  
                  // Continue Button
                  _buildContinueButton(),
                  
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundCircles() {
    return Transform.scale(
      scale: 1.2,
      child: Opacity(
        opacity: 0.2,
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: 246,
            child: Stack(
              children: [
                Positioned(
                  left: -50,
                  top: 60,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: const ShapeDecoration(
                      color: Color(0xFF4BBDD8),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                Positioned(
                  right: -50,
                  top: 100,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: const ShapeDecoration(
                      color: Color(0xFFFA8892),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                // Add other positioned elements as needed
              ],
            ),
          ),
        ),
      ),
    );
  }

 
  Widget _buildContentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose your Role',
          style: TextStyle(
            color: Color(0xFF0F1728),
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Are you joining as a Driver, a Passenger, or Both? Select the option that best fits your role.',
          style: TextStyle(
            color: Color(0xFF667084),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 24),
        
        // Role Selection Cards
        _buildRoleSelectionGrid(),
      ],
    );
  }

  Widget _buildRoleSelectionGrid() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildRoleCard('Driver', Icons.directions_car)),
            const SizedBox(width: 12),
            Expanded(child: _buildRoleCard('Passenger', Icons.person)),
          ],
        ),
        const SizedBox(height: 12),
        _buildRoleCard('Both', Icons.people_alt),
      ],
    );
  }

  Widget _buildRoleCard(String role, IconData icon) {
    final isSelected = selectedRole == role;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRole = role;
          isButtonActive.value = true;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F3F6),
          borderRadius: BorderRadius.circular(12),
          border: isSelected ? Border.all(
            color: const Color(0xFF4BBDD8),
            width: 1,
          ) : null,
        ),
        child: Column(
          children: [
            Icon(icon, size: 50, color: const Color(0xFF4BBDD8)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: isSelected 
                      ? const Color(0xFF4BBDD8)
                      : const Color(0xFFCFD4DC),
                    shape: BoxShape.circle,
                  ),
                  child: isSelected
                    ? const Icon(Icons.check, size: 12, color: Colors.white)
                    : null,
                ),
                const SizedBox(width: 10),
                Text(
                  role,
                  style: const TextStyle(
                    color: Color(0xFF0F1728),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return ValueListenableBuilder<bool>(
      valueListenable: isButtonActive,
      builder: (context, isActive, _) {
        return ElevatedButton(
                onPressed: isActive ? () {
                  if (selectedRole != null) {
                    print('Selected role: $selectedRole');
                    // Navigate to HomePage with the selected role
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  }
                } : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4BBDD8),
                  minimumSize: const Size(double.infinity, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
    

      },
    );
  }

  @override
  void dispose() {
    isButtonActive.dispose();
    super.dispose();
  }
}