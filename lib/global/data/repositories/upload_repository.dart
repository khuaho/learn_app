import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

import '../models/failure.dart';
import '_base_repository.dart';

final uploadRepositoryProvider = Provider((_) => _UploadRepositoryImpl());

abstract class UploadRepository {
  Future<Either<Failure, String>> getImageUrl(XFile? imageFile);
}

class _UploadRepositoryImpl extends BaseRepository implements UploadRepository {
  final supabase = Supabase.instance.client;
  @override
  Future<Either<Failure, String>> getImageUrl(XFile? imageFile) {
    return guardFuture(() async {
      if (imageFile != null) {
        final bytes = await imageFile.readAsBytes();
        final fileExt = imageFile.path.split('.').last;
        final fileName = '${DateTime.now().toIso8601String()}.$fileExt';
        final filePath = fileName;

        await supabase.storage.from('avatars').uploadBinary(
              filePath,
              bytes,
              fileOptions: FileOptions(contentType: imageFile.mimeType),
            );
        final imageUrlResponse = await supabase.storage
            .from('avatars')
            .createSignedUrl(filePath, 60 * 60 * 24 * 365 * 10);
        return imageUrlResponse;
      }
      return '';
    });
  }
}
