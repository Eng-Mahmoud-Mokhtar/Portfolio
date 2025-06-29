import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonState {
  final bool isHovered;

  const ButtonState({this.isHovered = false});
}

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit() : super(const ButtonState());

  void setHovered(bool value) => emit(ButtonState(isHovered: value));
}

class SocialButton extends StatelessWidget {
  final String label;
  final String iconPath;
  final bool isMobile;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.label,
    required this.iconPath,
    required this.isMobile,
    required this.width,
    required this.height,
    required this.onPressed,
  });

  Color get hoverColor {
    switch (label.toLowerCase()) {
      case 'whatsapp':
        return const Color(0xFF25D366);
      case 'telegram':
        return const Color(0xFF6D79F3);
      case 'gmail':
        return const Color(0xFFEA4335);
      default:
        return Colors.deepPurple;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ButtonCubit(),
      child: BlocBuilder<ButtonCubit, ButtonState>(
        builder: (context, state) {
          final cubit = context.read<ButtonCubit>();
          final isHovered = state.isHovered;
          final borderRadius = BorderRadius.circular(
              isMobile ? width * 0.06 : 24);

          return MouseRegion(
            onEnter: (_) => cubit.setHovered(true),
            onExit: (_) => cubit.setHovered(false),
            child: AnimatedScale(
              scale: isHovered ? 1.03 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: Container(
                decoration: BoxDecoration(
                  color: isHovered
                      ? hoverColor
                      : Colors.white.withOpacity(0.05),
                  borderRadius: borderRadius,
                  border:
                  Border.all(color: Colors.white.withOpacity(0.2)),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: borderRadius,
                    onTap: () {
                      cubit.setHovered(false); // ✅ حل مشكلة الرجوع
                      onPressed(); // ✅ فتح الصفحة
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: height * 0.018,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              label,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: isMobile ? 13 : 16,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            iconPath,
                            height:
                            isMobile ? width * 0.045 : 26,
                            filterQuality: FilterQuality.low,
                            cacheWidth: 64,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
