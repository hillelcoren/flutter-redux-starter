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
        './lib/ui/app/actions_menu_button.dart'
        './lib/ui/app/app_bottom_bar.dart'
        './lib/ui/app/app_search.dart'
        './lib/ui/app/app_search_button.dart'
        './lib/ui/app/dismissible_entity.dart'
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

    package="$2"
    module="$3"
    Module="$(tr '[:lower:]' '[:upper:]' <<< ${module:0:1})${module:1}"
    fields="$4"
    IFS=', ' read -r -a fieldsArray <<< "$fields"

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

    # Link in new module
    comment="STARTER: import - do not remove comment"
    code="import 'package:${package}\/redux\/${module}\/${module}_state.dart';\n"
    sed -i "s/$comment/$comment\n$code/g" ./lib/redux/app/app_state.dart

    comment="STARTER: states switch - do not remove comment"
    code="case EntityType.${module}\nreturn ${module}UIState;\n"
    sed -i "s/$comment/$comment\n$code/g" ./lib/redux/app/app_state.dart

    comment="STARTER: state getters - do not remove comment"
    code="${Module}State get ${module}State => this.dataState.${module}State;\n"
    code="${code}ListUIState get ${module}ListState => this.uiState.${module}UIState.listUIState;\n\n"
    sed -i "s/$comment/$comment\n$code/g" ./lib/redux/app/app_state.dart

    for element in "${fieldsArray[@]}"
    do
        comment="STARTER: fields - do not remove comment"
        code="static const String ${element} = '${element}';\n"
        sed -i "s/$comment/$comment\n$code/g" "./lib/data/models/${module}_model.dart"

        comment="STARTER: properties - do not remove comment"
        code="String get ${element};\n"
        sed -i "s/$comment/$comment\n$code/g" "./lib/data/models/${module}_model.dart"
    done

    comment="STARTER: import - do not remove comment"
    code="import 'package:${package}\/redux\/${module}\/${module}_state.dart';\n"
    code="${code}import 'package:${package}\/ui\/${module}\/${module}_screen.dart';\n"
    code="${code}import 'package:${package}\/ui\/${module}\/edit\/${module}_edit_vm.dart';${code}\n"
    code="${code}import 'package:${package}\/ui\/${module}\/view\/${module}_view_vm.dart';${code}\n"
    code="${code}import 'package:${package}\/redux\/${module}\/${module}_actions.dart';${code}\n"
    code="${code}import 'package:${package}\/redux\/${module}\/${module}_middleware.dart';${code}\n"
    sed -i "s/$comment/$comment\n$code/g" ./lib/main.dart

    comment="STARTER: middleware - do not remove comment"
    code="..addAll(createStore${Module}sMiddleware())\n"
    sed -i "s/$comment/$comment\n$code/g" ./lib/main.dart

    comment="STARTER: routes - do not remove comment"
    code="${Module}Screen.route: (context) {\n"
    code="${code}widget.store.dispatch(Load${Module}s());\n"
    code="${code}return ${Module}Screen();\n"
    code="${code}},\n"
    code="${code}${Module}ViewScreen.route: (context) => ${Module}ViewScreen(),\n"
    code="${code}${Module}EditScreen.route: (context) => ${Module}EditScreen(),\n"
    sed -i "s/$comment/$comment\n$code/g" ./lib/main.dart

    comment="STARTER: import - do not remove comment"
    code="import 'package:${package}\/data\/models\/${module}_model.dart';\n"
    code="${code}import 'package:${package}\/redux\/${module}\/${module}_state.dart';\n"
    sed -i "s/$comment/$comment\n$code/g" ./lib/data/models/serializers.dart

    comment="STARTER: serializers - do not remove comment"
    code="${Module}ListResponse,\n"
    code="${code}${Module}ItemResponse,\n"
    sed -i "s/$comment/$comment\n$code/g" ./lib/data/models/serializers.dart

    comment="STARTER: import - do not remove comment"
    code="import 'package:${package}\/redux\/${module}\/${module}_state.dart';\n"
    sed -i "s/$comment/$comment\n$code/g" ./lib/redux/app/data_state.dart

    comment="STARTER: fields - do not remove comment"
    code="${Module}State get ${module}State;\n"
    sed -i "s/$comment/$comment\n$code/g" ./lib/redux/app/data_state.dart

    comment="STARTER: constructor - do not remove comment"
    code="${module}State: ${Module}State(),\n"
    sed -i "s/$comment/$comment\n$code/g" ./lib/redux/app/data_state.dart

    comment="STARTER: import - do not remove comment"
    code="import 'package:${package}\/redux\/${module}\/${module}_state.dart';\n"
    sed -i "s/$comment/$comment\n$code/g" ./lib/redux/app/data_reducer.dart

    comment="STARTER: reducer - do not remove comment"
    code="..${module}State.replace(${module}sReducer(state.${module}State, action))\n"
    sed -i "s/$comment/$comment\n$code/g" ./lib/redux/app/data_reducer.dart

    comment="STARTER: import - do not remove comment"
    code="import 'package:${package}\/redux\/${module}\/${module}_actions.dart';\n"
    code="${code}import 'package:${package}\/ui\/${module}\/${module}_screen.dart';\n"
    sed -i "s/$comment/$comment\n$code/g" ./lib/ui/app/app_drawer.dart

    comment="STARTER: menu - do not remove comment"
    code="ListTile(\n"
    code="${code}leading: Icon(Icons.widgets),\n"
    code="${code}title: Text(''),\n"
    code="${code}onTap: () {\n"
    code="${code}store.dispatch(Search${Module}s(null));\n"
    code="${code}store.dispatch(UpdateCurrentRoute(${Module}Screen.route));\n"
    code="${code}navigator.pushReplacementNamed(${Module}Screen.route);\n"
    code="${code}},\n"
    code="${code}),\n"
    sed -i "s/$comment/$comment\n$code/g" ./lib/ui/app/app_drawer.dart

    comment="STARTER: types - do not remove comment"
    code="static const EntityType ${module} = _$"
    code="${code}${module};\n"
    sed -i "s/$comment/$comment\n$code/g" ./lib/data/models/models.dart

    echo "Generating built files.."
    rm -rf .dart_tool/build/
    flutter packages pub run build_runner build --delete-conflicting-outputs
fi

echo "Successfully completed"