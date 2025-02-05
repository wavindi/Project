import 'package:flutter/material.dart';
import 'verify2.dart';

class Verify1Screen extends StatelessWidget {
  const Verify1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background circles pattern
              Positioned(
                left: -size.width * 0.06,
                top: -size.height * 0.11,
                child: Opacity(
                  opacity: 0.20,
                  child: SizedBox(
                    width: size.width * 1.13,
                    height: size.height * 0.3,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final circleSize = constraints.maxWidth * 0.24;
                        return Stack(
                          children: [
                            _buildCircle(
                                left: 0,
                                top: circleSize * 0.61,
                                size: circleSize,
                                color: const Color(0xFF4BBDD8)),
                            _buildCircle(
                                left: circleSize * 0.13,
                                top: circleSize * 1.26,
                                size: circleSize,
                                color: const Color(0xFF4BBDD8)),
                            _buildCircle(
                                left: circleSize * 1.2,
                                top: circleSize * 1.2,
                                size: circleSize,
                                color: const Color(0xFF4BBDD8)),
                            _buildCircle(
                                left: circleSize * 1.76,
                                top: circleSize * 1.2,
                                size: circleSize,
                                color: const Color(0xFF4BBDD8)),
                            _buildCircle(
                                left: circleSize * 1.1,
                                top: circleSize * 0.2,
                                size: circleSize,
                                color: const Color(0xFF0079A2)),
                            _buildCircle(
                                left: circleSize * 0.2,
                                top: 0,
                                size: circleSize,
                                color: const Color(0xFF0079A2)),
                            _buildCircle(
                                left: circleSize * 2.1,
                                top: circleSize * 0.33,
                                size: circleSize,
                                color: const Color(0xFFFA8892)),
                            _buildCircle(
                                left: circleSize * 1.89,
                                top: circleSize * 1.17,
                                size: circleSize,
                                color: const Color(0xFFFA8892)),
                            _buildCircle(
                                left: circleSize * 3.22,
                                top: circleSize * 1.46,
                                size: circleSize,
                                color: const Color(0xFFFFAAB4)),
                            _buildCircle(
                                left: circleSize * 2.78,
                                top: circleSize * 1.46,
                                size: circleSize,
                                color: const Color(0xFFFFAAB4)),
                            _buildCircle(
                                left: circleSize * 2.5,
                                top: circleSize * 0.26,
                                size: circleSize,
                                color: const Color(0xFFD85962)),
                            _buildCircle(
                                left: circleSize * 3.25,
                                top: circleSize * 0.37,
                                size: circleSize,
                                color: const Color(0xFFD85962)),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),

              // Main content
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.043),
                child: Column(
                  children: [
                    // Back button
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                        padding: EdgeInsets.only(top: size.height * 0.02),
                      ),
                    ),

                    // Title and description
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Connect to your companys plan',
                            style: TextStyle(
                              color: const Color(0xFF0F1728),
                              fontSize: size.width * 0.08,
                              fontFamily: 'Public Sans',
                              fontWeight: FontWeight.w700,
                              height: 1.27,
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Text(
                            'Enter your work email to link your account and access your company'
                            's exclusive benefits. We will send you a verification code to this email.',
                            style: TextStyle(
                              color: const Color(0xFF667084),
                              fontSize: size.width * 0.037,
                              fontFamily: 'Public Sans',
                              fontWeight: FontWeight.w600,
                              height: 1.43,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Email input field
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: size.height * 0.02),
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.032,
                        vertical: size.height * 0.015,
                      ),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF2F3F6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Work Email address',
                          hintStyle: TextStyle(
                            color: const Color(0xFF667084),
                            fontSize: size.width * 0.035,
                            fontFamily: 'Public Sans',
                            fontWeight: FontWeight.w400,
                            height: 1.38,
                            letterSpacing: -0.08,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    const Spacer(),

                    // Continue button
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: padding.bottom + size.height * 0.02),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Verify2Screen(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.015,
                            horizontal: size.width * 0.032,
                          ),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF4BBDD8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          child: Text(
                            'Continue',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * 0.043,
                              fontFamily: 'Public Sans',
                              fontWeight: FontWeight.w500,
                              height: 1.50,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircle({
    required double left,
    required double top,
    required double size,
    required Color color,
  }) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: size,
        height: size,
        decoration: ShapeDecoration(
          color: color,
          shape: const OvalBorder(),
        ),
      ),
    );
  }
}
