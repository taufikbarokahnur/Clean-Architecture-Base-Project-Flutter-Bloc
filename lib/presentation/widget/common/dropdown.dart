import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/colors.dart';

class KDropDownMenu extends StatelessWidget {
  final TextEditingController controller;
  final List<DropdownMenuEntry<int>> data;
  final IconData? trailingIcon;
  final Function(int?)? onSelected;

  const KDropDownMenu({
    super.key,
    required this.controller,
    required this.data,
    this.trailingIcon,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      controller: controller,
      expandedInsets: EdgeInsets.zero,
      // enableFilter: true,
      // enableSearch: true,
      onSelected: onSelected,
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.white),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
      trailingIcon: trailingIcon != null ? Icon(trailingIcon) : null,
      selectedTrailingIcon: trailingIcon != null ? Icon(trailingIcon) : null,
      textStyle: TextStyle(
        fontFamily: GoogleFonts.nunitoSans().fontFamily,
        color: AppColors.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            color: AppColors.greyTextField,
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      dropdownMenuEntries: data,
    );
  }
}
