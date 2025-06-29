import 'package:flutter/material.dart';
import '../../../../../../Core/Constants/app_colors.dart';
import '../../../../../../Core/Utils/AppSizes.dart';
import '../../../../../../Core/Utils/AppTextStyles.dart';
import '../../../../../../Home.dart';
import '../../../../../AllProject/Presentation/Model/Project.dart';


class ProjectDetails extends StatelessWidget {
  final Project project;

  const ProjectDetails({super.key, required this.project});

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
                      title: project.name,
                      height: height,
                      isMobile: isMobile,
                      showBackButton: true,
                    ),
                    SizedBox(height: AppSizes.getSectionSpacing(context)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.getPadding(context),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Colors.lightBlueAccent, Colors.white],
                              ).createShader(bounds);
                            },
                            child: Text(
                              'Description:',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: isMobile ? height * 0.02 : 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          Text(
                            project.description,
                            style: AppTextStyles.bodyText(
                              context,
                              isMobile: isMobile,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSizes.getSectionSpacing(context)),
                    Container(
                      height: cardWidth * 1.5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(project.imagePath),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.lightBlueAccent, Colors.white],
                        ).createShader(bounds);
                      },
                      child: Text(
                        'Technologies:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? height * 0.02 : 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    Wrap(
                      spacing: width * 0.02,
                      runSpacing: height * 0.015,
                      children:
                      project.technologies
                          .split(',')
                          .map(
                            (tech) => Container(
                          padding: EdgeInsets.symmetric(
                            vertical: height * 0.008,
                            horizontal: width * 0.04,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: AppColor.sectionGradient,
                            border: Border.all(color: Colors.white),
                          ),
                          child: Text(
                            tech.trim(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                              isMobile
                                  ? width * 0.03
                                  : width * 0.015,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                          .toList(),
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
