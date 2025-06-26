import 'package:flutter/material.dart';

class AboutMeSection extends StatelessWidget {
  final double width;
  final double height;

  const AboutMeSection({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.015,
                horizontal: width * 0.06,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(40),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF07081F),
                    Color(0xFF0F1236),
                    Color(0xFF181957),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.lightBlueAccent.withOpacity(0.6),
                    blurRadius: 25,
                    spreadRadius: 5,
                    offset: Offset.zero,
                  ),
                ],
              ),
              child: Text(
                'ABOUT ME',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            Text(
              'Professional Flutter Developer | 2 Years of Experience.\n'
                  'I hold a Bachelor\'s degree in Artificial Intelligence and specialize in building scalable, high-performance Flutter apps.\n'
                  'I have built 10+ apps and integrated smart AI features such as facial recognition and location-based services.\n'
                  'Strong in state management (Bloc, GetX) and performance optimization.',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: width * 0.03,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}