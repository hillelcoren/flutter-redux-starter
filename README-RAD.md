# Flutter Redux Rapid Application Development tool

## Usage

#### Step 1: Clone the GitHub repo

`git clone git@github.com:...`

#### Step 2: Create the Firebase project

Folow the tutorial from here to create and configure the Firebase project

`https://firebase.google.com/docs/flutter/setup`

#### Step 2: Initialize the project

`./rad.sh init <company> <application> <url>`

Make sure to use the same package name as in the Firebase project:
`com.<company>.<application>`

#### Step 3: Create a module

`./rad.sh make <application> -f <file>`

and run build_runner build:

`./rad_build.sh`


For example:

```

git clone git@github.com:....

./rad.sh init mycompany flutterreduxrad https://www.myapp.com

./rad.sh make flutterreduxrad -f ./lib/data/base_models/price.dart
./rad.sh make flutterreduxrad -f ./lib/data/base_models/availability.dart
./rad.sh make flutterreduxrad -f ./lib/data/base_models/ticket.dart

./rad_build.sh

flutter run
```

## RAD Features

- Generates modules from DART model classes
- Support for metadata info for model classes and fields
- Support for Firestore databases
- ...

## Included Packages


## Application Architecture

