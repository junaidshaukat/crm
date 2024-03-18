# donors

### Table of contents

- [System requirements](#system-requirements)
- [Figma design guidelines for better UI accuracy](#figma-design-guideline-for-better-accuracy)
- [Application structure](#project-structure)
- [How to format your code?](#how-you-can-do-code-formatting)
- [Libraries and tools used](#libraries-and-tools-used)
- [Api Integration Flow](#Api-Integration-Flow)

### System requirements

- Flutter 3.19.2 • channel stable • https://github.com/flutter/flutter.git
- Tools • Dart 3.3.0 • DevTools 2.31.1
- Android Support SDK 22+
- iOS Support iOS 12+

### Check the UI of the entire app

https://www.figma.com/file/u6ceoopuQIPTus0U5ecwdl/Donor-Choice-Administrator?type=design&node-id=503-105568&mode=design&t=OsY9h8okNGDCS545-0

Dashboard https://crm.donorchoice.ca

### Application structure

After successful build, your application structure should look like this:

```
.
├── android                         - It contains files required to run the application on an Android platform.
├── assets                          - It contains all images and fonts of your application.
├── ios                             - It contains files required to run the application on an iOS platform.
├── lib                             - Most important folder in the application, used to write most of the Dart code..
    ├── main.dart                   - Starting point of the application
    ├── core
    │   ├── app_export.dart         - It contains commonly used file imports
    │   ├── constants               - It contains all constants classes
    │   ├── errors                  - It contains error handling classes
    │   ├── network                 - It contains network-related classes
    │   └── utils                   - It contains common files and utilities of the application
    ├── data
    │   ├── apis               - It contains API calling methods
    │   ├── models                  - It contains request/response models
    │   └── repository              - Network repository
    ├── localization                - It contains localization classes
    ├── presentation                - It contains widgets of the screens with their controllers and the models of the whole application.
    ├── routes                      - It contains all the routes of the application
    └── theme                       - It contains app theme and decoration classes
    └── widgets                     - It contains all custom widget classes
```

### How to format your code?

- if your code is not formatted then run following command in your terminal to format code
  ```
  dart format .
  ```

# Flutter Package Dependencies

This Flutter project utilizes several packages to enhance functionality. Below are the details of each package along with its version, description, configuration for Android and iOS platforms, and links to their documentation.

## [cupertino_icons](https://pub.dev/packages/cupertino_icons) - ^1.0.6

- Version: 1.0.6
- Description: Cupertino Icons package for Flutter.
- Configuration: No specific configuration required.

## [cached_network_image](https://pub.dev/packages/cached_network_image) - ^3.3.1

- Version: 3.3.1
- Description: Flutter library to load and cache network images.
- Configuration: No specific configuration required.

## [connectivity_plus](https://pub.dev/packages/connectivity_plus) - ^5.0.2

- Version: 5.0.2
- Description: Flutter plugin for discovering the state of the network (WiFi & mobile/cellular) connectivity on Android and iOS.
- Configuration:
  - Android:
    - Add the following permission to your AndroidManifest.xml:
      ```xml
      <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
      ```
  - iOS:
    - No additional configuration required.

## [dio](https://pub.dev/packages/dio) - ^5.4.1

- Version: 5.4.1
- Description: A powerful HTTP client for Dart, which supports Interceptors, FormData, Request Cancellation, File Downloading, Timeout, etc.
- Configuration: No specific configuration required.

## [document_file_save_plus](https://pub.dev/packages/document_file_save_plus) - ^2.0.0

- Version: 2.0.0
- Description: Flutter plugin for saving files to external and internal storage, and opening them with other apps.
- Configuration: No specific configuration required.

## [fl_chart](https://pub.dev/packages/fl_chart) - ^0.66.2

- Version: 0.66.2
- Description: A library to create fancy and responsive charts in Flutter.
- Configuration: No specific configuration required.

## [flutter_svg](https://pub.dev/packages/flutter_svg) - ^2.0.10+1

- Version: 2.0.10+1
- Description: SVG parsing, rendering, and widget library for Flutter.
- Configuration: No specific configuration required.

## [get](https://pub.dev/packages/get) - ^4.6.6

- Version: 4.6.6
- Description: A high-level framework for state management and navigation in Flutter.
- Configuration: No specific configuration required.

## [hive](https://pub.dev/packages/hive) - ^2.2.3

- Version: 2.2.3
- Description: A lightweight and blazing-fast key-value database written in pure Dart.
- Configuration: No specific configuration required.

## [hive_flutter](https://pub.dev/packages/hive_flutter) - ^1.1.0

- Version: 1.1.0
- Description: Hive database support for Flutter.
- Configuration: No specific configuration required.

## [image_picker](https://pub.dev/packages/image_picker) - ^1.0.7

- Version: 1.0.7
- Description: Flutter plugin for selecting images from the device.
- Configuration: No specific configuration required.

## [intl](https://pub.dev/packages/intl) - ^0.19.0

- Version: 0.19.0
- Description: Internationalization and localization facilities for Dart.
- Configuration: No specific configuration required.

## [local_auth](https://pub.dev/packages/local_auth) - ^2.2.0

- Version: 2.2.0
- Description: Flutter plugin for authenticating users with biometric (fingerprint/face) or device credentials (PIN/pattern/password).
- Configuration:
  - Android:
    - Add the following permission to your AndroidManifest.xml:
      ```xml
      <uses-permission android:name="android.permission.USE_BIOMETRIC"/>
      ```
  - iOS:
    - No additional configuration required.

## [package_info_plus](https://pub.dev/packages/package_info_plus) - ^5.0.1

- Version: 5.0.1
- Description: Flutter plugin for getting information about the application package.
- Configuration: No specific configuration required.

## [pin_code_fields](https://pub.dev/packages/pin_code_fields) - ^8.0.1

- Version: 8.0.1
- Description: A customized Pin Code Input Field widget for Flutter.
- Configuration: No specific configuration required.

## [shared_preferences](https://pub.dev/packages/shared_preferences) - ^2.2.2

- Version: 2.2.2
- Description: Flutter plugin for reading and writing simple key-value pairs to the device's storage using shared preferences.
- Configuration: No specific configuration required.

## [url_launcher](https://pub.dev/packages/url_launcher) - ^6.2.5

- Version: 6.2.5
- Description: Flutter plugin for launching a URL in the mobile platform's default web browser.
- Configuration: No specific configuration required.

## [vector_math](https://pub.dev/packages/vector_math) - ^2.1.4

- Version: 2.1.4
- Description: A mathematical library for Dart that supports 2D and 3D geometry.
- Configuration: No specific configuration required.

## [video_player](https://pub.dev/packages/video_player) - ^2.8.3

- Version: 2.8.3
- Description: Flutter plugin for displaying inline video with other Flutter widgets on Android and iOS.
- Configuration: No specific configuration required.

## [flutter_volume_controller](https://pub.dev/packages/flutter_volume_controller) - ^1.3.1

- Version: 1.3.1
- Description: A Flutter plugin to control volume on both Android and iOS.
- Configuration:
  - Android:
    - Add the following permission to your AndroidManifest.xml:
      ```xml
      <uses-permission android:name="android.permission.WRITE_SETTINGS" tools:ignore="ProtectedPermissions"/>
      ```
    - Add the following uses-permission-sdk-23 tag to your AndroidManifest.xml:
      ```xml
      <uses-permission-sdk-23 android:name="android.permission.MODIFY_AUDIO_SETTINGS"/>
      ```
  - iOS:
    - No additional configuration required.

# For Credit Card Scanner Place Your Code Here

- file path
- lib/presentation/dashboard/screens/more/screens/transactions/controller/card.dart
- [link](lib/presentation/dashboard/screens/more/screens/transactions/controller/card.dart)

```
Future<void> scanCard() async {
    try {
      ScanResult result = ScanResult();
      if (result.cardHolderName != null) {
        cardHolderNameController.text = result.cardHolderName!;
      }

      if (result.cardNumber != null) {
        cardNumberController.text = result.cardNumber!;
      }

      if (result.cvv != null) {
        ccvController.text = result.cvv!;
      }

      if (result.expiryDate != null) {
        DateTime? expiryDate = result.expiryDate;
        expiryMonth.value = expiryDate!.month.toString().padLeft(2, '0');
        expiryYear.value = expiryDate.year.toString();
      }
    } on PlatformException {
      Toasts.error(
        message:
            "Sorry your device not support credit card scanner. Please enter the information manually.",
      );
    }
  }

```
