import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/colors.dart';
import 'text.dart';

class KTextField extends StatelessWidget {
  final String? text;
  final String? hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final bool obscureText;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final isLoading = false;

  const KTextField({
    super.key,
    this.text,
    this.hintText,
    this.controller,
    this.maxLines,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.obscureText = false,
    this.validator,
    this.backgroundColor,
    this.onTap,
    this.onChanged,
    this.onSubmit,
    this.focusNode,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (text?.isNotEmpty == true) ...[
          KText(
            text: text!,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 6),
        ],
        TextFormField(
          focusNode: focusNode,
          controller: controller,
          readOnly: readOnly,
          obscureText: obscureText,
          onTap: onTap,
          validator: validator,
          onChanged: onChanged,
          onFieldSubmitted: onSubmit,
          inputFormatters: inputFormatters,

          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                right: prefixIcon == null ? 0 : 14,
                left: prefixIcon == null ? 0 : 14,
              ),
              child: Icon(
                prefixIcon,
                color: AppColors.greyHintTextField,
                size: 20,
              ),
            ),
            suffixIcon: suffixIcon,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 20,
              maxHeight: 20,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: AppColors.greyHintTextField,
              fontSize: 12,
            ),
            filled: backgroundColor != null,
            fillColor: backgroundColor ?? Colors.white,
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: AppColors.redColorDark,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: AppColors.greyTextField,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: AppColors.primaryText,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: AppColors.redColorDark,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
