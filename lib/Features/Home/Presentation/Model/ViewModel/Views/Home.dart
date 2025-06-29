import 'package:flutter/material.dart';
import '../../../../Core/Utils/AppSizes.dart';
import '../../../../Home.dart';
import '../../../AboutMe/Presentation/Model/ViewModel/Views/AboutMe.dart';
import '../../../ConectMe/View/ViewModel/ConectMe.dart';
import '../../../DeveloperTools/View/ViewModel/DeveloperTools.dart';
import '../../../SkillSection/Presentation/Model/ViewModel/Views/SkillSection.dart';
import '../../../WorkExperience/Presentation/Model/ViewModel/Views/WorkExperience.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController _profileAnimationController;
  late Animation<double> _profileAnimation;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _profileAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);

    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _profileAnimationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final isMobile = width < 600;
    final imageSize = AppSizes.getImageSize(context);

    _profileAnimation = Tween<double>(
      begin: -imageSize * 0.2,
      end: imageSize * 0.1,
    ).animate(
      CurvedAnimation(
        parent: _profileAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: AnimatedBackground(
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 80),
                ProfileSection(
                  width: width,
                  height: height,
                  imageSize: imageSize,
                  profileAnimation: _profileAnimation,
                  isMobile: isMobile,
                ),
                SizedBox(height: AppSizes.getSectionSpacing(context)),
                AboutMe(
                  width: width,
                  height: height,
                  isMobile: isMobile,
                ),
                SizedBox(height: AppSizes.getSectionSpacing(context)),
                WorkExperience(
                  width: width,
                  height: height,
                  isMobile: isMobile,
                ),
                SizedBox(height: AppSizes.getSectionSpacing(context)),
                SkillSection(width: width, height: height, isMobile: isMobile),
                SizedBox(height: AppSizes.getSectionSpacing(context)),
                ProjectsSection(
                  width: width,
                  height: height,
                  isMobile: isMobile,
                ),
                SizedBox(height: AppSizes.getSectionSpacing(context)),
                DeveloperTools(
                  width: width,
                  height: height,
                  isMobile: isMobile,
                ),
                SizedBox(height: AppSizes.getSectionSpacing(context)),
                ContactUsView(
                  width: width,
                  height: height,
                ),
                SizedBox(height: AppSizes.getSectionSpacing(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}