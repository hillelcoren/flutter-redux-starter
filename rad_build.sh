#!/bin/bash

echo "Generating built files.."

flutter packages pub run build_runner clean
flutter packages pub run build_runner build --delete-conflicting-outputs

echo "Successfully completed"