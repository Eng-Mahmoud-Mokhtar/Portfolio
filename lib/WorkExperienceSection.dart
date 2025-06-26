import 'package:flutter/material.dart';

class WorkExperienceSection extends StatelessWidget {
  final double width;
  final double height;

  const WorkExperienceSection({
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
              right: -width * 0.1,
              bottom: -width * 0.02,
              child: Opacity(
                opacity: 0.4,
                child: Image.asset(
                  'assets/ropot 2.png',
                  width: width * 0.7,
                  height: width * 0.7,
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
                    'WORK EXPERIENCE',
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
                        children: [
                          const TextSpan(
                            text: 'FREELANCE\n',
                            style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                            text:
                            'Flutter Developer | AI Engineer\n'
                                'Delivered custom mobile apps using Flutter based on client needs.\n'
                                'Implemented AI-driven features where applicable.\n'
                                'Ensured client satisfaction through problem-solving and clear communication.\n\n',
                          ),
                          const TextSpan(
                            text: 'TREND SOCIAL',
                            style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                            text: '  ',
                          ),
                          TextSpan(
                            text: '(Oct 2023 - Present)\n',
                            style: TextStyle(
                              color: Colors.white70,
                              fontStyle: FontStyle.italic,
                              fontSize: width * 0.028,
                            ),
                          ),
                          const TextSpan(
                            text:
                            '• Leader of the developer team\n'
                                '• Flutter Developer\n'
                                '• AI Engineer',
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