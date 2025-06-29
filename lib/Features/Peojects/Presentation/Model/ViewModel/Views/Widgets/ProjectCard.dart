import 'package:flutter/material.dart';

import '../../../../../../../Core/Constants/app_colors.dart';
import '../../../../../../../Core/Utils/AppSizes.dart';
import '../../../../../../../Core/Utils/AppTextStyles.dart';
import '../../../../../../../Home.dart';


class ProjectCard extends StatelessWidget {
  final double width;
  final double height;
  final bool isMobile;
  final String appName;
  final String imagePath;
  final VoidCallback onTap;

  const ProjectCard({super.key,
    required this.width,
    required this.height,
    required this.isMobile,
    required this.appName,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double titleHeight = height * 0.05;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: width,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(40),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF2B2E4C), Color(0xFF0F1236)],
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: titleHeight / 2),
                Padding(
                  padding: EdgeInsets.all(AppSizes.getPadding(context) * 0.5),
                  child: Container(
                    height: width * 0.8,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.getPadding(context)),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.005,
                    horizontal: AppSizes.getPadding(context),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(40),
                    gradient: AppColor.sectionGradient,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Details',
                        style: AppTextStyles.bodyText(
                          context,
                          isMobile: isMobile,
                        ).copyWith(fontWeight: FontWeight.w300),
                      ),
                      SizedBox(width: AppSizes.getPadding(context) * 0.5),
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Colors.white,
                        size: AppSizes.getSmallFontSize(
                          context,
                          isMobile: isMobile,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSizes.getPadding(context)),
              ],
            ),
          ),
          Positioned(
            top: -titleHeight / 2.0,
            left: 0,
            right: 0,
            child: Center(
              child: ReusableProjectHeader(
                title: appName,
                height: height,
                isMobile: isMobile,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
