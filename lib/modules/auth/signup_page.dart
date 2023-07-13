import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../global/gen/i18n.dart';
import '../../global/utils/riverpod/app_state.dart';
import '../../global/utils/snack_bar.dart';
import 'providers/signup_provider.dart';
import 'widgets/auth_background.dart';
import 'widgets/fade_animation.dart';

@RoutePage()
class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  late final provider = ref.watch(signUpProvider.notifier);
  final formKey = GlobalKey<FormBuilderState>();

  void signUpWithEmailPassword() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.saveAndValidate()) {
      final data = formKey.currentState!.value;

      provider.signUpWithEmailPassword(
        fullName: data['full_name'],
        email: data['username'],
        password: data['password'],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final i18n = I18n.of(context)!;
    final state = ref.watch(signUpProvider);
    ref.listen(signUpProvider, (_, next) {
      next.whenOrNull(
        data: (_, __) {
          context.router.pop();
          // await showDialog(
          //   context: context,
          //   builder: (_) => ConfirmationDialog(
          //     titleText: i18n.signup_SignUpSuccessfully,
          //     contentText: i18n.signup_VerifyAccountMes,
          //   ),
          // ).then((_) => AutoRouter.of(context).pop());
        },
        error: (err) => SnackBarUtils.showErr(context, err),
      );
    });

    InputDecoration decoration = const InputDecoration(
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
    );

    return GestureDetector(
      onTapDown: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: AuthBackground(
            title: i18n.auth_SignUp,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FadeAnimation(
                    1.8,
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .2),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: FormBuilder(
                        key: formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: FormBuilderTextField(
                                enabled: !state.isLoading,
                                name: 'full_name',
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: FormBuilderValidators.compose(
                                  [
                                    FormBuilderValidators.required(
                                      errorText: i18n.auth_FullNameIsRequired,
                                    ),
                                  ],
                                ),
                                decoration: decoration.copyWith(
                                  hintText: i18n.auth_FullNameLabel,
                                ),
                                valueTransformer: (String? value) =>
                                    value!.trim(),
                              ),
                            ),
                            const Divider(
                              color: Colors.blueGrey,
                              height: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: FormBuilderTextField(
                                enabled: !state.isLoading,
                                name: 'username',
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: FormBuilderValidators.compose(
                                  [
                                    FormBuilderValidators.required(
                                      errorText: i18n.auth_Username_IsRequired,
                                    ),
                                  ],
                                ),
                                decoration: decoration.copyWith(
                                  hintText: i18n.auth_Username_Label,
                                ),
                                valueTransformer: (String? value) =>
                                    value!.trim(),
                              ),
                            ),
                            const Divider(
                              color: Colors.blueGrey,
                              height: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: FormBuilderTextField(
                                enabled: !state.isLoading,
                                name: 'password',
                                obscureText: true,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: FormBuilderValidators.compose(
                                  [
                                    FormBuilderValidators.required(
                                      errorText: i18n.auth_PasswordIsRequired,
                                    ),
                                  ],
                                ),
                                decoration: decoration.copyWith(
                                  hintText: i18n.auth_PasswordLabel,
                                ),
                                obscuringCharacter: '*',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  FadeAnimation(
                    2,
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(143, 148, 251, 1),
                            Color.fromRGBO(143, 148, 251, .6),
                          ],
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: state.isLoading
                            ? null
                            : () => signUpWithEmailPassword(),
                        child: state.isLoading
                            ? const CircularProgressIndicator()
                            : Text(i18n.auth_SignUp),
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                  FadeAnimation(
                    1.4,
                    RichText(
                      text: TextSpan(
                        text: i18n.auth_HaveYouAnAccount,
                        style: theme.textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: i18n.auth_SignIn,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => context.router.pop(),
                            style: theme.textTheme.titleSmall?.copyWith(
                              color: const Color.fromRGBO(143, 148, 251, 1),
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
