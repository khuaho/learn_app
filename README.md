# learn-app

1. Tools

   ```sh
   - flutter pub run build_runner watch --delete-conflicting-outputs
   ```

   ```sh
   - flutter pub run i18n_json
   ```

2. Android Build for Testing APK

- DEV

  ```sh
  flutter build apk --flavor dev -t lib/main_dev.dart
  ```

- STAGING

  ```sh
  flutter build apk --flavor staging -t lib/main_staging.dart
  ```

- PROD

  ```sh
  flutter build apk --flavor prod -t lib/main_prod.dart
  ```

- Numbers of lines of code

  ```
  find . -name '*.dart' ! -name '*.g.dart' ! -name '*.freezed.dart' ! -name '*.gr.dart' ! -name '*.gen.dart' | xargs wc -l
  ```
