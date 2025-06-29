import 'package:flutter/material.dart';
import '../../../../../../Core/Utils/AppSizes.dart';
import '../../../../../../Home.dart';
import '../../../../../ProjectDetails/Presentation/Model/ViewModel/Views/ProjectDetails.dart';
import '../ListOfProjects.dart';
import 'Widgets/ProjectCard.dart';

class AllProjectsPage extends StatelessWidget {
  const AllProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isMobile = width < 600;
    final cardWidth =
    isMobile
        ? (width - 3 * AppSizes.getPadding(context)) / 2
        : (width - 5 * AppSizes.getPadding(context)) / 4;

    return Scaffold(
      body: SafeArea(
        child: AnimatedBackground(
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.getPadding(context),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSizes.getSectionSpacing(context)),
                    ReusableSectionHeader(
                      title: 'ALL PROJECTS',
                      height: height,
                      isMobile: isMobile,
                      showBackButton: true,
                    ),
                    SizedBox(height: AppSizes.getSectionSpacing(context)),
                    Wrap(
                      spacing: AppSizes.getPadding(context),
                      runSpacing: AppSizes.getSectionSpacing(context),
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children:
                      projects.asMap().entries.map((entry) {
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
                                    (context) => ProjectDetails(
                                  project: project,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: AppSizes.getSectionSpacing(context)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
