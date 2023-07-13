// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../global/data/models/doc.dart';
// import '../../../global/data/repositories/doc_repository.dart';
// import 'search_keyword_provider.dart';

// final querySearchProvider = Provider.autoDispose<Query<Doc>>((ref) {
//   final keyword = ref.watch(searchKeywordProvider);
//   final currentUser = FirebaseAuth.instance.currentUser;
//   return ref
//       .read(docRepositoryProvider)
//       .docRef
//       .where('uid', isEqualTo: currentUser?.uid)
//       .where('title', isGreaterThanOrEqualTo: keyword)
//       .where('title', isLessThan: '$keyword\uF7FF')
//       .orderBy('title', descending: false)
//       .orderBy('createdAt', descending: true);
// });
