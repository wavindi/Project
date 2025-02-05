import 'package:flutter/material.dart';
import '../../home/home_page.dart';

class WorkSchedulePage extends StatefulWidget {
  const WorkSchedulePage({super.key});

  @override
  State<WorkSchedulePage> createState() => _WorkSchedulePageState();
}

class _WorkSchedulePageState extends State<WorkSchedulePage> {
  // State for each question
  String? _selectedLeaveForWork;
  String? _selectedHeadHome;
  final List<String> _selectedCommuteDays = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and Description
              const Text(
                'Work Schedule & App Usage',
                style: TextStyle(
                  color: Color(0xFF0F1728),
                  fontSize: 28,
                  fontFamily: 'Public Sans',
                  fontWeight: FontWeight.w700,
                  height: 1.29,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Help us tailor your experience by sharing your work routine and when you plan to use the app.',
                style: TextStyle(
                  color: Color(0xFF6B7280),
                  fontSize: 14,
                  fontFamily: 'Public Sans',
                  fontWeight: FontWeight.w600,
                  height: 1.43,
                ),
              ),
              const SizedBox(height: 20),

              // Question 1: When do you usually leave for work?
              _buildQuestion(
                question: 'When do you usually leave for work?',
                options: const [
                  'Early Morning (e.g., 5:00 AM - 7:00 AM)',
                  'Morning (e.g., 7:00 AM - 9:00 AM)',
                  'Late Morning (e.g., 9:00 AM - 11:00 AM)',
                  'Afternoon (e.g., 11:00 AM - 1:00 PM)',
                ],
                selectedOption: _selectedLeaveForWork,
                onSelect: (value) {
                  setState(() {
                    _selectedLeaveForWork = value;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Question 2: When do you usually head home?
              _buildQuestion(
                question: 'When do you usually head home?',
                options: const [
                  'Early Afternoon (e.g., 12:00 PM - 2:00 PM)',
                  'Afternoon (e.g., 4:00 PM - 6:00 PM)',
                  'Evening (e.g., 6:00 PM - 8:00 PM)',
                  'Night (e.g., 8:00 PM - 10:00 PM)',
                ],
                selectedOption: _selectedHeadHome,
                onSelect: (value) {
                  setState(() {
                    _selectedHeadHome = value;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Question 3: Which days do you commute?
              _buildCommuteDaysQuestion(),
              const SizedBox(height: 20),

              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _canContinue()
                      ? () {
                          // Navigate to HomePage
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4BBDD8),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Public Sans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build a question with options
  Widget _buildQuestion({
    required String question,
    required List<String> options,
    required String? selectedOption,
    required Function(String) onSelect,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: const TextStyle(
            color: Color(0xFF0F1728),
            fontSize: 16,
            fontFamily: 'Public Sans',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Column(
          children: options.map((option) {
            return _buildOption(
              option: option,
              isSelected: option == selectedOption,
              onSelect: () => onSelect(option),
            );
          }).toList(),
        ),
      ],
    );
  }

  // Helper method to build an option
  Widget _buildOption({
    required String option,
    required bool isSelected,
    required VoidCallback onSelect,
  }) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:
                isSelected ? const Color(0xFF4BBDD8) : const Color(0xFFEAECF0),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF4BBDD8)
                    : const Color(0xFFEAECF0),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                option,
                style: const TextStyle(
                  color: Color(0xFF9CA3AF),
                  fontSize: 14,
                  fontFamily: 'Public Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build the commute days question
  Widget _buildCommuteDaysQuestion() {
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Which days do you commute?',
          style: TextStyle(
            color: Color(0xFF0F1728),
            fontSize: 16,
            fontFamily: 'Public Sans',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: days.map((day) {
            return _buildCommuteDayOption(
              day: day,
              isSelected: _selectedCommuteDays.contains(day),
              onSelect: () {
                setState(() {
                  if (_selectedCommuteDays.contains(day)) {
                    _selectedCommuteDays.remove(day);
                  } else {
                    _selectedCommuteDays.add(day);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  // Helper method to build a commute day option
  Widget _buildCommuteDayOption({
    required String day,
    required bool isSelected,
    required VoidCallback onSelect,
  }) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:
                isSelected ? const Color(0xFF4BBDD8) : const Color(0xFFEAECF0),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF4BBDD8)
                    : const Color(0xFFEAECF0),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              day,
              style: const TextStyle(
                color: Color(0xFF9CA3AF),
                fontSize: 14,
                fontFamily: 'Public Sans',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Check if all questions have been answered
  bool _canContinue() {
    return _selectedLeaveForWork != null &&
        _selectedHeadHome != null &&
        _selectedCommuteDays.isNotEmpty;
  }
}
