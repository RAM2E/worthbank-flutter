import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/base_responsive.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData? icon;  // Add icon parameter
  final VoidCallback onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final double? width;
  final double? height;

  const CustomButton({
    Key? key,
    required this.text,
    this.icon,  // Optional icon
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? BaseResponsive.getFieldWidth(context),
      height: height ?? BaseResponsive.getButtonHeight(context),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          padding: BaseResponsive.getButtonPadding(context),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              BaseResponsive.getBorderRadius(context),
            ),
          ),
        ),
        child: isLoading
            ? SizedBox(
                height: BaseResponsive.getIconSize(context),
                width: BaseResponsive.getIconSize(context),
                child: const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(icon, color: Colors.white),
                    SizedBox(width: 8),
                  ],
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: BaseResponsive.getButtonFontSize(context),
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}