#!/bin/bash

echo "Flutter/Redux Starter - Developed by @hillelcoren"

action="$1"

[ $# -eq 0 ] && { echo "Usage: $0 init or $0 make <module-name>"; exit 1; }

if [ ${action} = "init" ]; then

    company="$2"
    package="$3"
    url="$4"

    echo "Init..."
    echo "Company: $company"
    echo "Package: $package"
    echo "URL: $url"

    cp .env.dart.example .env.dart
    sed -i "s/__API_URL__/$url/g" ./.env.dart

    mv "./android/app/src/main/java/com/hillelcoren" "./android/app/src/main/java/com/$company"
    mv "./android/app/src/main/java/com/$company/flutterreduxstarter" "./android/app/src/main/java/com/$company/$package"

    # Replace 'hillelcoren'
    declare -a files=(
        './ios/Runner.xcodeproj/project.pbxproj'
        './android/app/build.gradle'
        './android/app/src/main/AndroidManifest.xml'
        "./android/app/src/main/java/com/$company/$package/MainActivity.java")

    for i in "${files[@]}"
    do
       sed -i "s/hillelcoren/$company/g" $i
    done

    # Replace 'flutterReduxStarter'
    declare -a files=(
        "./android/app/src/main/java/com/$company/$package/MainActivity.java")

    for i in "${files[@]}"
    do
       sed -i "s/flutterReduxStarter/$package/g" $i
    done

    # Replace 'flutterreduxstarter'
    declare -a files=(
        "./ios/Runner.xcodeproj/project.pbxproj")

    for i in "${files[@]}"
    do
       sed -i "s/flutterreduxstarter/$package/g" $i
    done

    declare -a files=(
        './.packages'
        './pubspec.yaml'
        './ios/Runner/Info.plist'
        './ios/Flutter/Generated.xcconfig'
        './android/app/build.gradle'
        './android/app/src/main/AndroidManifest.xml'
        './lib/main.dart'
        './lib/redux/app/app_state.dart'
        './lib/redux/app/app_reducer.dart'
        './lib/redux/app/app_actions.dart'
        './lib/redux/app/app_middleware.dart'
        './lib/redux/app/data_reducer.dart'
        './lib/redux/auth/auth_state.dart'
        './lib/redux/auth/auth_actions.dart'
        './lib/redux/auth/auth_middleware.dart'
        './lib/redux/auth/auth_reducer.dart'
        './lib/redux/ui/ui_actions.dart'
        './lib/redux/ui/ui_reducer.dart'
        './lib/redux/ui/entity_ui_state.dart'
        './lib/redux/ui/list_ui_state.dart'
        './lib/data/repositories/auth_repository.dart'
        './lib/data/repositories/persistence_repository.dart'
        './lib/data/models/serializers.dart'
        './test/login_test.dart'
        './lib/redux/ui/ui_state.dart'
        './lib/ui/auth/login.dart'
        './lib/ui/auth/login_vm.dart'
        './lib/ui/app/app_drawer.dart'
        './lib/ui/app/app_drawer_vm.dart'
        './lib/ui/home/home_screen.dart'
        './stubs/data/models/stub_model'
        './stubs/data/repositories/stub_repository'
        './stubs/redux/stub/stub_actions'
        './stubs/redux/stub/stub_reducer'
        './stubs/redux/stub/stub_state'
        './stubs/redux/stub/stub_middleware'
        './stubs/redux/stub/stub_selectors'
        './stubs/ui/stub/edit/stub_edit'
        './stubs/ui/stub/edit/stub_edit_vm'
        './stubs/ui/stub/view/stub_view'
        './stubs/ui/stub/view/stub_view_vm'
        './stubs/ui/stub/stub_item'
        './stubs/ui/stub/stub_list_vm'
        './stubs/ui/stub/stub_list'
        './stubs/ui/stub/stub_screen')

    for i in "${files[@]}"
    do
       sed -i "s/flutter_redux_starter/$package/g" $i
    done

    flutter pub get

else

    module="$2"
    Module="$(tr '[:lower:]' '[:upper:]' <<< ${module:0:1})${module:1}"

    echo "Make..."
    echo "Creating $module module"

    # Create new directories
    if [ ! -d "lib/redux/$module" ]
    then
       echo "Creating directory: lib/redux/$module"
       mkdir "lib/redux/$module"
    fi

    if [ ! -d "lib/ui/$module" ]
    then
       echo "Creating directory: lib/ui/$module"
       mkdir "lib/ui/$module"
    fi

    if [ ! -d "lib/ui/$module/view" ]
    then
       echo "Creating directory: lib/ui/$module/view"
       mkdir "lib/ui/$module/view"
    fi

    if [ ! -d "lib/ui/$module/edit" ]
    then
       echo "Creating directory: lib/ui/$module/edit"
       mkdir "lib/ui/$module/edit"
    fi

    # Create new module files
    declare -a files=(
       './stubs/data/models/stub_model'
       './stubs/data/repositories/stub_repository'
       './stubs/redux/stub/stub_actions'
       './stubs/redux/stub/stub_reducer'
       './stubs/redux/stub/stub_state'
       './stubs/redux/stub/stub_middleware'
       './stubs/redux/stub/stub_selectors'
       './stubs/ui/stub/edit/stub_edit'
       './stubs/ui/stub/edit/stub_edit_vm'
       './stubs/ui/stub/view/stub_view'
       './stubs/ui/stub/view/stub_view_vm'
       './stubs/ui/stub/stub_item'
       './stubs/ui/stub/stub_list_vm'
       './stubs/ui/stub/stub_list'
       './stubs/ui/stub/stub_screen')

    for i in "${files[@]}"
    do
       filename=$(echo $i | sed "s/stubs/lib/g" | sed "s/stub/$module/g")
       echo "Creating file: $filename.dart"
       cp $i "$filename.dart"
       sed -i "s/stub/$module/g" "$filename.dart"
       sed -i "s/Stub/$Module/g" "$filename.dart"
    done

    echo "Generating built files.."
    rm -rf .dart_tool/build/
    flutter packages pub run build_runner build --delete-conflicting-outputs
fi

echo "Successfully completed"