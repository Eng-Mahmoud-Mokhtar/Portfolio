import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  final double width;
  final double height;
  final double imageSize;
  final Animation<double> profileAnimation;

  const ProfileSection({
    super.key,
    required this.width,
    required this.height,
    required this.imageSize,
    required this.profileAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              AnimatedBuilder(
                animation: profileAnimation,
                builder: (context, child) {
                  return Positioned(
                    top: profileAnimation.value,
                    child: child!,
                  );
                },
                child: Image.asset(
                  'assets/Group 156.png',
                  width: width * 0.15,
                  height: width * 0.15,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                right: -width * 0.12,
                bottom: width * 0.05,
                child: Image.asset(
                  'assets/Ellipse 18.png',
                  width: width * 0.3,
                  height: width * 0.2,
                  fit: BoxFit.contain,
                ),
              ),
              CircleAvatar(
                radius: imageSize * 0.6,
                backgroundImage: const AssetImage(
                  'Assets/WhatsApp Image 2025-06-15 at 3.17.50 PM.jpeg',
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.03),
          Text(
            'Mahmoud Mokhtar',
            style: TextStyle(
              fontSize: width * 0.045,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: height * 0.015),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.1),
            child: Text(
              'Flutter Developer | BSc in AI | +2 Yrs Experience',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: width * 0.035,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}