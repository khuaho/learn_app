import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'shimmer_wrapper.dart';

class ShimmerImage extends StatelessWidget {
  const ShimmerImage({
    super.key,
    this.imageUrl,
    this.file,
    this.byteData,
    this.iconErrorSize = 20,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.errorWidget,
  }) : assert(imageUrl != null || file != null || byteData != null);

  final String? imageUrl;
  final File? file;
  final Uint8List? byteData;
  final double? width;
  final double? height;
  final double iconErrorSize;
  final BoxFit fit;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    if (file != null) {
      return Image.file(
        file!,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) =>
            errorWidget ??
            Icon(
              Icons.error,
              size: iconErrorSize,
            ),
      );
    }

    if (byteData != null) {
      return Image.memory(
        byteData!,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) =>
            errorWidget ??
            Icon(
              Icons.error,
              size: iconErrorSize,
            ),
      );
    }

    return CachedNetworkImage(
      imageUrl: imageUrl!,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => ShimmerWrapper(
        child: SizedBox(height: width, width: height),
      ),
      errorWidget: (context, url, error) =>
          errorWidget ??
          Icon(
            Icons.error,
            size: iconErrorSize,
          ),
    );
  }
}
