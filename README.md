# learn_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

// part 'setting_provider.g.dart';

// @riverpod
// String helloWorld(HelloWorldRef ref) {
// return 'Hello world';
// }

// @riverpod
// Future<User> fetchUser(FetchUserRef ref, {required int userId}) async {
// final json = await http.get('api/user/$userId');
// return User.fromJson(json);
// }

// final fetchUserProvider =
// FutureProvider.autoDispose.family<User, int>((ref, userId) {
// final json = await http.get('api/user/$userId');
// return User.fromJson(json);
// }
// );

// Provider
// final exampleProvider = Provider.autoDispose<String>(
// (ref) {
// return 'foo';
// },
// );

// NotifierProvider
// final exampleProvider =
// NotifierProvider.autoDispose<ExampleNotifier, String>(() {
// return ExampleNotifier();
// });

// class ExampleNotifier extends AutoDisposeNotifier<String> {
// @override
// String build() {
// return 'foo';
// }

//Add methods to mutate the state
// }

// Future Provider
// final exampleProvider = FutureProvider.autoDispose<String>((ref) async {
// return Future.value('foo');
// });

// Stream Provider
// final exampleProvider = StreamProvider.autoDispose<String>((ref) async\* {
// yield 'foo';
// });

// AsyncNotifierProvider
// final exampleProvider =
// AsyncNotifierProvider.autoDispose<ExampleNotifier, String>(() {
// return ExampleNotifier();
// });

// class ExampleNotifier extends AutoDisposeAsyncNotifier<String> {
// @override
// Future<String> build() async {
// return Future.value('foo');
// }

//Add methods to mutate the state
// }

// StreamNotifierProvider
// final exampleProvider =
// StreamNotifierProvider.autoDispose<ExampleNotifier, String>(() {
// return ExampleNotifier();
// });

// class ExampleNotifier extends AutoDisposeStreamNotifier<String> {
// @override
// Stream<String> build() async\* {
// yield 'foo';
// }

//Add methods to mutate the state
// }

// .utoDispose
// autoDispose provider
// final example1Provider = Provider.autoDispose<String>((ref) {
// return 'foo';
// });

// non autoDispose provider
// final example2Provider = Provider<String>((ref) {
// return 'foo';
// });

// family
// final exampleProvider = Provider.family<String, int>((ref, param) {
// return 'Hello $param';
// });

FormBuilder.of(context)!.fields['numberOfDays']?.value as String
FormBuilder.of(context)!.fields['numberOfDays']?.didChange()
