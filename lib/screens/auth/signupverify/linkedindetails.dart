import 'package:flutter/material.dart';
import 'select_priorites.dart'; // Add this import at the top of the file
import 'role.dart'; // Add this import at the top of the file


class LinkedInDetailsPage extends StatefulWidget {
  const LinkedInDetailsPage({super.key});

  @override
  State<LinkedInDetailsPage> createState() => _LinkedInDetailsPageState();
}

class _LinkedInDetailsPageState extends State<LinkedInDetailsPage> {
  // Define strings to store user input
  String fullName = 'Anwar Raza🌟';
  String jobTitle = 'UI/UX Designer';
  String location = 'Pakistan';
  String email = 'meanwarraza99@gmail.com';
  String phoneNumber = '+352 621 981 241';
  String website = 'www.summarybullets.com';
  String jobExperience = 'UI Designer at Fiverr. Freelance';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            // Background gradient circles
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
                      // Add decorative circles here (same as in your original code)
                      // ...
                    ],
                  ),
                ),
              ),
            ),

            // Main Content
            Positioned(
              left: 0,
              top: MediaQuery.of(context).size.height *
                  0.1, // Adjusted for responsiveness
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    const Text(
                      'LinkedIn Details',
                      style: TextStyle(
                        color: Color(0xFF0F1728),
                        fontSize: 28,
                        fontFamily: 'Satoshi Variable',
                        fontWeight: FontWeight.w700,
                        height: 1.29,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Subtitle
                    const Text(
                      'These details have been extracted from your LinkedIn profile. You can change these later.',
                      style: TextStyle(
                        color: Color(0xFF667084),
                        fontSize: 14,
                        fontFamily: 'Public Sans',
                        fontWeight: FontWeight.w600,
                        height: 1.43,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Profile Section
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF2F3F6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        children: [
                          // Profile Picture
                          Container(
                            width: 100,
                            height: 100,
                            decoration: const ShapeDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://via.placeholder.com/100x100"),
                                fit: BoxFit.fill,
                              ),
                              shape: OvalBorder(),
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Profile Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  fullName,
                                  style: const TextStyle(
                                    color: Color(0xFF0F1728),
                                    fontSize: 16,
                                    fontFamily: 'Public Sans',
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.08,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  jobTitle,
                                  style: const TextStyle(
                                    color: Color(0xFF667084),
                                    fontSize: 12,
                                    fontFamily: 'Public Sans',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.08,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on,
                                        size: 12, color: Color(0xFF9CA3AF)),
                                    const SizedBox(width: 4),
                                    Text(
                                      location,
                                      style: const TextStyle(
                                        color: Color(0xFF9CA3AF),
                                        fontSize: 10,
                                        fontFamily: 'Public Sans',
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.08,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 6),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFFBFCFC),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    '500+ Connections',
                                    style: const TextStyle(
                                      color: Color(0xFF0F1728),
                                      fontSize: 10,
                                      fontFamily: 'Public Sans',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.08,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Contact Information Section
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF2F3F6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Contact Information',
                            style: TextStyle(
                              color: Color(0xFF667084),
                              fontSize: 16,
                              fontFamily: 'Public Sans',
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.08,
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Email
                          _buildContactRow(Icons.email, email),
                          const SizedBox(height: 8),
                          // Phone Number
                          _buildContactRow(Icons.phone, phoneNumber),
                          const SizedBox(height: 8),
                          // Website
                          _buildContactRow(Icons.link, website),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Job & Experience Section
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF2F3F6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Job & Experience',
                            style: TextStyle(
                              color: Color(0xFF667084),
                              fontSize: 16,
                              fontFamily: 'Public Sans',
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.08,
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Job Experience
                          _buildJobExperienceRow(jobExperience),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Continue Button
            Positioned(
              left: 16,
              bottom: 16,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            WorkSchedulePage()), // Navigate to LinkedIn class
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 32,
                  height: 44,
                  padding: const EdgeInsets.all(12),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF4BBDD8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Public Sans',
                        fontWeight: FontWeight.w500,
                        height: 1.50,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build a contact row
  Widget _buildContactRow(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: ShapeDecoration(
        color: const Color(0xFFFBFCFC),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 24, color: const Color(0xFF667084)),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF667084),
              fontSize: 12,
              fontFamily: 'Public Sans',
              fontWeight: FontWeight.w500,
              letterSpacing: -0.08,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build a job experience row
  Widget _buildJobExperienceRow(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: ShapeDecoration(
        color: const Color(0xFFFBFCFC),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 66,
            height: 66,
            decoration: ShapeDecoration(
              image: const DecorationImage(
                image: NetworkImage("https://via.placeholder.com/66x66"),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    color: Color(0xFF0F1728),
                    fontSize: 14,
                    fontFamily: 'Public Sans',
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.08,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Aug 2023 - Present · 1 yr 6 mos',
                  style: TextStyle(
                    color: Color(0xFF667084),
                    fontSize: 10,
                    fontFamily: 'Public Sans',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.08,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Remote',
                  style: TextStyle(
                    color: Color(0xFF667084),
                    fontSize: 10,
                    fontFamily: 'Public Sans',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.08,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
