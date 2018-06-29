# Flutter Redux Starter/Code Generator - [Watch Video](https://www.youtube.com/watch?v=pMSokKmwp1U)

<p align="center">
    <img src="https://hillelcoren.files.wordpress.com/2018/06/redux.png" alt="Flutter Redux Starter"/>
</p>


We're using this approach to develop the [Flutter app](https://github.com/invoiceninja/flutter-mobile/) for [Invoice Ninja](https://www.invoiceninja.com).

## Usage

#### Step 1: Clone the GitHub repo

`git clone git@github.com:hillelcoren/flutter-redux-starter.git <application> && cd <application>`

#### Step 2: Initialize the project

`./starter.sh init <company> <application> <url>`

#### Step 3: Create the module

`./starter.sh make <application> <module> <fields>`

For example:

```
git clone git@github.com:hillelcoren/flutter-redux-starter.git hacker_news && cd hacker_news
./starter.sh init hacker_news articles api.hackerwebapp.com
./starter.sh make articles article title,url
# Change the route on line 20 of lib/data/repositories/article_repository.dart from /articles to /news
flutter run
```

## Features

- Supports large Redux stores by persisting parts separately
- App state (including navigation) is persisted on form changes
- Automatically implements support for sorting and searching
- The account email is also backed up in shared preferences
- All state and models classes are created using built_values

## Included Packages

- [flutter_redux](https://pub.dartlang.org/packages/flutter_redux) - Consume a Redux Store to build Flutter Widgets
- [redux_logging](https://pub.dartlang.org/packages/redux_logging) - Print the latest state\action changes
- [path_provider](https://pub.dartlang.org/packages/path_provider) - Find commonly used locations on the filesystem
- [shared_preferences ](https://pub.dartlang.org/packages/shared_preferences) - Provides a persistent store for simple data
- [build_runner](https://pub.dartlang.org/packages/build_runner) - A concrete way of generating files using Dart code
- [built_value](https://pub.dartlang.org/packages/built_value) - Built Values for Dart
- [built_collection](https://pub.dartlang.org/packages/built_collection) - Built Collections for Dart
- [memoize](https://pub.dartlang.org/packages/memoize) - Cache results of function calls

## Application Architecture

The architecture is based off these two projects:

- [Redux Sample](https://github.com/brianegan/flutter_architecture_samples/tree/master/example/redux) - [Brian Egan](https://twitter.com/brianegan)
- [inKino](https://github.com/roughike/inKino) - [Iiro Krankka](https://twitter.com/koorankka)

