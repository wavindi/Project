import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../home/home_page.dart'; // Import your HomePage
import 'signup_page.dart'; // Import your SignupPage

class LoginPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width, // Adjust to screen width
        height: MediaQuery.of(context).size.height, // Adjust to screen height
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
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
                      // Add your background circles here...
                    ],
                  ),
                ),
              ),
            ),

            // Add the login.png image
            Positioned(
              left: 0,
              right: 0,
              top: MediaQuery.of(context).size.height *
                  0.1, // Adjust position as needed
              child: Center(
                child: Image.asset(
                  'assets/images/login.png', // Path to your image
                  //width: 200, // Adjust width as needed
                  //height: 200, // Adjust height as needed
                  fit: BoxFit.contain, // Ensure the image fits well
                ),
              ),
            ),

            // Login Section
            Positioned(
              left: 0,
              right: 0, // Stretch to full width
              bottom: 0, // Position at the bottom
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Log in with LinkedIn or choose another method',
                      style: TextStyle(
                        color: Color(0xFF667084),
                        fontSize: 12,
                        fontFamily: 'Public Sans',
                        fontWeight: FontWeight.w500,
                        height: 1.50,
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        // Handle LinkedIn login
                      },
                      child: Container(
                        width: double.infinity, // Full width
                        height: 54,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Color(0xFFF2F3F6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              child: FlutterLogo(),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Continue with LinkedIn',
                              style: TextStyle(
                                color: Color(0xFF667084),
                                fontSize: 14,
                                fontFamily: 'Public Sans',
                                fontWeight: FontWeight.w500,
                                height: 1.43,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'OR',
                      style: TextStyle(
                        color: Color(0xFF98A1B2),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 1.50,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              // Navigate to HomePage
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            },
                            child: Container(
                              height: 48,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F3F6),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Color(0xFF667084),
                                    fontSize: 14,
                                    fontFamily: 'Public Sans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              // Navigate to SignupPage
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()),
                              );
                            },
                            child: Container(
                              height: 48,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F3F6),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Color(0xFF667084),
                                    fontSize: 14,
                                    fontFamily: 'Public Sans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
