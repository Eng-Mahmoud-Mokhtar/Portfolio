import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.015,
                horizontal: width * 0.06,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(width * 0.1),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF07081F),
                    Color(0xFF0F1236),
                    Color(0xFF181957),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.lightBlueAccent.withOpacity(0.6),
                    blurRadius: 25,
                    spreadRadius: 5,
                    offset: Offset.zero,
                  ),
                ],
              ),
              child: Text(
                'CONECT ME',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.04),
          Row(
            children: [
              Expanded(
                child: _buildSocialButton(
                  icon: Icons.phone,
                  label: 'WhatsApp',
                  color: Colors.green,
                  width: width,
                  height: height,
                  onPressed: () {},
                ),
              ),
              SizedBox(width: width * 0.04),
              Expanded(
                child: _buildSocialButton(
                  icon: Icons.telegram_rounded,
                  label: 'Telegram',
                  color: Colors.blueAccent,
                  width: width,
                  height: height,
                  onPressed: () {},
                ),
              ),
              SizedBox(width: width * 0.04),
              Expanded(
                child: _buildSocialButton(
                  icon: Icons.mail_outline,
                  label: 'Gmail',
                  color: Colors.redAccent,
                  width: width,
                  height: height,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.04),
          _buildTextField(hintText: 'Your Name', width: width, height: height),
          SizedBox(height: width * 0.02),
          _buildTextField(hintText: 'Email Address', width: width, height: height),
          SizedBox(height: width * 0.02),
          _buildTextField(hintText: 'Your Message', width: width, height: height, maxLines: 4),
          SizedBox(height: width * 0.04),
          Center(child: _buildSendButton(width, height)),
          SizedBox(height: width * 0.04),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required double width,
    required double height,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(width * 0.03),
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
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: width * 0.03,
          ),
          filled: true,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(width * 0.03),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: height * 0.02,
            horizontal: width * 0.04,
          ),
        ),
        style: TextStyle(
          color: Colors.white,
          fontSize: width * 0.03,
        ),
      ),
    );
  }

  Widget _buildSendButton(double width, double height) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(width * 0.1),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF07081F),
            Color(0xFF0F1236),
            Color(0xFF181957),
          ],
        ),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.symmetric(
            vertical: height * 0.02,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width * 0.1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Send',
              style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.03,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: width * 0.02),
            Image.asset(
              "Assets/hugeicons_sent-02.png",
              height: width * 0.04,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required Color color,
    required double width,
    required double height,
    required VoidCallback onPressed,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03,vertical:height * 0.01 ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width * 0.1),
        border: Border.all(color: Colors.white),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF07081F),
            Color(0xFF0F1236),
            Color(0xFF181957),
          ],
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(width * 0.1),
        onTap: onPressed,
        child: Row(
          children: [
            Icon(icon, color: color, size: width * 0.04),
            SizedBox(width: width * 0.02),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.03,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
