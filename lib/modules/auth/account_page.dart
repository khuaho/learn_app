import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:learn_app/global/utils/riverpod/app_state.dart';
import 'package:learn_app/global/widgets/label.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;

import '../../global/data/models/user.dart';
import '../../global/gen/i18n.dart';
import '../../global/providers/user_provider.dart';
import '../../global/themes/app_colors.dart';
import '../../global/utils/app_icons.dart';
import '../../global/utils/snack_bar.dart';
import 'providers/account_provider.dart';
import 'widgets/avatar_upload.dart';

@RoutePage()
class AccountPage extends ConsumerStatefulWidget {
  const AccountPage({super.key});

  @override
  ConsumerState<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends ConsumerState<AccountPage> {
  final formKey = GlobalKey<FormBuilderState>();
  final supabaseAuth = Supabase.instance.client.auth;

  void updateProfile() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.saveAndValidate()) {
      final data = formKey.currentState!.value;

      final userData = User(
        id: supabaseAuth.currentUser?.id,
        fullName: data['fullName'],
        avatar: data['avatar'],
        email: data['email'],
        phoneNumber: data['phoneNumber'],
        dateOfBirth: data['dateOfBirth'],
        gender: data['gender'],
      );
      final provider = ref.read(accountNotifierProvider.notifier);
      provider.updateProfile(userData);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider).value;
    final state = ref.watch(accountNotifierProvider);

    ref.listen(accountNotifierProvider, (_, next) {
      next.whenOrNull(
        data: (_, __) {
          context.router.pop();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Updated successfully'),
            backgroundColor: AppColors.successDefault,
          ));
        },
        error: (err) => SnackBarUtils.showErr(context, err),
      );
    });

    print('date: ${user?.dateOfBirth}');

    return GestureDetector(
      onTapDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: FormBuilder(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              FormBuilderField(
                name: 'avatar',
                initialValue: user?.avatar,
                builder: (field) {
                  return AvatarUpload(
                    user: user,
                    onUpload: (urlImg) {
                      field.didChange(urlImg);
                    },
                  );
                },
                enabled: !state.isLoading,
              ),
              const SizedBox(height: 12),
              const Label('Full name'),
              FormBuilderTextField(
                initialValue: user?.fullName,
                name: 'fullName',
                decoration: const InputDecoration(
                  hintText: 'Enter your full name',
                ),
                textInputAction: TextInputAction.next,
                enabled: !state.isLoading,
              ),
              const Label('Email'),
              FormBuilderTextField(
                enabled: false,
                initialValue: supabaseAuth.currentUser?.email,
                name: 'email',
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
              ),
              const Label('Date of Birth'),
              FormBuilderDateTimePicker(
                name: 'dateOfBirth',
                initialDate: user?.dateOfBirth,
                timePickerInitialEntryMode: TimePickerEntryMode.input,
                format: DateFormat.yMd(I18n.locale?.languageCode),
                decoration: const InputDecoration(
                  hintText: 'Enter date of birth',
                  suffixIcon: Icon(AppIcons.filled_calendar),
                ),
                inputType: InputType.date,
                enabled: !state.isLoading,
              ),
              const Label('Gender'),
              FormBuilderTextField(
                initialValue: user?.gender,
                name: 'gender',
                decoration: const InputDecoration(
                  hintText: 'Enter your gender',
                ),
                textInputAction: TextInputAction.next,
                enabled: !state.isLoading,
              ),
              const Label('Phone number'),
              FormBuilderField(
                name: 'phoneNumber',
                initialValue: user?.phoneNumber,
                builder: (field) {
                  return IntlPhoneField(
                    initialValue: user?.phoneNumber,
                    initialCountryCode: 'VN',
                    languageCode: I18n.locale?.languageCode ?? 'en',
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: 'Enter phone number',
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (phoneNumber) {
                      field.didChange(phoneNumber.number);
                    },
                    textInputAction: TextInputAction.done,
                  );
                },
                enabled: !state.isLoading,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: state.isLoading ? null : updateProfile,
            child: state.isLoading
                ? const CircularProgressIndicator()
                : const Text('Update'),
          ),
        ),
      ),
    );
  }
}
