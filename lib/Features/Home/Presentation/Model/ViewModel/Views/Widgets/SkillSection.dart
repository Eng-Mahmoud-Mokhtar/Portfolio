import 'package:flutter/material.dart';
import '../../../../../../Core/Utils/AppSizes.dart';
import '../../../../../../Core/Widgets/ReusableSectionHeader.dart';

class SkillSection extends StatelessWidget {
  final double width;
  final double height;
  final bool isMobile;

  const SkillSection({
    super.key,
    required this.width,
    required this.height,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.getPadding(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableSectionHeader(
              title: 'SKILLS',
              height: height,
              isMobile: isMobile,
            ),
            SizedBox(height: height * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppSizes.getSmallFontSize(
                        context,
                        isMobile: isMobile,
                      ),
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
                        text:
                        'UI implementation, clean architecture, performance optimization\n',
                      ),
                      TextSpan(
                        text: '• State Management: ',
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: 'Provider, Bloc, GetX\n'),
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
                      TextSpan(text: 'Figma (Intermediate level)\n'),
                      TextSpan(
                        text: '• Soft Skills: ',
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                        'Problem-solving, Team Collaboration, Communication, Creative Thinking\n',
                      ),
                    ],
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
