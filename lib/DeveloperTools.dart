import 'package:flutter/material.dart';

class DeveloperTools extends StatelessWidget {
  final double width;
  final double height;

  const DeveloperTools({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: width * 0.6,
      child: Stack(
        children: [
          Opacity(
            opacity: 0.4,
            child: Image.asset(
              "Assets/WhatsApp Image 2025-06-11 at 9.31.01 AM (1) 1.png",
              fit: BoxFit.contain,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.04,
            ),
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
                    'DEVELOPER TOOLS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.08),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: width * 0.7,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Assets/Group 172.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
