import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  final double width;
  final double height;

  const SkillsSection({
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
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: -width * 0.028,
              bottom: -width * 0.03,
              child: Opacity(
                opacity: 0.4,
                child: Image.asset(
                  'Assets/WhatsApp_Image_2025-06-11_at_9.31.00_AM-removebg-preview 1.png',
                  height: width * 0.5,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Column(
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
                    'SKILLS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.03,
                          height: 1.6,
                        ),
                        children: const [
                          TextSpan(
                            text: '• Flutter Development: ',
                            style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'UI implementation, clean architecture, performance optimization\n',
                          ),
                          TextSpan(
                            text: '• State Management: ',
                            style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'Provider, Bloc, GetX\n',
                          ),
                          TextSpan(
                            text: '• Tools & Platforms: ',
                            style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'Firebase, REST APIs, Postman, Git, GitHub\n',
                          ),
                          TextSpan(
                            text: '• UI/UX Design: ',
                            style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'Figma (Intermediate level)\n',
                          ),
                          TextSpan(
                            text: '• Soft Skills: ',
                            style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'Problem-solving, Team Collaboration, Communication, Creative Thinking\n',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
              ],
            ),
          ],
        ),
      ),
    );
  }
}