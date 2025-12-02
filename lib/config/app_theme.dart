import 'package:flutter/material.dart';
import '../config/app_font.dart';

class AppTheme {
  static const Color white = Colors.white;
  static const Color dark = Color(0xFF1A1309);
  static const Color lightBlacks = Color(0xFF2B1A0F);
  static const Color halfBlack = Color(0xFF3C2615);
  static const Color lightBlack = Color(0xFF4E2F19);

  static const Color kPrimaryColor = Color(0xFFFF6B1A);
  static const Color kButtonColor = Color(0xFFFF6B1A);
  static const Color primaryBrand = Color(0xFFFF6B1A);
  static const Color primaryBrandLight = Color(0xFFFF8A3C);
  static const Color primaryBrandDark = Color(0xFFE45100);
  static const Color primaryBrandAccent = Color(0xFFFFB36A);

  static const Color brandHover = Color(0xFFFF7B2F);
  static const Color brandPressed = Color(0xFFE45100);
  static const Color brandDisabled = Color(0xFFFFD7BA);

  static const List<Color> primaryGradient = [
    Color(0xFFFF6900),
    Color(0xFFF54900),
    Color(0xFFCA3500),
  ];
  
  static const List<Color> primaryGradientLight = [
    Color(0xFFFFC78A),
    Color(0xFFFF8A3C),
  ];

  
  static const List<Color> onboardingSecondaryGradient = [
    Color(0xFFFFE5CC),
    Color(0xFFFFC896),
  ];

  static const Color greenColor = Color(0xFF2E7D32);
  static const Color successGreen = Color(0xFF2E7D32);
  static const Color successGreenLight = Color(0xFF6BBF6E);

  static const Color error = Color(0xFFD32F2F);
  static const Color errorLight = Color(0xFFFF8A80);
  static const Color warning = Color(0xFFFFB300);
  static const Color warningLight = Color(0xFFFFE082);

  // Grey Scale
  static const Color grey = Color(0xFF8C7561);
  static const Color greyColor = Color(0xFFA68D7A);
  static const Color greyColor2 = Color(0xFF8C7561);
  static const Color greyLight = Color(0xFFEAD6C4);
  static const Color greyMedium = Color(0xFFC8B1A1);
  static const Color greyDark = Color(0xFF5B4634);
  
