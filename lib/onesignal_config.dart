import 'package:learn_app/global/utils/constants.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

Future<void> initPlatformStateOneSignal() async {
  //Remove this method to stop OneSignal Debugging
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared.setAppId(Constants.oneSignalAppId);
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });
}
