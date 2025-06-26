import 'dart:math';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppSizes {
  static double getFontSize(BuildContext context, {required bool isMobile}) {
    final width = MediaQuery.of(context).size.width;
    return isMobile ? width * 0.045 : min(width * 0.03, 18);
  }

  static double getSmallFontSize(
      BuildContext context, {
        required bool isMobile,
      }) {
    final width = MediaQuery.of(context).size.width;
    return isMobile ? width * 0.03 : min(width * 0.035, 20);
  }

  static double getPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 600 ? width * 0.03 : 16;
  }

  static double getImageSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 600 ? width * 0.3 : 180;
  }

  static double getCardWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 600 ? width * 0.5 : width * 0.50;
  }

  static double getSectionSpacing(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return height < 600 ? height * 0.05 : 50; // Reduced spacing
  }

  static int getProjectGridCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 400) return 1;
    if (width < 600) return 2;
    return 3;
  }

  static double getMaxContentWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return min(width * 0.9, 1200);
  }
}

class AppTheme {
  static const LinearGradient sectionGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF07081F),
      Color(0xFF0F1236),
      Color(0xFF181957),
    ],
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.black,
      Color(0xFF07081F),
      Color(0xFF0F1236),
      Color(0xFF181957),
      Color(0xFF0F1236),
      Color(0xFF07081F),
      Colors.black,
    ],
  );
}

class AppTextStyles {
  static TextStyle sectionTitle(BuildContext context, {required bool isMobile}) {
    return TextStyle(
      color: Colors.white,
      fontSize: AppSizes.getSmallFontSize(context, isMobile: isMobile),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle bodyText(BuildContext context, {required bool isMobile}) {
    return TextStyle(
      color: Colors.white,
      fontSize: AppSizes.getSmallFontSize(context, isMobile: isMobile),
      height: 1.5,
    );
  }

  static TextStyle bodyTextSmall(BuildContext context, {required bool isMobile}) {
    return TextStyle(
      color: Colors.white,
      fontSize: AppSizes.getSmallFontSize(context, isMobile: isMobile) * 0.9,
      height: 1.5,
    );
  }

  static TextStyle italicText(BuildContext context, {required bool isMobile}) {
    return TextStyle(
      color: Colors.white70,
      fontStyle: FontStyle.italic,
      fontSize: AppSizes.getSmallFontSize(context, isMobile: isMobile) * 0.9,
    );
  }

  static TextStyle highlightedText(BuildContext context, {required bool isMobile}) {
    return TextStyle(
      color: Colors.lightBlueAccent,
      fontWeight: FontWeight.bold,
      fontSize: AppSizes.getSmallFontSize(context, isMobile: isMobile),
    );
  }
}

class ReusableProjectHeader extends StatelessWidget {
  final String title;
  final double height;
  final bool isMobile;

  const ReusableProjectHeader({
    super.key,
    required this.title,
    required this.height,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.01,
        horizontal: AppSizes.getPadding(context) * 1.5,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(40),
        gradient: AppTheme.sectionGradient,
      ),
      child: Text(
        title,
        style: AppTextStyles.sectionTitle(context, isMobile: isMobile),
      ),
    );
  }
}
class ReusablePositionedImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  final bool isMobile;
  final double? left;
  final double? right;
  final double? bottom;
  final double opacity;

