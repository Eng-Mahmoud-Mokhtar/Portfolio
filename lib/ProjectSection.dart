import 'package:flutter/material.dart';

class ProjectsSection extends StatelessWidget {
  final double width;
  final double height;

  const ProjectsSection({
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
                'PROJECTS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: height * 0.06),
            Wrap(
              spacing: width * 0.04,
              runSpacing: height * 0.06,
              children: [
                _ProjectCard(
                  width: width,
                  height: height,
                  appName: 'Social App',
                  imagePath: 'Assets/WhatsApp_Image_2025-06-14_at_5.31.40_PM-removebg-preview 1.png',
                ),
                _ProjectCard(
                  width: width,
                  height: height,
                  appName: 'E-Commerce',
                  imagePath: 'Assets/WhatsApp_Image_2025-06-14_at_5.31.41_PM-removebg-preview 1.png',
                ),
                _ProjectCard(
                  width: width,
                  height: height,
                  appName: 'Fitness Tracker',
                  imagePath: 'Assets/WhatsApp_Image_2025-06-14_at_5.40.49_PM__3_-removebg-preview 1.png',
                ),
                _ProjectCard(
                  width: width,
                  height: height,
                  appName: 'Task Manager',
                  imagePath: 'Assets/WhatsApp_Image_2025-06-14_at_6.34.35_PM-removebg-preview 1.png',
                ),
                Center(
                  child: Container(
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'See all Projects',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: width * 0.02),
                        const Icon(
                          Icons.arrow_circle_right_outlined,
                          size: 15,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final double width;
  final double height;
  final String appName;
  final String imagePath;

  const _ProjectCard({
    required this.width,
    required this.height,
    required this.appName,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    double cardWidth = (width - width * 0.1) / 2;
    double titleHeight = height * 0.05;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: cardWidth,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF2B2E4C),
                Color(0xFF0F1236),
              ],
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: titleHeight / 2),
              Padding(
                padding: EdgeInsets.all(cardWidth * 0.06),
                child: Container(
                  height: cardWidth * 0.88,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.006,
                  horizontal: width * 0.035,
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
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: width * 0.03,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(
                      Icons.arrow_circle_right_outlined,
                      color: Colors.white,
                      size: 15,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),

        Positioned(
          top: -titleHeight / 2,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.01,
                horizontal: width * 0.05,
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
              ),
              child: Text(
                appName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}