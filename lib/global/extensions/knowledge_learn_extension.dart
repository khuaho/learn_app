import 'package:flutter/material.dart';

import '../data/models/knowledge_learn/knowledge_learn.dart';

extension KnowledgeLearnExt on KnowledgeLearn {
  String? knowledgeContent(Locale locale) {
    return locale.languageCode == 'vi' ? vi : en;
  }
}
