import 'package:flutter/material.dart';
import '../../../../../../Core/Utils/AppSizes.dart';
import '../../../../../../Core/Utils/AppTextStyles.dart';
import '../../../../../../Core/Widgets/ReusableSectionHeader.dart';

class AboutMe extends StatelessWidget {
  final double width;
  final double height;
  final bool isMobile;

  const AboutMe({
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
              title: 'ABOUT ME',
              height: height,
              isMobile: isMobile,
            ),
            SizedBox(height: height * 0.03),
            Text(
              'Professional Flutter Developer | 2 Years of Experience.\n'
                  'I hold a Bachelor\'s degree in Artificial Intelligence and specialize in building scalable, high-performance Flutter apps.\n'
                  'I have built 10+ apps and integrated smart AI features such as facial recognition and location-based services.\n'
                  'Strong in state management (Bloc, GetX) and performance optimization.',
              style: AppTextStyles.bodyText(context, isMobile: isMobile),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
