#!/bin/bash

action="$1"

[ $# -eq 0 ] && { echo "Usage: $0 init or $0 make <module-name>"; exit 1; }

if [ ${action} = "init" ]; then

    company="$2"
    package="$3"
    url="$4"

    echo "Flutter/Redux Starter: Init..."
    echo "Company: $company"
    echo "Package: $package"
    echo "URL: $url"

    cp .env.dart.example .env.dart
    sed -i "s/__API_URL__/$url/g" ./.env.dart

    mv ./android/app/src/main/java/com/hillelcoren/ "./android/app/src/main/java/com/$company/"
    mv "./android/app/src/main/java/com/$company/$package" "./android/app/src/main/java/com/$company/$package"

    declare -a files=(
        "./ios/Runner.xcodeproj/project.pbxproj"
        "./android/app/build.gradle"
        "./android/app/src/main/AndroidManifest.xml"
        "./android/app/src/main/java/com/$company/$package/MainActivity.java")

    for i in "${files[@]}"
    do
       sed -i "s/hillelcoren/$company/g" $filename
    done


else
    module="$2"
    Module="$(tr '[:lower:]' '[:upper:]' <<< ${module:0:1})${module:1}"

    echo "Flutter/Redux Starter: Make..."
    echo "Creating $Module module"

    ## Create new directories

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

    if [ ! -d "lib/ui/$module/edit" ]
    then
       echo "Creating directory: lib/ui/$module/edit"
       mkdir "lib/ui/$module/edit"
    fi

    ## Create new files

    declare -a files=(
       #'lib/data/models/product_model.dart'
       #'lib/data/repositories/product_repository.dart'
       'lib/redux/product/product_actions.dart'
       'lib/redux/product/product_reducer.dart'
       'lib/redux/product/product_state.dart'
       'lib/redux/product/product_middleware.dart'
       'lib/redux/product/product_selectors.dart'
       'lib/ui/product/edit/product_edit.dart'
       'lib/ui/product/edit/product_edit_vm.dart'
       'lib/ui/product/product_item.dart'
       'lib/ui/product/product_list_vm.dart'
       'lib/ui/product/product_list.dart'
       'lib/ui/product/product_screen.dart')

    for i in "${files[@]}"
    do
       filename=$(echo $i | sed "s/product/$module/g")
       echo "Creating file: $filename"
       cp $i $filename
       sed -i "s/product/$module/g" $filename
       sed -i "s/Product/$Module/g" $filename
    done

fi

