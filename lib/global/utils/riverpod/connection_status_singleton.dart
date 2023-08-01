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




// import 'dart:async';
// import 'dart:io';
// import 'package:connectivity_plus/connectivity_plus.dart';

// class ConnectivityService {
//   Connectivity connectivity = Connectivity();
//   bool hasConnection = false;
//   ConnectivityResult? connectionMedium;
//   StreamController<bool> connectionChangeController =
//       StreamController.broadcast();
//   Stream<bool> get connectionChange => connectionChangeController.stream;
//   ConnectivityService() {
//     checkInternetConnection();
//   }
//   Future<bool> checkInternetConnection() async {
//     bool previousConnection = hasConnection;
//     try {
//       final result = await InternetAddress.lookup('google.com');
//       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//         hasConnection = true;
//       } else {
//         hasConnection = false;
//       }
//     } on SocketException catch (_) {
//       hasConnection = false;
//     }
//     if (previousConnection != hasConnection) {
//       connectionChangeController.add(hasConnection);
//     }
//     return hasConnection;
//   }
// }
