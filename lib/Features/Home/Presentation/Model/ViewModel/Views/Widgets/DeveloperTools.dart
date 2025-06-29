import 'package:flutter/cupertino.dart';

import '../../../../Core/Utils/AppSizes.dart';
import '../../../../Core/Widgets/ReusableSectionHeader.dart';

class DeveloperTools extends StatelessWidget {
  final double width;
  final double height;
  final bool isMobile;

  const DeveloperTools({
    super.key,
    required this.width,
    required this.height,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: isMobile ? width * 0.7 : 400,
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.4,
              child: Image.asset(
                "Assets/WhatsApp Image 2025-06-11 at 9.31.01 AM (1) 1.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.getPadding(context),
              vertical: isMobile ? height * 0.02 : height * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableSectionHeader(
                  title: 'DEVELOPER TOOLS',
                  height: height,
                  isMobile: isMobile,
                ),
                SizedBox(height: isMobile ? height * 0.03 : 60),
              ],
            ),
          ),
          Positioned(
            top: isMobile ? 80 : 100,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: isMobile ? width * 0.6 : 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("Assets/Group 172.png"),
                  fit: BoxFit.contain,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
