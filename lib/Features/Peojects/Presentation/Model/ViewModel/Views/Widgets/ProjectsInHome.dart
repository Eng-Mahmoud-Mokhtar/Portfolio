import 'package:flutter/material.dart';
import '../../../../../../Core/Constants/app_colors.dart';
import '../../../../../../Core/Utils/AppSizes.dart';
import '../../../../../../Core/Utils/AppTextStyles.dart';
import '../../../../../../Core/Widgets/ReusableSectionHeader.dart';
import '../ListOfProjects.dart';
import 'AllProjects.dart';
import 'ProjectDetails.dart';
import 'Widgets/ProjectCard.dart';

class ProjectsSection extends StatelessWidget {
  final double width;
  final double height;
  final bool isMobile;

  const ProjectsSection({
    super.key,
    required this.width,
    required this.height,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final cardWidth =
    isMobile
        ? (width - 3 * AppSizes.getPadding(context)) / 2
        : (width - 5 * AppSizes.getPadding(context)) / 4;
    final homeProjects = projects.take(4).toList();

    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.getPadding(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableSectionHeader(
              title: 'PROJECTS',
              height: height,
              isMobile: isMobile,
            ),
            SizedBox(height: height * 0.03),
            SizedBox(height: AppSizes.getSectionSpacing(context)),
            Wrap(
              spacing: AppSizes.getPadding(context),
              runSpacing: AppSizes.getSectionSpacing(context),
              crossAxisAlignment: WrapCrossAlignment.center,
              children:
              homeProjects.asMap().entries.map((entry) {
                final project = entry.value;
                return ProjectCard(
                  width: cardWidth,
                  height: height,
                  isMobile: isMobile,
                  appName: project.name,
                  imagePath: project.imagePath,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                            ProjectDetails(project: project),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: height * 0.03),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AllProjectsPage(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.02,
                    horizontal: AppSizes.getPadding(context) * 1.5,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(
                      isMobile ? width * 0.1 : 40,
                    ),
                    gradient: AppColor.sectionGradient,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'See all Projects',
                        style: AppTextStyles.sectionTitle(
                          context,
                          isMobile: isMobile,
                        ),
                      ),
                      SizedBox(width: AppSizes.getPadding(context) * 0.5),
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        size: AppSizes.getSmallFontSize(
                          context,
                          isMobile: isMobile,
                        ),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
