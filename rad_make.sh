#!/bin/bash

./rad.sh init mycompany flutterreduxrad https://www.myapp.com

./rad.sh make flutterreduxrad -f ./lib/data/base_models/price.dart
./rad.sh make flutterreduxrad -f ./lib/data/base_models/availability.dart
./rad.sh make flutterreduxrad -f ./lib/data/base_models/ticket.dart

./rad_build.sh

flutter run
