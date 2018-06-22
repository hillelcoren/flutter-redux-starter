# Flutter Redux Starter

We're using this approach to develop our [Flutter app](https://github.com/invoiceninja/flutter-mobile/) for [Invoice Ninja](https://www.invoiceninja.com).

## Setup

- Clone/fork the repo
- Rename .env.dart.example to .env.dart

## Features

- Supports large Redux stores by persisting parts separately
- App state (including navigation) is persisted on form changes
- The account email is also backed up in shared preferences
- All state and models classes are created using built_values
- Includes sample integration test configured with local settings

## Basic Flow

- [main.dart](https://github.com/hillelcoren/flutter-redux-starter/blob/master/lib/main.dart#L44) - The user is navigated to an initialization screen
- [redux/app/app_middleware.dart](https://github.com/hillelcoren/flutter-redux-starter/blob/master/lib/redux/app/app_middleware.dart#L49) - The app checks if there is a saved state
- ui/dashboard - If a state is found the user is taken to the dashboard
- [ui/auth/login.dart](https://github.com/hillelcoren/flutter-redux-starter/blob/master/lib/ui/auth/login.dart) - Otherwise, the user is navigated to the login screen
- [redux/auth/auth_middleware.dart](https://github.com/hillelcoren/flutter-redux-starter/blob/master/lib/redux/auth/auth_middleware.dart#L43) - When the user clicks login the app sends an API request
- [ui/auth/login.dart](https://github.com/hillelcoren/flutter-redux-starter/blob/master/lib/ui/auth/login.dart) - If there's a problem the error is shown on the login screen
- ui/dashboard - If the credentials are correct the user is logged in

## Included Packages

- [flutter_redux](https://pub.dartlang.org/packages/flutter_redux) - Consume a Redux Store to build Flutter Widgets.
- [redux_logging](https://pub.dartlang.org/packages/redux_logging) - Print the latest state\action changes.
- [path_provider](https://pub.dartlang.org/packages/path_provider) - Find commonly used locations on the filesystem.
- [shared_preferences ](https://pub.dartlang.org/packages/shared_preferences) - Provides a persistent store for simple data.
- [build_runner](https://pub.dartlang.org/packages/build_runner) - A concrete way of generating files using Dart code.
- [built_value](https://pub.dartlang.org/packages/built_value) - Built Values for Dart.
- [built_collection](https://pub.dartlang.org/packages/built_collection) - Built Collections for Dart.

## Application Architecture

The architecture is based off these two projects:

- [Redux Sample](https://github.com/brianegan/flutter_architecture_samples/tree/master/example/redux) - [Brian Egan](https://twitter.com/brianegan)
- [inKino](https://github.com/roughike/inKino) - [Iiro Krankka](https://twitter.com/koorankka)

