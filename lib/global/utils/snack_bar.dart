import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/models/failure.dart';
import '../gen/i18n.dart';
import '../themes/app_colors.dart';

class SnackBarUtils {
  SnackBarUtils._();

  static void showErr(
    BuildContext context,
    Failure err, {
    String Function(AuthException)? authSupabase,
    String Function(PostgrestException)? postgrest,
    String Function(Object data)? unknown,
    String Function(Object data)? illegalData,
    String Function(Object data)? permissionDenied,
  }) {
    final i18n = I18n.of(context)!;
    print(err);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          err.when(
            //TODO: mapping firebase err to string
            authSupabase: authSupabase ?? (exception) => exception.message,
            unknown: unknown ?? (_) => i18n.error_Unknown,
            illegalData: illegalData ?? (_) => i18n.error_Unknown,
            network: () => i18n.error_NoNetwork,
            permissionDenied: () => '',
            other: (message) => message,
            postgrest: postgrest ?? (e) => e.message,
          ),
        ),
      ),
    );
  }

  static void showSuccess(
    BuildContext context,
    String message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.successDefault,
        content: Row(
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Colors.white,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
