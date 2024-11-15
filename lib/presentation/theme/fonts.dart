import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

@immutable
class AppFonts {
  const AppFonts._();

  // Primary
  static TextStyle primaryRegularTextStyle = GoogleFonts.nunitoSans(
    color: AppColors.primaryText,
    fontWeight: FontWeight.w500,
  );

  static TextStyle primaryLightTextStyle = GoogleFonts.nunitoSans(
    color: AppColors.primaryText.withOpacity(0.6),
    fontWeight: FontWeight.w400,
  );

  static TextStyle primarySemiBoldTextStyle = GoogleFonts.nunitoSans(
    color: AppColors.green,
    fontWeight: FontWeight.w600,
  );

  static TextStyle primaryBoldTextStyle = GoogleFonts.nunitoSans(
    color: AppColors.primaryText,
    fontWeight: FontWeight.w700,
  );
}