import 'package:flutter/material.dart';
import '../home/home_page.dart';
import 'gender_selection_screen.dart';
import '../auth/signupverify/verify1.dart'; // Add this import at the top of the file
import '../auth/signupverify/linkedindetails.dart'; // Add this import at the top of the file

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

// In SignUpPage
  void _handleSignUp() {
    // Basic validation
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    // Navigate to Verify1Screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Verify1Screen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Color(0xFF020611)),
          child: Stack(
            children: [
              Positioned(
                left: -screenWidth * 0.5,
                top: -screenHeight * 0.2,
                child: Container(
                  width: screenWidth * 2,
                  height: screenHeight * 0.5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Colors.white.withOpacity(0), Colors.white],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: screenHeight * 0.25,
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.75,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Color(0xFF0F1728),
                                    fontSize: 28,
                                    fontFamily: 'Satoshi Variable',
                                    fontWeight: FontWeight.w700,
                                    height: 1.29,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: 54,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              decoration: ShapeDecoration(
                                                color: Color(0xFFF2F3F6),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                              ),
                                              child: TextField(
                                                controller: _nameController,
                                                decoration: InputDecoration(
                                                  hintText: 'First Name',
                                                  hintStyle: TextStyle(
                                                    color: Color(0xFF667084),
                                                    fontSize: 13,
                                                    fontFamily: 'Public Sans',
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.38,
                                                    letterSpacing: -0.08,
                                                  ),
                                                  border: InputBorder.none,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Container(
                                              height: 54,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              decoration: ShapeDecoration(
                                                color: Color(0xFFF2F3F6),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                              ),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  hintText: 'Last Name',
                                                  hintStyle: TextStyle(
                                                    color: Color(0xFF667084),
                                                    fontSize: 13,
                                                    fontFamily: 'Public Sans',
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.38,
                                                    letterSpacing: -0.08,
                                                  ),
                                                  border: InputBorder.none,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      width: double.infinity,
                                      height: 54,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFF2F3F6),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: TextField(
                                        controller: _emailController,
                                        decoration: InputDecoration(
                                          hintText: 'Email address',
                                          hintStyle: TextStyle(
                                            color: Color(0xFF667084),
                                            fontSize: 13,
                                            fontFamily: 'Public Sans',
                                            fontWeight: FontWeight.w400,
                                            height: 1.38,
                                            letterSpacing: -0.08,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      width: double.infinity,
                                      height: 54,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFF2F3F6),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: TextField(
                                        controller: _passwordController,
                                        obscureText: !_isPasswordVisible,
                                        decoration: InputDecoration(
                                          hintText: 'Password',
                                          hintStyle: TextStyle(
                                            color: Color(0xFF667084),
                                            fontSize: 13,
                                            fontFamily: 'Public Sans',
                                            fontWeight: FontWeight.w400,
                                            height: 1.38,
                                            letterSpacing: -0.08,
                                          ),
                                          border: InputBorder.none,
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              _isPasswordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Color(0xFF667084),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _isPasswordVisible =
                                                    !_isPasswordVisible;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      width: double.infinity,
                                      height: 54,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFF2F3F6),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: TextField(
                                        controller: _confirmPasswordController,
                                        obscureText: !_isConfirmPasswordVisible,
                                        decoration: InputDecoration(
                                          hintText: 'Confirm Password',
                                          hintStyle: TextStyle(
                                            color: Color(0xFF667084),
                                            fontSize: 13,
                                            fontFamily: 'Public Sans',
                                            fontWeight: FontWeight.w400,
                                            height: 1.38,
                                            letterSpacing: -0.08,
                                          ),
                                          border: InputBorder.none,
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              _isConfirmPasswordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Color(0xFF667084),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _isConfirmPasswordVisible =
                                                    !_isConfirmPasswordVisible;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                              Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      height: 32,
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  'By registering, you accept our',
                                              style: TextStyle(
                                                color: Color(0xFF6B7280),
                                                fontSize: 11,
                                                fontFamily: 'SF Pro Text',
                                                fontWeight: FontWeight.w400,
                                                height: 1.18,
                                                letterSpacing: 0.07,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' ',
                                              style: TextStyle(
                                                color: Color(0xFF6B7280),
                                                fontSize: 11,
                                                fontFamily: 'SF Pro Text',
                                                fontWeight: FontWeight.w700,
                                                height: 1.18,
                                                letterSpacing: 0.07,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'Terms & Conditions',
                                              style: TextStyle(
                                                color: Color(0xFF4BBDD8),
                                                fontSize: 11,
                                                fontFamily: 'SF Pro Text',
                                                fontWeight: FontWeight.w700,
                                                height: 1.18,
                                                letterSpacing: 0.07,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' ',
                                              style: TextStyle(
                                                color: Color(0xFF4BBDD8),
                                                fontSize: 11,
                                                fontFamily: 'SF Pro Text',
                                                fontWeight: FontWeight.w400,
                                                height: 1.18,
                                                letterSpacing: 0.07,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'and',
                                              style: TextStyle(
                                                color: Color(0xFF6B7280),
                                                fontSize: 11,
                                                fontFamily: 'SF Pro Text',
                                                fontWeight: FontWeight.w400,
                                                height: 1.18,
                                                letterSpacing: 0.07,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' ',
                                              style: TextStyle(
                                                color: Color(0xFF4BBDD8),
                                                fontSize: 11,
                                                fontFamily: 'SF Pro Text',
                                                fontWeight: FontWeight.w400,
                                                height: 1.18,
                                                letterSpacing: 0.07,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'Privacy Policy',
                                              style: TextStyle(
                                                color: Color(0xFF4BBDD8),
                                                fontSize: 11,
                                                fontFamily: 'SF Pro Text',
                                                fontWeight: FontWeight.w700,
                                                height: 1.18,
                                                letterSpacing: 0.07,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  '. Your data will be securely encrypted with TLS. 🔒',
                                              style: TextStyle(
                                                color: Color(0xFF6B7280),
                                                fontSize: 11,
                                                fontFamily: 'SF Pro Text',
                                                fontWeight: FontWeight.w400,
                                                height: 1.18,
                                                letterSpacing: 0.07,
                                              ),
                                            ),
                                          ],
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    TextButton(
                                      onPressed: _handleSignUp,
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        minimumSize: Size.zero,
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        height: 44,
                                        padding: const EdgeInsets.all(12),
                                        decoration: ShapeDecoration(
                                          color: Color(0xFF4BBDD8),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Sign Up',
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
                                    const SizedBox(height: 4),
                                    Container(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Already have an account?',
                                            style: TextStyle(
                                              color: Color(0xFF667084),
                                              fontSize: 12,
                                              fontFamily: 'Public Sans',
                                              fontWeight: FontWeight.w500,
                                              height: 1.50,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            'Login',
                                            style: TextStyle(
                                              color: Color(0xFF4BBDD8),
                                              fontSize: 12,
                                              fontFamily: 'Public Sans',
                                              fontWeight: FontWeight.w500,
                                              height: 1.50,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(width: 8),
                            Text(
                              'OR',
                              style: TextStyle(
                                color: Color(0xFF667084),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 1.50,
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
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
                              'Sign up with Linkedin',
                              style: TextStyle(
                                color: Color(0xFF6B7280),
                                fontSize: 14,
                                fontFamily: 'Public Sans',
                                fontWeight: FontWeight.w500,
                                height: 1.43,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
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
                              width: 24,
                              height: 24,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: FlutterLogo(),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Sign up with Google',
                              style: TextStyle(
                                color: Color(0xFF6B7280),
                                fontSize: 14,
                                fontFamily: 'Public Sans',
                                fontWeight: FontWeight.w500,
                                height: 1.43,
                              ),
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
        ),
      ),
    );
  }
}
