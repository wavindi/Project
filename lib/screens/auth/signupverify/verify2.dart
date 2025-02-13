import 'package:flutter/material.dart';
import 'linkedindetails.dart'; // Add this import at the top of the file

class Verify2Screen extends StatelessWidget {
  const Verify2Screen({super.key});

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
                      // Circle 1
                      Positioned(
                        left: 0,
                        top: 61,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF4BBDD8),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      // Circle 2
                      Positioned(
                        left: 13,
                        top: 126,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF4BBDD8),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      // Circle 3
                      Positioned(
                        left: 120,
                        top: 120,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF4BBDD8),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      // Circle 4
                      Positioned(
                        left: 176,
                        top: 120,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF4BBDD8),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      // Circle 5
                      Positioned(
                        left: 110,
                        top: 20,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF0079A2),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      // Circle 6
                      Positioned(
                        left: 20,
                        top: 0,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF0079A2),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      // Circle 7
                      Positioned(
                        left: 210,
                        top: 33,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFFA8892),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      // Circle 8
                      Positioned(
                        left: 189,
                        top: 117,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFFA8892),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      // Circle 9
                      Positioned(
                        left: 322,
                        top: 146,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFFFAAB4),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      // Circle 10
                      Positioned(
                        left: 278,
                        top: 146,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFFFAAB4),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      // Circle 11
                      Positioned(
                        left: 250,
                        top: 26,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFD85962),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      // Circle 12
                      Positioned(
                        left: 325,
                        top: 37,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFD85962),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Verify Button
            Positioned(
              left: 16,
              bottom: 16,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LinkedInDetailsPage()), // Navigate to LinkedIn class
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

            // Main Content
            Positioned(
              left: 0,
              top: MediaQuery.of(context).size.height *
                  0.2, // Adjusted for responsiveness
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Title
                    const Text(
                      'Verify your Email',
                      style: TextStyle(
                        color: Color(0xFF0F1728),
                        fontSize: 30,
                        fontFamily: 'Public Sans',
                        fontWeight: FontWeight.w700,
                        height: 1.27,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Subtitle
                    const Text(
                      'Please enter the code we sent to m*****@gmail.com',
                      style: TextStyle(
                        color: Color(0xFF667084),
                        fontSize: 14,
                        fontFamily: 'Public Sans',
                        fontWeight: FontWeight.w600,
                        height: 1.43,
                      ),
                    ),
                    const SizedBox(height: 24),
                    // OTP Input Fields
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        6,
                        (index) => Container(
                          width: 48,
                          height: 56,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF2F3F6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              '',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Resend Code Text
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Didn’t get the code? ',
                            style: TextStyle(
                              color: Color(0xFF667084),
                              fontSize: 14,
                              fontFamily: 'Public Sans',
                              fontWeight: FontWeight.w600,
                              height: 1.43,
                            ),
                          ),
                          TextSpan(
                            text: 'Resend it.',
                            style: TextStyle(
                              color: Color(0xFF4BBDD8),
                              fontSize: 14,
                              fontFamily: 'Public Sans',
                              fontWeight: FontWeight.w600,
                              height: 1.43,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
