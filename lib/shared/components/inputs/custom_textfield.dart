import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/base_responsive.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? errorText;
  final IconData? prefixIcon;
  final Function(String)? onChanged;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.errorText,
    this.prefixIcon,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: BaseResponsive.getFieldWidth(context),
      height: BaseResponsive.getFieldHeight(context),
      margin: EdgeInsets.symmetric(
        vertical: BaseResponsive.getVerticalSpacing(context) / 2,
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword && _obscureText,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        style: TextStyle(
          fontSize: BaseResponsive.getBodySize(context),
          color: AppColors.textDark,
        ),
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(
            color: AppColors.primary,
            fontSize: BaseResponsive.getLabelSize(context),
          ),
          errorText: widget.errorText,
          prefixIcon: Icon(
            widget.prefixIcon ?? 
              (widget.isPassword ? Icons.lock : Icons.person),
            color: AppColors.primary,
            size: BaseResponsive.getIconSize(context),
          ),
          suffixIcon: widget.isPassword ? IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: AppColors.primary,
              size: BaseResponsive.getIconSize(context),
            ),
            onPressed: () => setState(() => _obscureText = !_obscureText),
          ) : null,
          border: _getBorder(context),
          enabledBorder: _getBorder(context),
          focusedBorder: _getBorder(context, width: 2.0),
          errorBorder: _getBorder(context, color: AppColors.error),
          filled: true,
          fillColor: AppColors.surfaceLight,
          contentPadding: EdgeInsets.symmetric(
            horizontal: BaseResponsive.getHorizontalSpacing(context),
            vertical: BaseResponsive.getVerticalSpacing(context),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _getBorder(BuildContext context, {
    Color? color,
    double width = 1.0,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        BaseResponsive.getBorderRadius(context),
      ),
      borderSide: BorderSide(
        color: color ?? AppColors.primary,
        width: width,
      ),
    );
  }
}