  // Background Colors
  static const Color backgroundLight = Color(0xFFFFF7F0);
  static const Color backgroundGrey = Color(0xFFFFEFE1);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color cardSoft = Color(0xFFFFF0E0);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF2B1A14);
  static const Color textSecondary = Color(0xFF6B4F3B);
  static const Color textTertiary = Color(0xFFA3816D);
  static const Color onboardingHeading = Color(0xFF1F120B);
  static const Color onboardingBody = Color(0xFF4E3321);
  static const Color onboardingChipText = Color(0xFF8A4A16);
  
  static const Color borderColor = Color(0xFFF4DCC6);
  static const Color dividerColor = Color(0xFFEFD5BC);
  static const Color subtleShadow = Color(0x14C96927);
  
  static const Color settingIconsColors = Color(0xFF8A4A16);
  static const Color followButtonColor = Color(0xFFFF6B1A);
  static const Color unSelectedColor = Color(0xFFA3816D);

  static const Color textFieldGradient1 = Color(0xFFFFFFFF);
  static const Color textFieldGradient2 = Color(0xFFFFB36A);
  static const Color textFieldGradient3 = Color(0xFFFF8A3C);

  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppTheme.backgroundLight,

    colorScheme: ColorScheme.light(
      primary: AppTheme.kPrimaryColor,
      onPrimary: AppTheme.white,
      secondary: AppTheme.primaryBrandAccent,
      onSecondary: AppTheme.white,
      error: AppTheme.error,
      onError: AppTheme.white,
      surface: AppTheme.surfaceColor,
      onSurface: AppTheme.textPrimary,
      background: AppTheme.backgroundLight,
      onBackground: AppTheme.textPrimary,
      brightness: Brightness.light,
    ),

    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: AppFonts.sansRegular,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppTheme.onboardingHeading,
      ),
      titleLarge: TextStyle(
        fontFamily: AppFonts.sansRegular,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppTheme.textPrimary,
      ),
      titleSmall: TextStyle(
        fontFamily: AppFonts.sansRegular,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppTheme.textPrimary,
      ),
      bodyLarge: TextStyle(
        fontFamily: AppFonts.sansRegular,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppTheme.textPrimary,
      ),
      bodyMedium: TextStyle(
        fontFamily: AppFonts.sansRegular,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppTheme.textSecondary,
      ),
      labelLarge: TextStyle(
        fontFamily: AppFonts.sansRegular,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppTheme.textPrimary,
      ),
      bodySmall: TextStyle(
        fontFamily: AppFonts.sansRegular,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppTheme.textSecondary,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.kPrimaryColor,
        foregroundColor: Colors.white,
        disabledBackgroundColor: AppTheme.brandDisabled,
        disabledForegroundColor: Colors.white70,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        textStyle: const TextStyle(
          fontFamily: AppFonts.sansRegular,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ).copyWith(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppTheme.brandDisabled;
            }
            if (states.contains(MaterialState.pressed)) {
              return AppTheme.brandPressed;
            }
            if (states.contains(MaterialState.hovered)) {
              return AppTheme.brandHover;
            }
            return AppTheme.kPrimaryColor;
          },
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppTheme.kPrimaryColor,
        disabledForegroundColor: AppTheme.brandDisabled,
        side: BorderSide(
          color: AppTheme.kPrimaryColor,
          width: 2,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        textStyle: const TextStyle(
          fontFamily: AppFonts.sansRegular,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ).copyWith(
        side: MaterialStateProperty.resolveWith<BorderSide>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return BorderSide(color: AppTheme.brandDisabled, width: 2);
            }
            if (states.contains(MaterialState.pressed)) {
              return BorderSide(color: AppTheme.brandPressed, width: 2);
            }
            return BorderSide(color: AppTheme.kPrimaryColor, width: 2);
          },
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppTheme.kPrimaryColor,
        disabledForegroundColor: AppTheme.brandDisabled,
        textStyle: const TextStyle(
          fontFamily: AppFonts.sansRegular,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ).copyWith(
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppTheme.brandDisabled;
            }
            if (states.contains(MaterialState.pressed)) {
              return AppTheme.brandPressed;
            }
            if (states.contains(MaterialState.hovered)) {
              return AppTheme.brandHover;
            }
            return AppTheme.kPrimaryColor;
          },
        ),
      ),
    ),

    chipTheme: ChipThemeData(
      backgroundColor: AppTheme.backgroundGrey,
      selectedColor: AppTheme.kPrimaryColor,
      disabledColor: AppTheme.brandDisabled,
      labelStyle: const TextStyle(
        fontFamily: AppFonts.sansRegular,
        color: AppTheme.textPrimary,
        fontWeight: FontWeight.w500,
      ),
      secondaryLabelStyle: const TextStyle(
        fontFamily: AppFonts.sansRegular,
        color: AppTheme.textSecondary,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),

    tabBarTheme: const TabBarThemeData(
      labelColor: AppTheme.kPrimaryColor,
      unselectedLabelColor: Colors.white70,
      labelStyle: TextStyle(
        fontFamily: AppFonts.sansRegular,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: TextStyle(fontFamily: AppFonts.sansRegular),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: AppTheme.kPrimaryColor, width: 2),
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppTheme.kPrimaryColor,
      foregroundColor: Colors.white,
      elevation: 4,
    ),
    
    // App Bar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: AppTheme.textPrimary,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: AppFonts.sansRegular,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppTheme.textPrimary,
      ),
      iconTheme: IconThemeData(
        color: AppTheme.textPrimary,
      ),
    ),
    
    // Card Theme
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.05),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    
    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppTheme.borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppTheme.borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppTheme.kPrimaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppTheme.error),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
  );

  static ThemeData get darkTheme {
    const background = Color(0xFF0F172A);
    const surface = Color(0xFF1F2937);
    const card = Color(0xFF1E2534);
    const textPrimaryDark = Color(0xFFF9FAFB);
    const textSecondaryDark = Color(0xFFCBD5F5);
    const borderDark = Color(0xFF334155);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      colorScheme: ColorScheme.dark(
        primary: AppTheme.kPrimaryColor,
        onPrimary: AppTheme.white,
        secondary: AppTheme.primaryBrandAccent,
        onSecondary: AppTheme.white,
        error: AppTheme.error,
        onError: AppTheme.white,
        surface: surface,
        onSurface: textPrimaryDark,
        background: background,
        onBackground: textPrimaryDark,
        brightness: Brightness.dark,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: AppFonts.sansRegular,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: textPrimaryDark,
        ),
        titleLarge: TextStyle(
          fontFamily: AppFonts.sansRegular,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textPrimaryDark,
        ),
        titleSmall: TextStyle(
          fontFamily: AppFonts.sansRegular,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: textSecondaryDark,
        ),
        bodyLarge: TextStyle(
          fontFamily: AppFonts.sansRegular,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textPrimaryDark,
        ),
        bodyMedium: TextStyle(
          fontFamily: AppFonts.sansRegular,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: textSecondaryDark,
        ),
        labelLarge: TextStyle(
          fontFamily: AppFonts.sansRegular,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: textPrimaryDark,
        ),
        bodySmall: TextStyle(
          fontFamily: AppFonts.sansRegular,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: textSecondaryDark,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.kPrimaryColor,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppTheme.brandDisabled,
          disabledForegroundColor: Colors.white70,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          textStyle: const TextStyle(
            fontFamily: AppFonts.sansRegular,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ).copyWith(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return AppTheme.brandDisabled;
              }
              if (states.contains(MaterialState.pressed)) {
                return AppTheme.brandPressed;
              }
              if (states.contains(MaterialState.hovered)) {
                return AppTheme.brandHover;
              }
              return AppTheme.kPrimaryColor;
            },
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppTheme.kPrimaryColor,
          disabledForegroundColor: AppTheme.brandDisabled,
          side: BorderSide(
            color: AppTheme.kPrimaryColor,
            width: 2,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          textStyle: const TextStyle(
            fontFamily: AppFonts.sansRegular,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ).copyWith(
          side: MaterialStateProperty.resolveWith<BorderSide>(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return BorderSide(color: AppTheme.brandDisabled, width: 2);
              }
              if (states.contains(MaterialState.pressed)) {
                return BorderSide(color: AppTheme.brandPressed, width: 2);
              }
              return BorderSide(color: AppTheme.kPrimaryColor, width: 2);
            },
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppTheme.kPrimaryColor,
          disabledForegroundColor: AppTheme.brandDisabled,
          textStyle: const TextStyle(
            fontFamily: AppFonts.sansRegular,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ).copyWith(
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return AppTheme.brandDisabled;
              }
              if (states.contains(MaterialState.pressed)) {
                return AppTheme.brandPressed;
              }
              if (states.contains(MaterialState.hovered)) {
                return AppTheme.brandHover;
              }
              return AppTheme.kPrimaryColor;
            },
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: surface,
        selectedColor: AppTheme.kPrimaryColor,
        disabledColor: AppTheme.brandDisabled,
        labelStyle: const TextStyle(
          fontFamily: AppFonts.sansRegular,
          color: textPrimaryDark,
          fontWeight: FontWeight.w500,
        ),
        secondaryLabelStyle: const TextStyle(
          fontFamily: AppFonts.sansRegular,
          color: textSecondaryDark,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      tabBarTheme: const TabBarThemeData(
        labelColor: AppTheme.kPrimaryColor,
        unselectedLabelColor: Colors.white70,
        labelStyle: TextStyle(
          fontFamily: AppFonts.sansRegular,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(fontFamily: AppFonts.sansRegular),
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: AppTheme.kPrimaryColor, width: 2),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppTheme.kPrimaryColor,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: background,
        foregroundColor: textPrimaryDark,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: AppFonts.sansRegular,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textPrimaryDark,
        ),
        iconTheme: IconThemeData(
          color: textPrimaryDark,
        ),
      ),
      cardTheme: CardThemeData(
        color: card,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: borderDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: borderDark),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppTheme.kPrimaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppTheme.error),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  static ThemeData get theme => lightTheme;
}
