import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900,
        fontSize: 18.fSize,
      );
  static get bodyLargeBlack900_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900,
      );
  static get bodyLargeRobotoBlack900 =>
      theme.textTheme.bodyLarge!.roboto.copyWith(
        color: appTheme.black900,
      );
  static get bodyLargeRobotoBlack90018 =>
      theme.textTheme.bodyLarge!.roboto.copyWith(
        color: appTheme.black900,
        fontSize: 18.fSize,
      );
  static get bodyLargeRobotoWhiteA700 =>
      theme.textTheme.bodyLarge!.roboto.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyLargeff000000 => theme.textTheme.bodyLarge!.copyWith(
        color: const Color(0XFF000000),
      );
  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
        fontSize: 15.fSize,
      );
  static get bodyMediumGray600 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray90001,
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumGray70002 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray70002,
      );
  static get bodyMediumGray80001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray80001,
      );
  static get bodyMediumInterWhiteA700 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: appTheme.whiteA700,
        fontSize: 13.fSize,
      );
  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodyMediumWhiteA700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodySmallAirbnbCerealAppDeeppurple50 =>
      theme.textTheme.bodySmall!.airbnbCerealApp.copyWith(
        color: appTheme.deepPurple50,
        fontSize: 12.fSize,
      );
  static get bodySmallAirbnbCerealAppPrimary =>
      theme.textTheme.bodySmall!.airbnbCerealApp.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 12.fSize,
      );
  static get bodySmallBlack900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900,
        fontSize: 12.fSize,
      );
  static get bodySmallBluegray400 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray400,
        fontSize: 12.fSize,
      );
  static get bodySmallBluegray40001 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray40001,
      );
  static get bodySmallGray400 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray400,
        fontSize: 12.fSize,
      );
  static get bodySmallGray50001 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray50001,
        fontSize: 12.fSize,
      );
  static get bodySmallGray600 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray600,
      );
  static get bodySmallGray60012 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray600,
        fontSize: 12.fSize,
      );
  static get bodySmallGray6008 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray600,
        fontSize: 8.fSize,
      );
  static get bodySmallGray80001 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray80001,
      );
  static get bodySmallGray8000112 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray80001,
        fontSize: 12.fSize,
      );
  static get bodySmallGray8000112_1 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray80001,
        fontSize: 12.fSize,
      );
  static get bodySmallGray800019 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray80001,
        fontSize: 9.fSize,
      );
  static get bodySmallGray80001Light => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray80001,
        fontSize: 8.fSize,
        fontWeight: FontWeight.w300,
      );
  static get bodySmallGray900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray900,
        fontSize: 12.fSize,
      );
  static get bodySmallInterGray500 => theme.textTheme.bodySmall!.inter.copyWith(
        color: appTheme.gray500,
        fontSize: 9.fSize,
      );
  static get bodySmallInterGray700 => theme.textTheme.bodySmall!.inter.copyWith(
        color: appTheme.gray700,
        fontSize: 12.fSize,
      );
  static get bodySmallInterGray80001 =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: appTheme.gray80001,
        fontSize: 12.fSize,
      );
  static get bodySmallPrimary => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodySmallPrimary12 => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 12.fSize,
      );
  static get bodySmallPrimary12_1 => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 12.fSize,
      );
  static get bodySmallRedA700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.redA700,
        fontSize: 10.fSize,
      );
  static get bodySmallRedA70001 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.redA70001,
      );
  static get bodySmallRobotoBlack900 =>
      theme.textTheme.bodySmall!.roboto.copyWith(
        color: appTheme.black900,
        fontSize: 12.fSize,
      );
  static get bodySmallRobotoBlack90012 =>
      theme.textTheme.bodySmall!.roboto.copyWith(
        color: appTheme.black900,
        fontSize: 12.fSize,
      );
  static get bodySmallRobotoGray80001 =>
      theme.textTheme.bodySmall!.roboto.copyWith(
        color: appTheme.gray80001,
        fontSize: 12.fSize,
      );
  static get bodySmallRobotoRed600 =>
      theme.textTheme.bodySmall!.roboto.copyWith(
        color: appTheme.red600,
        fontSize: 12.fSize,
      );
  static get bodySmallWhiteA700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 12.fSize,
      );
  // Display text style
  static get displaySmallPoppins =>
      theme.textTheme.displaySmall!.poppins.copyWith(
        fontSize: 34.fSize,
      );
  // Headline text style
  static get headlineSmallGray900 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.gray900,
      );
  // Label text style
  static get labelLargeBold => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get labelLargeInter => theme.textTheme.labelLarge!.inter.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get labelLargeInterPrimary =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get labelLargePoppins => theme.textTheme.labelLarge!.poppins.copyWith(
        fontSize: 13.fSize,
        fontWeight: FontWeight.w600,
      );
  static get labelLargePoppinsBluegray30001 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.blueGray30001,
      );
  static get labelLargePoppinsGray900 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.gray900,
      );
  static get labelLargePoppinsPrimary =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get labelLargePoppinsPrimarySemiBold =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get labelLargePoppinsWhiteA700 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  static get labelLargePoppinsWhiteA700Bold =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
      );
  static get labelLargePoppins_1 => theme.textTheme.labelLarge!.poppins;
  static get labelLargeRobotoPrimary =>
      theme.textTheme.labelLarge!.roboto.copyWith(
        color: theme.colorScheme.primary,
      );
  static get labelMediumBlack900 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumGray600 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.gray600,
        fontSize: 11.fSize,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumGray80001 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.gray80001,
        fontWeight: FontWeight.w500,
      );
  static get labelMediumInterPrimary =>
      theme.textTheme.labelMedium!.inter.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get labelMediumPrimary => theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      );
  static get labelSmallWhiteA700 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.whiteA700,
      );
  // Poppins text style
  static get poppinsBluegray300 => TextStyle(
        color: appTheme.blueGray300,
        fontSize: 7.fSize,
        fontWeight: FontWeight.w500,
      ).poppins;
  static get poppinsGray600 => TextStyle(
        color: appTheme.gray600,
        fontSize: 7.fSize,
        fontWeight: FontWeight.w500,
      ).poppins;
  static get poppinsGray600Regular => TextStyle(
        color: appTheme.gray600,
        fontSize: 7.fSize,
        fontWeight: FontWeight.w400,
      ).poppins;
  static get poppinsGray80001 => TextStyle(
        color: appTheme.gray80001,
        fontSize: 7.fSize,
        fontWeight: FontWeight.w500,
      ).poppins;
  // Title text style
  static get titleLargeBlack900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w400,
      );
  static get titleLargeGray80001 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray80001,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeInter => theme.textTheme.titleLarge!.inter.copyWith(
        fontSize: 21.fSize,
        fontWeight: FontWeight.w400,
      );
  static get titleLargeMedium => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleMediumInterWhiteA700 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.whiteA700,
        fontSize: 18.fSize,
      );
  static get titleMediumMontserratPrimary =>
      theme.textTheme.titleMedium!.montserrat.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 18.fSize,
      );
  static get titleMediumPoppinsGray80001 =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.gray80001,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumPoppinsGray80001SemiBold =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.gray80001,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumPoppinsGray80001_1 =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.gray80001,
      );
  static get titleMediumPoppinsPrimary =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumPoppinsWhiteA700 =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumPoppinsWhiteA700Medium =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumPoppinsff000000 =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: const Color(0XFF000000),
        fontSize: 18.fSize,
      );
  static get titleMediumPoppinsff007c16 =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: const Color(0XFF007C16),
        fontSize: 18.fSize,
      );
  static get titleMediumRobotoGray80001 =>
      theme.textTheme.titleMedium!.roboto.copyWith(
        color: appTheme.gray80001,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumRobotoPrimary =>
      theme.textTheme.titleMedium!.roboto.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 18.fSize,
      );
  static get titleMediumSkModernistWhiteA700 =>
      theme.textTheme.titleMedium!.skModernist.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleMediumUrbanistGray50002 =>
      theme.textTheme.titleMedium!.urbanist.copyWith(
        color: appTheme.gray50002,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallGray600 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray600,
      );
  static get titleSmallGray900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallInter => theme.textTheme.titleSmall!.inter.copyWith(
        fontSize: 15.fSize,
      );
  static get titleSmallMontserratPrimary =>
      theme.textTheme.titleSmall!.montserrat.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallOnPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleSmallPrimaryMedium => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPrimaryMedium_1 => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallPrimary_1 => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleSmallWhiteA700Medium => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallWhiteA700_1 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }

  TextStyle get airbnbCerealApp {
    return copyWith(
      fontFamily: 'Airbnb Cereal App',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get urbanist {
    return copyWith(
      fontFamily: 'Urbanist',
    );
  }

  TextStyle get skModernist {
    return copyWith(
      fontFamily: 'Sk-Modernist',
    );
  }
}
