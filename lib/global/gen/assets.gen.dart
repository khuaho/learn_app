/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/SVN-Poppins-Black.ttf
  String get sVNPoppinsBlack => 'assets/fonts/SVN-Poppins-Black.ttf';

  /// File path: assets/fonts/SVN-Poppins-Bold.ttf
  String get sVNPoppinsBold => 'assets/fonts/SVN-Poppins-Bold.ttf';

  /// File path: assets/fonts/SVN-Poppins-ExtraBold.ttf
  String get sVNPoppinsExtraBold => 'assets/fonts/SVN-Poppins-ExtraBold.ttf';

  /// File path: assets/fonts/SVN-Poppins-ExtraLight.ttf
  String get sVNPoppinsExtraLight => 'assets/fonts/SVN-Poppins-ExtraLight.ttf';

  /// File path: assets/fonts/SVN-Poppins-Italic.ttf
  String get sVNPoppinsItalic => 'assets/fonts/SVN-Poppins-Italic.ttf';

  /// File path: assets/fonts/SVN-Poppins-Light.ttf
  String get sVNPoppinsLight => 'assets/fonts/SVN-Poppins-Light.ttf';

  /// File path: assets/fonts/SVN-Poppins-Medium.ttf
  String get sVNPoppinsMedium => 'assets/fonts/SVN-Poppins-Medium.ttf';

  /// File path: assets/fonts/SVN-Poppins-Regular.ttf
  String get sVNPoppinsRegular => 'assets/fonts/SVN-Poppins-Regular.ttf';

  /// File path: assets/fonts/SVN-Poppins-SemiBold.ttf
  String get sVNPoppinsSemiBold => 'assets/fonts/SVN-Poppins-SemiBold.ttf';

  /// File path: assets/fonts/SVN-Poppins-Thin.ttf
  String get sVNPoppinsThin => 'assets/fonts/SVN-Poppins-Thin.ttf';

  /// File path: assets/fonts/app_icons.ttf
  String get appIcons => 'assets/fonts/app_icons.ttf';

  /// List of all assets
  List<String> get values => [
        sVNPoppinsBlack,
        sVNPoppinsBold,
        sVNPoppinsExtraBold,
        sVNPoppinsExtraLight,
        sVNPoppinsItalic,
        sVNPoppinsLight,
        sVNPoppinsMedium,
        sVNPoppinsRegular,
        sVNPoppinsSemiBold,
        sVNPoppinsThin,
        appIcons
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/background.png
  AssetGenImage get background =>
      const AssetGenImage('assets/images/background.png');

  /// File path: assets/images/clock.png
  AssetGenImage get clock => const AssetGenImage('assets/images/clock.png');

  /// File path: assets/images/light-1.png
  AssetGenImage get light1 => const AssetGenImage('assets/images/light-1.png');

  /// File path: assets/images/light-2.png
  AssetGenImage get light2 => const AssetGenImage('assets/images/light-2.png');

  /// File path: assets/images/program_language.jpg
  AssetGenImage get programLanguage =>
      const AssetGenImage('assets/images/program_language.jpg');

  /// List of all assets
  List<AssetGenImage> get values =>
      [background, clock, light1, light2, programLanguage];
}

class $AssetsLocalesGen {
  const $AssetsLocalesGen();

  /// File path: assets/locales/en-US.json
  String get enUS => 'assets/locales/en-US.json';

  /// File path: assets/locales/vi-VN.json
  String get viVN => 'assets/locales/vi-VN.json';

  /// List of all assets
  List<String> get values => [enUS, viVN];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLocalesGen locales = $AssetsLocalesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
