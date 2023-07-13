// import 'dart:async';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';

// import '../providers/event_provider.dart';

// class ConnectionStatusSingleton {
//   static final ConnectionStatusSingleton _singleton =
//       ConnectionStatusSingleton._internal();
//   ConnectionStatusSingleton._internal();

//   static ConnectionStatusSingleton getInstance() => _singleton;
//   StreamSubscription<InternetConnectionStatus>?
//       _listenerInternetConnectionChecker;

//   void initialize(WidgetRef ref) async {
//     final InternetConnectionChecker customInstance =
//         InternetConnectionChecker.createInstance();

//     _listenerInternetConnectionChecker = customInstance.onStatusChange.listen(
//       (InternetConnectionStatus status) {
//         switch (status) {
//           case InternetConnectionStatus.connected:
//             ref.invalidate(eventsProvider);
//             // Future.delayed(const Duration(seconds: 5), () {
//             //   ref.read(printoutsProvider.notifier).refresh();
//             // });
//             break;
//           case InternetConnectionStatus.disconnected:
//             break;
//         }
//       },
//     );
//   }

//   void dispose() {
//     _listenerInternetConnectionChecker?.cancel();
//   }
// }
