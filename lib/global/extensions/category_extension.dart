import 'package:flutter/material.dart';

import '../data/models/category/category.dart';

extension CategoryExt on Category {
  String? label(Locale locale) {
    return locale.languageCode == 'vi' ? nameVi : nameEn;
  }
}
