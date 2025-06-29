import 'package:flutter/material.dart';
import '../../../../../../Core/Utils/AppSizes.dart';
import '../../../../../../Core/Utils/AppTextStyles.dart';
import '../../../../../../Core/Widgets/ReusableSectionHeader.dart';

class WorkExperience extends StatelessWidget {
  final double width;
  final double height;
  final bool isMobile;

  const WorkExperience({
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
              title: 'WORK EXPERIENCE',
              height: height,
              isMobile: isMobile,
            ),
            SizedBox(height: height * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: AppTextStyles.bodyText(context, isMobile: isMobile),
                    children: [
                      TextSpan(
                        text: 'FREELANCE\n',
                        style: AppTextStyles.highlightedText(
                          context,
                          isMobile: isMobile,
                        ),
                      ),
                      const TextSpan(
                        text:
                        'Flutter Developer | AI Engineer\n'
                            'Delivered custom mobile apps using Flutter based on client needs.\n'
                            'Implemented AI-driven features where applicable.\n'
                            'Ensured client satisfaction through problem-solving and clear communication.\n\n',
                      ),
                      TextSpan(
                        text: 'TREND SOCIAL ',
                        style: AppTextStyles.highlightedText(
                          context,
                          isMobile: isMobile,
                        ),
                      ),
                      TextSpan(
                        text: '(Oct 2023 - Present)\n',
                        style: AppTextStyles.italicText(
                          context,
                          isMobile: isMobile,
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
          ],
        ),
      ),
    );
  }
}