  const ReusablePositionedImage({
    super.key,
    required this.imagePath,
    required this.width,
    required this.height,
    required this.isMobile,
    this.left,
    this.right,
    this.bottom,
    this.opacity = 0.4,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      right: right,
      bottom: bottom,
      child: Opacity(
        opacity: opacity,
        child: Image.asset(
          imagePath,
          width: isMobile ? width * 0.7 : 350,
          height: isMobile ? width * 0.7 : 350,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
class ReusableSectionHeader extends StatelessWidget {
  final String title;
  final double height;
  final bool isMobile;
  final bool showBackButton;

  const ReusableSectionHeader({
    super.key,
    required this.title,
    required this.height,
    required this.isMobile,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: showBackButton ? height * 0.015 : height * 0.02,
        horizontal: AppSizes.getPadding(context) * 1.5, // Consistent horizontal padding
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(40),
        gradient: AppTheme.sectionGradient,
        boxShadow: [
          BoxShadow(
            color: Colors.lightBlueAccent.withOpacity(0.6),
            blurRadius: 25,
            spreadRadius: 5,
            offset: Offset.zero,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
        children: [
          if (showBackButton) ...[
            SizedBox(
              width: isMobile ? width * 0.05 : 20,
              height: isMobile ? width * 0.05 : 20,
              child: IconButton(
                padding: EdgeInsets.zero, // Minimize extra space
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.white,
                  size: isMobile ? width * 0.03 : 20,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
              ),
            ),
            SizedBox(width: AppSizes.getPadding(context) * 0.5),
          ],
          Text(
            title,
            style: AppTextStyles.sectionTitle(context, isMobile: isMobile),
          ),
        ],
      ),
    );
  }
}
class Project {
  final String name;
  final String imagePath;
  final String description;
  final String technologies;

  Project({
    required this.name,
    required this.imagePath,
    required this.description,
    required this.technologies,
  });
}

final List<Project> projects = [
  Project(
    name: 'Skin Scan Tech',
    imagePath: 'Assets/Frame 1000004482.png',
    description:
    'تطبيق طبي مبتكر يستخدم الذكاء الاصطناعي لتحليل صور الجلد بدقة وتشخيص الحالات الجلدية المختلفة مثل الحروق وسرطان الجلد. يقدّم استشارات طبية ذكية من خلال روبوت دردشة، إلى جانب نظام لتتبع الحالة وتقدم العلاج.',
    technologies: 'Flutter, Firebase, Cubit (Bloc), REST API, WebView, Local Storage, Chatbot Integration',

  ),
  Project(
    name: 'Lumpy Skin Disease',
    imagePath: 'Assets/Frame 1000004480.png',
    description:
    'هو تطبيق ذكي مخصص للأطباء البيطريين ومربي المواشي، يهدف إلى الكشف المبكر والدقيق عن الأمراض الجلدية التي تصيب الحيوانات، خاصة مرض الجلد العقدي المنتشر بين الأبقار.',
    technologies: 'Dart,Flutter, Firebase, Cubit (Bloc), REST API, WebView, Local Storage, Chatbot Integration',
  ),
  Project(
    name: 'Cashier',
    imagePath: 'Assets/Frame 36.png',
    description:
'A desktop application designed specifically for café owners, providing comprehensive management of orders, tables, sales, and inventory. It allows accurate tracking of all operations, easy reporting, and full control over workflow.',
    technologies: 'Dart,Flutter, Getx, REST API, Local Storage'
  ),
  Project(
    name: 'Kayan & Manager',
    imagePath: 'Assets/Frame 1000004478.png',
    description:
    'This app is specifically designed for business owners in the sports sector, providing a comprehensive platform to manage products, handle sales, and promote their businesses through ads and Reels videos. '
        'It ensures a secure environment with verified accounts to build trust and includes powerful tools for tracking orders, monitoring earnings, and securely withdrawing funds. '
        'Perfect for gym owners, sports academies, field managers, and sports store owners aiming to streamline and digitize their operations.',
    technologies: 'Dart, Flutter, Cubit (Bloc), Payment Gateway, RESTful API, Push Notifications,Admin Dashboard',
  ),
  Project(
    name: 'Building Knowledge',
    imagePath: 'Assets/Frame 35.png',
    description:
    'Your all-in-one real estate hub — buy, sell, or rent with trusted brokers, explore top compounds, connect with contractors, interior designers, engineers, and workers. '
        'Access essential construction materials and all government real estate services — smart, seamless, and at your fingertips.',
    technologies: 'Dart, Flutter,Cubit (Bloc),REST API, Google Maps API, Payment Gateway, Admin Dashboard, Push Notifications, Localization, MVVM Architecture,Responsive UI,',
  ),
  Project(
    name: 'YIACO',
    imagePath: 'Assets/Frame 1000004479.png',
    description:
    'An innovative car parking application designed to offer users a seamless parking experience. Customers can request a valet driver to pick up their car, park it, and return it when needed. '
        'The app provides two versions: one for customers and one for valet drivers — all managed through a central dashboard for full control over requests, assignments, and real-time updates. '
        'Each car is linked to a unique barcode for efficient tracking, and secure messaging allows communication between customer and valet. Robust authentication and encryption ensure a safe and reliable user experience.',
    technologies: 'Dart, Flutter,Cubit (Bloc),REST API, Admin Dashboard, Payment Gateway, Google Maps API,Push Notifications, MVVM Architecture, Barcode Scanner, Responsive Design',
  ),
  Project(
    name: 'Tamanena',
    imagePath: 'Assets/WhatsApp_Image_2025-06-14_at_5.31.40_PM-removebg-preview 1.png',
    description:
    'تطبيق شامل للعقارات يتيح البيع والشراء والتأجير من خلال سماسرة موثوقين، بالإضافة إلى خدمات المقاولات والتشطيبات وجميع الخدمات الحكومية.',
    technologies: 'Dart, Flutter, REST API, DateTime Handling, Prayer Times API, Quran API, Quran Audio',

  ),
  Project(
    name: 'MoviesApp',
    imagePath: 'Assets/Frame 1000004481.png',
    description:
    'تطبيق ترفيهي يتيح للمستخدمين استكشاف ومشاهدة أحدث الأفلام والمسلسلات بسهولة، مع واجهة سلسة ونظام بحث وتصنيفات وقائمة مفضلة.',
    technologies: 'Dart, Flutter,Cubit (Bloc), REST API, Responsive UI',

  ),
  Project(
    name: 'WorkZone',
    imagePath: 'Assets/WhatsApp_Image_2025-06-14_at_5.31.40_PM-removebg-preview 1.png',
    description:
    'تطبيق تواصل اجتماعي يتيح المحادثات الفورية والمنشورات، مصمم لربط العاملين في مجال العقارات والإنشاءات بسهولة وسرعة.',
    technologies: 'Flutter, Cubit (Bloc), Post System, Google Maps API, Location-based Attendance,Responsive UI',
  ),
];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController _profileAnimationController;
  late AnimationController _starsAnimationController;
  late Animation<double> _profileAnimation;
  final List<Star> _stars = [];
  final Random _random = Random();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _profileAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);

    _starsAnimationController =
    AnimationController(vsync: this, duration: const Duration(seconds: 20))
      ..addListener(() {
        for (var star in _stars) {
          star.update();
        }
        setState(() {});
      })
      ..repeat();

    for (int i = 0; i < 100; i++) {
      _stars.add(
        Star(
          x: _random.nextDouble(),
          y: _random.nextDouble(),
          size: _random.nextDouble() * 2 + 1,
          opacity: _random.nextDouble() * 0.5 + 0.5,
          speed: _random.nextDouble() * 0.001 + 0.0002,
        ),
      );
    }

    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _profileAnimationController.dispose();
    _starsAnimationController.dispose();
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
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(gradient: AppTheme.backgroundGradient),
          child: Stack(
            children: [
              ..._stars.map(
                    (star) => Positioned(
                  left: star.x * width,
                  top: star.y * height,
                  child: Opacity(
                    opacity: star.opacity,
                    child: Container(
                      width: star.size,
                      height: star.size,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(star.opacity),
                            blurRadius: star.size * 2,
                            spreadRadius: star.size / 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
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
                    AboutMeSection(
                      width: width,
                      height: height,
                      isMobile: isMobile,
                    ),
                    SizedBox(height: AppSizes.getSectionSpacing(context)),
                    WorkExperienceSection(
                      width: width,
                      height: height,
                      isMobile: isMobile,
                    ),
                    SizedBox(height: AppSizes.getSectionSpacing(context)),
                    SkillsSection(
                      width: width,
                      height: height,
                      isMobile: isMobile,
                    ),
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
                    ContactUs(width: width, height: height),
                    SizedBox(height: AppSizes.getSectionSpacing(context)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  final double width;
  final double height;
  final double imageSize;
  final Animation<double> profileAnimation;
  final bool isMobile;

  const ProfileSection({
    super.key,
    required this.width,
    required this.height,
    required this.imageSize,
    required this.profileAnimation,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              AnimatedBuilder(
                animation: profileAnimation,
                builder: (context, child) {
                  return Positioned(top: profileAnimation.value, child: child!);
                },
                child: Image.asset(
                  'assets/Group 156.png',
                  width: isMobile ? width * 0.15 : 80,
                  height: isMobile ? width * 0.15 : 80,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                right: isMobile ? -width * 0.12 : -60,
                bottom: isMobile ? width * 0.05 : 20,
                child: Image.asset(
                  'assets/Ellipse 18.png',
                  width: isMobile ? width * 0.3 : 150,
                  height: isMobile ? width * 0.2 : 100,
                  fit: BoxFit.contain,
                ),
              ),
              CircleAvatar(
                radius: imageSize * 0.6,
                backgroundImage: const AssetImage(
                  'Assets/WhatsApp Image 2025-06-15 at 3.17.50 PM.jpeg',
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.03),
          Text(
            'Mahmoud Mokhtar',
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile ? AppSizes.getFontSize(context, isMobile: isMobile) : 45,
              fontWeight: FontWeight.bold,
            ),          ),
          SizedBox(height: height * 0.015),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.getPadding(context),
            ),
            child: Text(
              'Flutter Developer | BSc in AI | +2 Yrs Experience',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontStyle: FontStyle.italic,
                fontSize: isMobile
                    ? AppSizes.getSmallFontSize(context, isMobile: isMobile)
                    : 24, // Increased to 24px for non-mobile
              ),
          ),
          ),
        ],
      ),
    );
  }
}

class AboutMeSection extends StatelessWidget {
  final double width;
  final double height;
  final bool isMobile;

  const AboutMeSection({
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



class ContactUs extends StatefulWidget {
  final double width;
  final double height;

  const ContactUs({super.key, required this.width, required this.height});

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final messageFocusNode = FocusNode();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    messageFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = widget.width < 600;
    final maxWidth = isMobile ? widget.width : AppSizes.getMaxContentWidth(context) * 0.5;

    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth),
        padding: EdgeInsets.symmetric(horizontal: AppSizes.getPadding(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ReusableSectionHeader(
                title: 'CONNECT WITH ME',
                height: widget.height,
                isMobile: isMobile,
              ),
            ),
            SizedBox(height: AppSizes.getSectionSpacing(context)),
            Row(
              children: [
                Expanded(
                  child: _buildSocialButton(
                    context: context,
                    imagePath: "Assets/akar-icons_whatsapp-fill.png",
                    label: 'WhatsApp',
                    width: widget.width,
                    height: widget.height,
                    isMobile: isMobile,
                    onPressed: () async {
                      await launchUrl(
                        Uri.parse('https://wa.me/201017900067'),
                        mode: LaunchMode.externalApplication,
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: isMobile ? AppSizes.getPadding(context) * 0.5 : AppSizes.getPadding(context),
                ),
                Expanded(
                  child: _buildSocialButton(
                    context: context,
                    imagePath: "Assets/uim_telegram.png",
                    label: 'Telegram',
                    width: widget.width,
                    height: widget.height,
                    isMobile: isMobile,
                    onPressed: () async {
                      await launchUrl(
                        Uri.parse('https://t.me/MahmoudMokhtar_1'),
                        mode: LaunchMode.externalApplication,
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: isMobile ? AppSizes.getPadding(context) * 0.5 : AppSizes.getPadding(context),
                ),
                Expanded(
                  child: _buildSocialButton(
                    context: context,
                    imagePath: "Assets/gmail_5968534.png",
                    label: 'Gmail',
                    width: widget.width,
                    height: widget.height,
                    isMobile: isMobile,
                    onPressed: () async {
                      await launchUrl(
                        Uri.parse('mailto:mahmoudmokhtar1212001@gmail.com'),
                        mode: LaunchMode.externalApplication,
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSizes.getSectionSpacing(context)),
            _buildTextField(
              context: context,
              hintText: 'Your Name',
              width: widget.width,
              height: widget.height,
              isMobile: isMobile,
              controller: nameController,
              focusNode: nameFocusNode,
            ),
            SizedBox(height: AppSizes.getPadding(context)),
            _buildTextField(
              context: context,
              hintText: 'Email Address',
              width: widget.width,
              height: widget.height,
              isMobile: isMobile,
              controller: emailController,
              focusNode: emailFocusNode,
            ),
            SizedBox(height: AppSizes.getPadding(context)),
            _buildTextField(
              context: context,
              hintText: 'Your Message',
              width: widget.width,
              height: widget.height,
              isMobile: isMobile,
              maxLines: 4,
              controller: messageController,
              focusNode: messageFocusNode,
            ),
            SizedBox(height: AppSizes.getPadding(context)),
            Center(
              child: _buildSendButton(
                context,
                maxWidth,
                widget.height,
                isMobile,
                nameController,
                emailController,
                messageController,
              ),
            ),
            SizedBox(height: AppSizes.getSectionSpacing(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required BuildContext context,
    required String hintText,
    required double width,
    required double height,
    required bool isMobile,
    int maxLines = 1,
    required TextEditingController controller,
    required FocusNode focusNode,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(isMobile ? width * 0.03 : 12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: TextField(
        maxLines: maxLines,
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white70,
            fontStyle: FontStyle.italic,
            fontSize: isMobile
                ? AppSizes.getSmallFontSize(context, isMobile: isMobile) * 0.9
                : 16,
          ),
          filled: true,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(isMobile ? width * 0.03 : 12),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: height * 0.015,
            horizontal: AppSizes.getPadding(context) * 0.8,
          ),
        ),
        style: TextStyle(
          color: Colors.white,
          fontSize: isMobile
              ? AppSizes.getSmallFontSize(context, isMobile: isMobile) * 0.9
              : 16,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildSendButton(
      BuildContext context,
      double maxWidth,
      double height,
      bool isMobile,
      TextEditingController nameController,
      TextEditingController emailController,
      TextEditingController messageController,
      ) {
    return Container(
      width: maxWidth, // Match form's maxWidth
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(40),
        gradient: AppTheme.sectionGradient,
        boxShadow: [
          BoxShadow(
            color: Colors.lightBlueAccent.withOpacity(0.3),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () async {
          final name = nameController.text.trim();
          final email = emailController.text.trim();
          final message = messageController.text.trim();

          // Validate fields
          if (name.isEmpty ||
              email.isEmpty ||
              message.isEmpty ||
              !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
            return;
          }

          // Construct mailto URL
          final subject = Uri.encodeComponent('Contact Form Submission from $name');
          final body = Uri.encodeComponent('Name: $name\nEmail: $email\nMessage: $message');
          final url = 'mailto:mahmoudmokhtar1212001@gmail.com?subject=$subject&body=$body';

          // Launch email client
          await launchUrl(
            Uri.parse(url),
            mode: LaunchMode.externalApplication,
          );
          nameController.clear();
          emailController.clear();
          messageController.clear();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: height * 0.015,),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Send',
              style: TextStyle(
                color: Colors.white,
                fontSize: isMobile
                    ? AppSizes.getSmallFontSize(context, isMobile: isMobile)
                    : 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: AppSizes.getPadding(context) * 0.5),
            Image.asset(
              "Assets/hugeicons_sent-02.png",
              height: isMobile ? widget.width * 0.03 : 20,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required BuildContext context,
    required String imagePath,
    required String label,
    required double width,
    required double height,
    required bool isMobile,
    required VoidCallback onPressed,
  }) {
    return Container(
      constraints: BoxConstraints(
        minWidth: isMobile ? 80 : 120,
        maxWidth: isMobile ? width * 0.3 : 180,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.getPadding(context) * 0.8,
        vertical: height * 0.015,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF07081F),
            Color(0xFF0F1236),
            Color(0xFF181957),
          ],
        ),
        borderRadius: BorderRadius.circular(isMobile ? width * 0.06 : 24),
        border: Border.all(color: Colors.white),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(isMobile ? width * 0.06 : 24),
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile
                      ? AppSizes.getSmallFontSize(context, isMobile: isMobile)
                      : 16,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            SizedBox(width: AppSizes.getPadding(context) * 0.4),
            Image.asset(
              imagePath,
              height: isMobile ? widget.width * 0.04 : 24,
              fit: BoxFit.contain,
            ),

          ],
        ),
      ),
    );
  }
}


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
    final cardWidth = isMobile
        ? (width - 3 * AppSizes.getPadding(context)) / 2
        : (width - 5 * AppSizes.getPadding(context)) / 4;

    // Take the first 4 projects from the projects list
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
              children: homeProjects.asMap().entries.map((entry) {
                final project = entry.value;
                return _ProjectCard(
                  width: cardWidth,
                  height: height,
                  isMobile: isMobile,
                  appName: project.name,
                  imagePath: project.imagePath,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProjectDetailsPage(project: project),
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
                    gradient: AppTheme.sectionGradient,
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
class _ProjectCard extends StatelessWidget {
  final double width;
  final double height;
  final bool isMobile;
  final String appName;
  final String imagePath;
  final VoidCallback onTap;

  const _ProjectCard({
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
                    gradient: AppTheme.sectionGradient,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Details',
                        style: AppTextStyles.bodyText(context, isMobile: isMobile)
                            .copyWith(fontWeight: FontWeight.w300),
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

class ProjectDetailsPage extends StatelessWidget {
  final Project project;

  const ProjectDetailsPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isMobile = width < 600;
    final cardWidth = isMobile
        ? (width - 3 * AppSizes.getPadding(context)) / 2
        : (width - 5 * AppSizes.getPadding(context)) / 4;
    bool isArabic(String text) {
      final arabicRegex = RegExp(r'[\u0600-\u06FF]');
      return arabicRegex.hasMatch(text);
    }
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(gradient: AppTheme.sectionGradient),
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
                            colors: [
                              Colors.lightBlueAccent,
                              Colors.white,
                            ],
                          ).createShader(bounds);
                        },
                        child: Text(
                          'Description:',
                          style: TextStyle(
                            color: Colors.white, // Base color (will be overridden by gradient)
                            fontSize: isMobile ? height * 0.02 : 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        project.description,
                        style: AppTextStyles.bodyText(context, isMobile: isMobile),
                        textAlign: TextAlign.justify,
                        textDirection: isArabic(project.description)
                            ? TextDirection.rtl
                            : TextDirection.ltr,
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
                      colors: [
                        Colors.lightBlueAccent,
                        Colors.white,
                      ],
                    ).createShader(bounds);
                  },
                  child: Text(
                    'Technologies:',
                    style: TextStyle(
                      color: Colors.white, // Base color (will be overridden by gradient)
                      fontSize: isMobile ? height * 0.02 : 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),
                Wrap(
                  spacing: width * 0.02,
                  runSpacing: height * 0.015,
                  children: project.technologies
                      .split(',')
                      .map((tech) => Container(
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.008,
                      horizontal: width * 0.04,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF07081F),
                          Color(0xFF0F1236),
                          Color(0xFF181957),
                        ],
                      ),
                      border: Border.all(color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.lightBlueAccent.withOpacity(0.4),
                          blurRadius: 12,
                          spreadRadius: 1,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      tech.trim(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isMobile ? width * 0.03 : width * 0.015,
                        fontWeight: FontWeight.w500,
                      ),
                      textDirection: isArabic(tech.trim())
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                    ),
                  ))
                      .toList(),
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

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(gradient: AppTheme.sectionGradient),
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
                  showBackButton: true, // Enable back button
                ),
                SizedBox(height: AppSizes.getSectionSpacing(context)),
                Wrap(
                  spacing: AppSizes.getPadding(context),
                  runSpacing: AppSizes.getSectionSpacing(context),
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: projects.asMap().entries.map((entry) {
                    final project = entry.value;
                    return _ProjectCard(
                      width: cardWidth,
                      height: height,
                      isMobile: isMobile,
                      appName: project.name,
                      imagePath: project.imagePath,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProjectDetailsPage(project: project),
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
    );
  }
}

class SkillsSection extends StatelessWidget {
  final double width;
  final double height;
  final bool isMobile;

  const SkillsSection({
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

class Star {
  double x;
  double y;
  double size;
  double opacity;
  double speed;

  Star({
    required this.x,
    required this.y,
    required this.size,
    required this.opacity,
    required this.speed,
  });

  void update() {
    y += speed;
    if (y > 1.0) {
      y = 0.0;
      x = Random().nextDouble();
    }
    opacity += (Random().nextDouble() - 0.5) * 0.02;
    opacity = opacity.clamp(0.3, 1.0);
  }
}

class WorkExperienceSection extends StatelessWidget {
  final double width;
  final double height;
  final bool isMobile;

  const WorkExperienceSection({
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
                    style: AppTextStyles.bodyText(
                      context,
                      isMobile: isMobile,
                    ),
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