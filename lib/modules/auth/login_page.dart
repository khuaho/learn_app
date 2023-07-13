import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../global/app_router/app_router.dart';
import '../../global/gen/i18n.dart';
import '../../global/utils/riverpod/app_state.dart';
import '../../global/utils/snack_bar.dart';
import 'providers/login_provider.dart';
import 'widgets/auth_background.dart';
import 'widgets/fade_animation.dart';

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late final provider = ref.watch(loginProvider.notifier);
  final formKey = GlobalKey<FormBuilderState>();

  Future<void> signInWithUsernameAndPassword() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.saveAndValidate()) {
      final data = formKey.currentState!.value;

      provider.signInWithEmailPassword(
        email: data['username'],
        password: data['password'],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final i18n = I18n.of(context)!;
    final theme = Theme.of(context);
    final state = ref.watch(loginProvider);
    ref.listen(loginProvider, (_, next) {
      next.whenOrNull(
        data: (_, __) {
          context.router.replace(const HomeRoute());
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
            title: i18n.auth_SignIn,
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
                            : () => signInWithUsernameAndPassword(),
                        child: state.isLoading
                            ? const CircularProgressIndicator()
                            : Text(i18n.auth_SignIn),
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                  FadeAnimation(
                    1.4,
                    RichText(
                      text: TextSpan(
                        text: i18n.auth_HaveNotAnAccount,
                        style: theme.textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: i18n.auth_SignUp,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () =>
                                  context.router.push(const SignUpRoute()),
                            style: theme.textTheme.titleSmall?.copyWith(
                              color: const Color.fromRGBO(143, 148, 251, 1),
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  FadeAnimation(
                    1.5,
                    TextButton(
                      onPressed: () {
                        // TODO: forgot password handler
                      },
                      child: Text(
                        i18n.auth_ForgotPassword,
                        style: const TextStyle(
                          color: Color.fromRGBO(143, 148, 251, 1),
                          decoration: TextDecoration.none,
                        ),
                        textAlign: TextAlign.center,
                      ),
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
