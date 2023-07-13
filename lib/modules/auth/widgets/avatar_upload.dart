import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn_app/global/utils/riverpod/app_state.dart';

import '../../../global/data/models/user.dart';
import '../../../global/themes/app_colors.dart';
import '../../../global/widgets/avatar.dart';
import '../providers/account_provider.dart';

class AvatarUpload extends ConsumerStatefulWidget {
  const AvatarUpload({
    super.key,
    this.user,
    required this.onUpload,
  });

  final User? user;
  final void Function(String) onUpload;

  @override
  ConsumerState<AvatarUpload> createState() => _AvatarState();
}

class _AvatarState extends ConsumerState<AvatarUpload> {
  Future<void> uploadAvatar() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 300,
      maxHeight: 300,
    );
    if (imageFile == null) {
      return;
    }

    final accountProvider = ref.read(accountNotifierProvider.notifier);

    final imageUrlResponse = await accountProvider.getUrlImage(imageFile);

    widget.onUpload(imageUrlResponse);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(accountNotifierProvider);
    return Center(
      child: GestureDetector(
        onTap: state.isLoading ? null : uploadAvatar,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: AppColors.primary,
              width: 2,
            ),
          ),
          child: Avatar(
            size: 100,
            userName: widget.user?.fullName,
            avatar: widget.user?.avatar,
          ),
        ),
      ),
    );
  }
}
