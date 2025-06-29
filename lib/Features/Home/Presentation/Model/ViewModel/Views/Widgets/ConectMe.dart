import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../Core/Constants/app_colors.dart';
import '../../../../../../Core/Utils/AppSizes.dart';
import '../../../../../../Core/Widgets/ReusableSectionHeader.dart';
import 'Widgets/SocialButton.dart';


class ContactUsView extends StatelessWidget {
  final double width;
  final double height;

  const ContactUsView({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    final isMobile = width < 600;
    final maxWidth = isMobile ? width : AppSizes.getMaxContentWidth(context) * 0.9;
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: maxWidth),
            padding: EdgeInsets.symmetric(horizontal: AppSizes.getPadding(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(isMobile),
                SizedBox(height: AppSizes.getSectionSpacing(context)),
                _buildSocialButtons(context, isMobile),
                SizedBox(height: AppSizes.getSectionSpacing(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(bool isMobile) => Center(
    child: ReusableSectionHeader(
      title: 'CONNECT WITH ME',
      height: height,
      isMobile: isMobile,
    ),
  );

  Widget _buildSocialButtons(BuildContext context, bool isMobile) => Row(
    children: [
      Expanded(
        child: SocialButton(
          label: 'WhatsApp',
          iconPath: 'Assets/akar-icons_whatsapp-fill.png',
          isMobile: isMobile,
          width: width,
          height: height,
          onPressed: () async => await launchUrl(Uri.parse('https://wa.me/201017900067'), mode: LaunchMode.externalApplication),
        ),
      ),
      SizedBox(width: AppSizes.getPadding(context) * (isMobile ? 0.5 : 1)),
      Expanded(
        child: SocialButton(
          label: 'Telegram',
          iconPath: 'Assets/uim_telegram.png',
          isMobile: isMobile,
          width: width,
          height: height,
          onPressed: () async => await launchUrl(Uri.parse('https://t.me/MahmoudMokhtar_1'), mode: LaunchMode.externalApplication),
        ),
      ),
      SizedBox(width: AppSizes.getPadding(context) * (isMobile ? 0.5 : 1)),
      Expanded(
        child: SocialButton(
          label: 'Gmail',
          iconPath: 'Assets/gmail_5968534.png',
          isMobile: isMobile,
          width: width,
          height: height,
          onPressed: () async => await launchUrl(Uri.parse('mailto:mahmoudmokhtar1212001@gmail.com'), mode: LaunchMode.externalApplication),
        ),
      ),
    ],
  );

}





