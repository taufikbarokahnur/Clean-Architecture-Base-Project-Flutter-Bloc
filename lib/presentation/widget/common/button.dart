import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import 'text.dart';

class KButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? elevation;
  final void Function()? onPressed;
  final bool isLoading;

  const KButton({
    super.key,
    required this.text,
    required this.isLoading,
    this.width,
    this.borderRadius = 6,
    this.onPressed,
    this.fontSize,
    this.fontWeight,
    this.backgroundColor,
    this.height,
    this.elevation,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? () {} : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.blueButton,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        minimumSize: Size(width ?? double.infinity, height ?? 48),
      ),
      child: isLoading
          ? const SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 1,
              ),
            )
          : KText(
              text: text,
              fontSize: fontSize ?? 14,
              fontWeight: fontWeight ?? FontWeight.bold,
              color: textColor ?? Colors.white,
            ),
    );
  }
}
