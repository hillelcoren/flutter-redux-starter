#!/bin/bash

echo "Flutter/Redux RAD"

[ $# -eq 0 ] && { echo "Usage: $0 init or $0 make <package> <module-name> <field:type> or $0 make <package> -f <filename>"; exit 1; }

action="$1"
lineBreak='\'$'\n'

if [ ${action} = "init" ]; then

    company="$2"
    package="$3"
    url="$4"

    echo "Company: $company"
    echo "Package: $package"
    echo "URL: $url"

    flutter pub get

    echo "Creating files..."

    sed -i -e "s/__API_URL__/$url/g" ./lib/constants.dart

    mv "./android/app/src/main/java/com/mycompany" "./android/app/src/main/java/com/$company"
    mv "./android/app/src/main/java/com/$company/flutterreduxrad" "./android/app/src/main/java/com/$company/$package"

    # Replace 'mycompany'
    echo "Replace 'mycompany'..."
    declare -a files=(
        './ios/Runner.xcodeproj/project.pbxproj'
        './android/app/build.gradle'
        './android/app/src/main/AndroidManifest.xml'
        "./android/app/src/main/java/com/$company/$package/MainActivity.java")

    for i in "${files[@]}"
    do
       sed -i -e "s/mycompany/$company/g" $i
    done

    # Replace 'flutterreduxrad'
    echo "Replace 'flutterreduxrad'..."
    declare -a files=(
        "./android/app/src/main/java/com/$company/$package/MainActivity.java")

    for i in "${files[@]}"
    do
       sed -i -e "s/flutterreduxrad/$package/g" $i
    done

    # Replace 'flutterreduxrad'
    echo "Replace 'flutterreduxrad'..."
    declare -a files=(
        "./ios/Runner.xcodeproj/project.pbxproj")

    for i in "${files[@]}"
    do
       sed -i -e "s/flutterreduxrad/$package/g" $i
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
        './lib/ui/app/init.dart'
        './lib/ui/app/app_drawer_vm.dart'
        './lib/ui/app/actions_menu_button.dart'
        './lib/ui/app/app_bottom_bar.dart'
        './lib/ui/app/app_search.dart'
        './lib/ui/app/app_search_button.dart'
        './lib/ui/app/dismissible_entity.dart'
        './lib/ui/home/home_screen.dart'
        './stubs/data/models/stub_model'
        './stubs/data/repositories/stub_repository_firestore'
        './stubs/data/repositories/stub_repository_api'
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
        './stubs/ui/stub/stub_screen'
        './lib/data/models/models.dart'
        './lib/data/models/entities.dart'
        './lib/data/models/static/country_model.dart'
        './lib/data/models/static/currency_model.dart'
        './lib/data/models/static/language_model.dart'
        './lib/data/models/static/static_data_model.dart'
        './lib/redux/static/static_reducer.dart'
        './lib/redux/static/static_selectors.dart'
        './lib/redux/static/static_state.dart'
        './lib/utils/formatting.dart'
        './lib/utils/localization.dart')

    for i in "${files[@]}"
    do
       sed -i -e "s/flutterreduxrad/$package/g" $i
    done

else
    package="$2"
    
    parentCollection=""
    entityCollection=""

    if [ $3 = "-f" ]; then
        filename="$4"
        #echo "File: $filename"

        while IFS='' read -r line || [[ -n "$line" ]]; 
            do 
            linesArray+=("$line");
        done < "$filename"

        class_start="false"
        for (( idx=0 ; idx<=${#linesArray[@]}-1 ; idx++ )) ; do
                #echo "line[$idx]=${linesArray[$idx]}"

                elements="${linesArray[idx]}"

                if [[ "${elements}" = \@FirebaseConfig* ]]; then
                    IFS="\'" read -r -a elementArray <<< "$elements"
                    entityCollection=${elementArray[1]}
                    parentCollection=${elementArray[3]}

                    echo "FirebaseConfig metadata found: $entityCollection, $parentCollection"
                fi

                IFS=' ' read -r -a elementArray <<< "$elements"
                #echo "line[$idx]=${elementArray[0]} | ${elementArray[1]} }"

                if [ "$class_start" = "true" ] && [[ "${elementArray[0]}" = \}* ]]; then
                    class_start="false"
                    fields_cnt=0
                fi

                if [ "$class_start" = "true" ]; then 
                    #echo "line[$idx]=$class_start | ${elementArray[0]}:${elementArray[1]}"

                    element="$(echo -e "${elements}" | tr -d '[:space:]')"

                    if [[ "${element}" = \@nullable* ]]; then
                        #echo "Metadata found: $element"
                        nullableMetadata="nullable=true"

                    elif [[ "${element}" = \@FieldMetadata* ]]; then
                        IFS='()' read -r -a metadataElement <<< "$element" 
                        tmp=${metadataElement[1]//,/;}
                        fieldMetadata=${tmp//:/=}
                        echo "Metadata found: $fieldMetadata"
                    
                   elif [[ "${element}" = \@IncludedFields* ]]; then
                        IFS='({})' read -r -a metadataElement <<< "$element" 
                        tmp=${metadataElement[2]//\'/}
                        tmp=${tmp//:/-}
                        tmp=${tmp//,/][}
                        includedFields="includedFields=[$tmp]"
                        #echo "Metadata found: ${includedFields}"

                    elif [[ "${elementArray[0]}" != \/* ]] && [ ${#elementArray[0]} -ge 2 ]; then
                        #echo "line[$idx]=${elementArray[0]}:${elementArray[1]::-2}"
                        fields+="${elementArray[1]::-2}:${elementArray[0]}($nullableMetadata;$fieldMetadata;$includedFields), "
                        fieldMetadata=""
                        nullableMetadata=""
                        includedFields=""
                    fi
                fi

                if [ "${elementArray[0]}" = "class" ]; then
                    module=${elementArray[1]}
                    module="$(tr '[:upper:]' '[:lower:]' <<< ${module:0:1})${module:1}"
                    class_start="true"
                    fields_cnt=0
                fi
        done
    else
        module="$3"
        fields="$4"
    fi 
    
    IFS=', ' read -r -a fieldsArray <<< "$fields"
    Module="$(tr '[:lower:]' '[:upper:]' <<< ${module:0:1})${module:1}"

    echo "Make..."
    echo "Creating $module | $Module module"
    echo "With fields: $fields"
    
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
       './stubs/data/repositories/stub_repository_firestore'
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
       sed -i -e "s/stub/$module/g" "$filename.dart"
       sed -i -e "s/Stub/$Module/g" "$filename.dart"

        if [ ${#entityCollection} -ge 2 ]; then
            sed -i -e "s/entity-collection/$entityCollection/g" "$filename.dart"
        else 
            sed -i -e "s/entity-collection/${Module}s/g" "$filename.dart"
        fi
        #sed -i -e "s/parent-collection/$parentCollection/g" "$filename.dart"
    done

    # Link in new module

    file="./lib/redux/app/app_state.dart"
    comment="STARTER: import - do not remove comment"
    code="import 'package:${package}\/redux\/${module}\/${module}_state.dart';"
    sed -i "/$code/d" $file
    sed -i -e "s/$comment/$comment${lineBreak}$code/g" $file

    comment="STARTER: states switch - do not remove comment"
    firstLine="case EntityType.${module}:${lineBreak}"
    lastLine="return ${module}UIState;"
    code="${firstLine}${lastLine}"
    sed -i "/${firstLine%"$lineBreak"}/,/${lastLine}/d" $file
    sed -i -e "s/$comment/$comment${lineBreak}$code/g" $file

    comment="STARTER: state getters - do not remove comment"
    firstLine="${Module}State get ${module}State => this.dataState.${module}State;${lineBreak}"
    code="${firstLine}ListUIState get ${module}ListState => this.uiState.${module}UIState.listUIState;${lineBreak}"
    lastLine="${Module}UIState get ${module}UIState => this.uiState.${module}UIState;${lineBreak}"
    code="${code}${lastLine}"
    sed -i "/${firstLine%"$lineBreak"}/,/${lastLine%"$lineBreak"}/d" $file
    sed -i -e "s/$comment/$comment${lineBreak}$code/g" $file


    for (( idx=${#fieldsArray[@]}-1 ; idx>=0 ; idx-- )) ; do
        Nullable=""
        FormFieldType=""
        IncludedFields=""

        elements="${fieldsArray[idx]}"
        IFS=':()' read -r -a elementArray <<< "$elements"

        element="${elementArray[0]}"
        Element="$(tr '[:lower:]' '[:upper:]' <<< ${element:0:1})${element:1}"
        type="${elementArray[1]}"
        typeLower="$(tr '[:upper:]' '[:lower:]' <<< ${type:0:1})${type:1}"
        echo "Creating element: $element, with type:$type, and metadata:${elementArray[2]}"
        
        IFS=';' read -r -a metadataArray <<< "${elementArray[2]}"
        for (( jdx=${#metadataArray[@]}-1 ; jdx>=0 ; jdx-- )) ; do
            metaData=${metadataArray[jdx]}
            #echo "with metadata: $metaData"

            IFS='{}=' read -r -a fieldElementArray <<< "${metaData}"
            #echo "|${fieldElementArray[0]} |${fieldElementArray[1]} |${fieldElementArray[2]} |${fieldElementArray[3]} |${fieldElementArray[4]}|"
            if [[ "${fieldElementArray[0]}" = "nullable" ]]; then
                Nullable="@nullable${lineBreak}"
            elif [[ "${fieldElementArray[1]}" = "'fieldType'" ]]; then
                FormFieldType="${fieldElementArray[2]}"
                echo "with metadata: $FormFieldType"
            elif [[ "${fieldElementArray[0]}" = "includedFields" ]]; then
                IncludedFields="${fieldElementArray[1]}"
                echo "with metadata: $IncludedFields"
            fi
        done    

        file="./lib/data/models/${module}_model.dart"
        comment="STARTER: import - do not remove comment"    
        if [ "$type" = "bool" ] || [ "$type" = "int" ] || [ "$type" = "double" ] || [ "$type" = "String" ]; then
            echo "Type is: $type"
        else
           code="import 'package:$package\/data\/models\/${typeLower}_model.dart';"
           sed -i "/$code/d" $file
            sed -i -e "s/$comment/$comment${lineBreak}$code/g" $file
        fi

        comment="STARTER: fields - do not remove comment"
        if [ "$type" = "bool" ]; then
           code="static const bool ${element} = false;${lineBreak}"
        elif [ "$type" = "int" ]; then
           code="static const int ${element} = 1;${lineBreak}"
        elif [ "$type" = "String" ]; then
           code="static const String ${element} = '${element}';${lineBreak}"
        else
           code="${lineBreak}"
        fi
        sed -i "/$code/d" $file
        sed -i -e "s/$comment/$comment${lineBreak}$code/g" $file

        comment="STARTER: properties - do not remove comment"
        if [ "$type" = "bool" ] || [ "$type" = "int" ] || [ "$type" = "double" ] || [ "$type" = "String" ]; then
            code="$Nullable$type get ${element};${lineBreak}"
        else
            code="$Nullable${type}Entity get ${element};${lineBreak}" 
        fi
        sed -i "/$code/d" $file
        sed -i -e "s/$comment/$comment${lineBreak}$code/g" $file

        comment="STARTER: sort switch - do not remove comment"
        if [ "$type" = "String" ]; then
            code="case ${Module}Fields.${element}:${lineBreak}"
            code="${code}response = ${module}A.${element}.compareTo(${module}B.${element});${lineBreak}break;${lineBreak}"
            sed -i "/$code/d" $file
            sed -i -e "s/$comment/$comment${lineBreak}$code/g" $file
        fi

        comment="STARTER: search - do not remove comment"
        if [ "$type" = "String" ]; then
            code="if (${element}.toLowerCase().contains(filter)){${lineBreak}"
            code="${code}return true;${lineBreak}"
            code="${code}}${lineBreak}"
            sed -i "/$code/d" $file
            sed -i -e "s/$comment/$comment${lineBreak}$code/g" $file
        fi

        comment="STARTER: constructor - do not remove comment"
        if [ "$type" = "bool" ]; then
           code="${element}: false,${lineBreak}" 
        elif [ "$type" = "int" ]; then
           code="${element}: 1,${lineBreak}" 
        elif [ "$type" = "double" ]; then
           code="${element}: 0.0,${lineBreak}" 
        elif [ "$type" = "String" ]; then
           code="${element}: '',${lineBreak}" 
        elif [[ "$type" = \@List* ]]; then
           code= "${element}: BuiltList<${type}Entity>(),${lineBreak}" 
        else 
           code="${element}: ${type}Entity(),${lineBreak}" 
        fi
        sed -i "/$code/d" $file
        sed -i -e "s/$comment/$comment${lineBreak}$code/g" $file

        comment="STARTER: controllers - do not remove comment"
        if [[ !  -z  $IncludedFields  ]]; then
                IFS='[]' read -r -a includedFieldsArray <<< "$IncludedFields"
                for (( jdx=${#includedFieldsArray[@]}-1 ; jdx>=0 ; jdx-- )) ; do
                    IncludedField=${includedFieldsArray[jdx]}
                    if [[ !  -z  $IncludedField  ]]; then
                        IFS='-' read -r -a includedFieldArray <<< "$IncludedField"
                        fieldName=${includedFieldArray[0]}
                        FieldName="$(tr '[:lower:]' '[:upper:]' <<< ${fieldName:0:1})${fieldName:1}"
                        code="final _${element}${FieldName}Controller = TextEditingController();${lineBreak}"
                        sed -i "/$code/d" "./lib/ui/${module}/edit/${module}_edit.dart"
                        sed -i -e "s/$comment/$comment${lineBreak}$code/g" "./lib/ui/${module}/edit/${module}_edit.dart"
                    fi
                done
        else 
            code="final _${element}Controller = TextEditingController();${lineBreak}"
            sed -i "/$code/d" "./lib/ui/${module}/edit/${module}_edit.dart"
            sed -i -e "s/$comment/$comment${lineBreak}$code/g" "./lib/ui/${module}/edit/${module}_edit.dart"
        fi

        comment="STARTER: array - do not remove comment"
        if [[ !  -z  $IncludedFields  ]]; then
                IFS='[]' read -r -a includedFieldsArray <<< "$IncludedFields"
                for (( jdx=${#includedFieldsArray[@]}-1 ; jdx>=0 ; jdx-- )) ; do
                    IncludedField=${includedFieldsArray[jdx]}
                    if [[ !  -z  $IncludedField  ]]; then
                        IFS='-' read -r -a includedFieldArray <<< "$IncludedField"
                        fieldName=${includedFieldArray[0]}
                        FieldName="$(tr '[:lower:]' '[:upper:]' <<< ${fieldName:0:1})${fieldName:1}"
                        code="_${element}${FieldName}Controller,${lineBreak}"
                        sed -i -e "s/$comment/$comment${lineBreak}$code/g" "./lib/ui/${module}/edit/${module}_edit.dart"
                    fi
                done
        else 
            code="_${element}Controller,${lineBreak}"
            sed -i -e "s/$comment/$comment${lineBreak}$code/g" "./lib/ui/${module}/edit/${module}_edit.dart"
        fi

        comment="STARTER: read value - do not remove comment"
        if [ "$type" = "double" ]; then
           code="_${element}Controller.text = formatNumber(${module}.${element}, context, formatNumberType: FormatNumberType.input);${lineBreak}"
        elif [ "$type" = "int" ]; then
           code="_${element}Controller.text = ${module}.${element}.toString();${lineBreak}"
        elif [ "$type" = "bool" ]; then
           code="_${element}Controller.text = ${module}.${element} ? 'true' : 'false';${lineBreak}"
        elif [ "$type" = "String" ]; then
           code="_${element}Controller.text = ${module}.${element};${lineBreak}"
        else 
            if [[ !  -z  $IncludedFields  ]]; then
                code=""
                IFS='[]' read -r -a includedFieldsArray <<< "$IncludedFields"
                for (( jdx=${#includedFieldsArray[@]}-1 ; jdx>=0 ; jdx-- )) ; do
                    IncludedField=${includedFieldsArray[jdx]}
                    if [[ !  -z  $IncludedField  ]]; then
                        #echo "   with included field: $IncludedField"
                        IFS='-' read -r -a includedFieldArray <<< "$IncludedField"
                        fieldName=${includedFieldArray[0]}
                        FieldName="$(tr '[:lower:]' '[:upper:]' <<< ${fieldName:0:1})${fieldName:1}"
                        fieldType=${includedFieldArray[1]}
                        echo "   with included field: $fieldName - $fieldType"
                        if [ "$fieldType" = "double" ]; then
                            code="${code}_${element}${FieldName}Controller.text = formatNumber(${module}.${element}.${fieldName}, context, formatNumberType: FormatNumberType.input);${lineBreak}"
                        elif [ "$fieldType" = "int" ]; then
                            code="${code}_${element}${FieldName}Controller.text = ${module}.${element}.${fieldName}.toString();${lineBreak}"
                        elif [ "$fieldType" = "bool" ]; then
                            code="${code}_${element}${FieldName}Controller.text = ${module}.${element}.${fieldName} ? 'true' : 'false';${lineBreak}"
                        elif [ "$fieldType" = "String" ]; then
                            code="${code}_${element}${FieldName}Controller.text = ${module}.${element}.${fieldName};${lineBreak}"
                        fi
                    fi
                done
            fi
        fi
        sed -i -e "s/$comment/$comment${lineBreak}$code/g" "./lib/ui/${module}/edit/${module}_edit.dart"

        comment="STARTER: set value - do not remove comment"
        if [ "$type" = "double" ]; then
           code="..${element} = parseDouble(_${element}Controller.text.trim())${lineBreak}"
        elif [ "$type" = "int" ]; then
           code="..${element} = int.tryParse(_${element}Controller.text.trim())${lineBreak}"
        elif [ "$type" = "bool" ]; then
           code="..${element} = _${element}Controller.text.trim()=='true'?true:false${lineBreak}"
        elif [ "$type" = "String" ]; then
           code="..${element} = _${element}Controller.text.trim()${lineBreak}"
        else 
            if [[ !  -z  $IncludedFields  ]]; then
                code="..${element}.update((p)=>p${lineBreak}"
                    IFS='[]' read -r -a includedFieldsArray <<< "$IncludedFields"
                    for (( jdx=${#includedFieldsArray[@]}-1 ; jdx>=0 ; jdx-- )) ; do
                        IncludedField=${includedFieldsArray[jdx]}
                        if [[ !  -z  $IncludedField  ]]; then
                            #echo "   with included field: $IncludedField"
                            IFS='-' read -r -a includedFieldArray <<< "$IncludedField"
                            fieldName=${includedFieldArray[0]}
                            FieldName="$(tr '[:lower:]' '[:upper:]' <<< ${fieldName:0:1})${fieldName:1}"
                            fieldType=${includedFieldArray[1]}
                            if [ "$fieldType" = "double" ]; then
                                code="${code}   ..${fieldName} = parseDouble(_${element}${FieldName}Controller.text.trim())${lineBreak}"
                            elif [ "$fieldType" = "int" ]; then
                                code="${code}   ..${fieldName} = int.tryParse(_${element}${FieldName}Controller.text.trim())${lineBreak}"
                            elif [ "$fieldType" = "bool" ]; then
                                code="${code}   ..${fieldName} = _${element}${FieldName}Controller.text.trim()=='true'?true:false${lineBreak}"
                            elif [ "$fieldType" = "String" ]; then
                                code="${code}   ..${fieldName} = _${element}${FieldName}Controller.text.trim()${lineBreak}"
                            fi
                        fi
                    done
                code="${code})"
            fi
        fi
        sed -i -e "s/$comment/$comment${lineBreak}$code/g" "./lib/ui/${module}/edit/${module}_edit.dart"

        comment="STARTER: widgets - do not remove comment"
        if [ "$type" = "bool" ] || [ "$type" = "int" ] || [ "$type" = "double" ] || [ "$type" = "String" ]; then
            code="TextFormField(${lineBreak}"
            code="${code}controller: _${element}Controller,${lineBreak}"
            code="${code}autocorrect: false,${lineBreak}"
            if [ "$FormFieldType" = "FormFieldType.textarea" ]; then
                code="${code}maxLines: 4,${lineBreak}"
            fi
            code="${code}decoration: InputDecoration(${lineBreak}"
            code="${code}labelText: '${Element}',${lineBreak}"
            code="${code}),${lineBreak}"
            code="${code}),${lineBreak}"
            sed -i -e "s/$comment/$comment${lineBreak}$code/g" "./lib/ui/${module}/edit/${module}_edit.dart"
        else 
            if [[ !  -z  $IncludedFields  ]]; then
                code="..${element}.update((p)=>p${lineBreak}"
                    IFS='[]' read -r -a includedFieldsArray <<< "$IncludedFields"
                    for (( jdx=${#includedFieldsArray[@]}-1 ; jdx>=0 ; jdx-- )) ; do
                        IncludedField=${includedFieldsArray[jdx]}
                        if [[ !  -z  $IncludedField  ]]; then
                            #echo "   with included field: $IncludedField"
                            IFS='-' read -r -a includedFieldArray <<< "$IncludedField"
                            fieldName=${includedFieldArray[0]}
                            FieldName="$(tr '[:lower:]' '[:upper:]' <<< ${fieldName:0:1})${fieldName:1}"
                            
                            code="TextFormField(${lineBreak}"
                            code="${code}controller: _${element}${FieldName}Controller,${lineBreak}"
                            code="${code}autocorrect: false,${lineBreak}"
                            code="${code}decoration: InputDecoration(${lineBreak}"
                            code="${code}labelText: '${FieldName}',${lineBreak}"
                            code="${code}),${lineBreak}"
                            code="${code}),${lineBreak}"
                            sed -i -e "s/$comment/$comment${lineBreak}$code/g" "./lib/ui/${module}/edit/${module}_edit.dart"
                        fi
                    done
                code="${code})"
            fi
        fi
       

        comment="STARTER: widgets - do not remove comment"
        if [ ${element} = ${fieldsArray[0]} ]; then
            code="Text(${module}.${element}, style: Theme.of(context).textTheme.title),${lineBreak}"
            code="${code}SizedBox(height: 12.0),${lineBreak}"
        else
            if [ "$type" = "double" ]; then
              code="Text(formatNumber(${module}.${element}, context, formatNumberType: FormatNumberType.input)),"
            elif [ "$type" = "int" ]; then
              code="Text( ${module}.${element}.toString()),"
            elif [ "$type" = "bool" ]; then
              code="Text(${module}.${element} ? 'true' : 'false'),"
            elif [ "$type" = "String" ]; then
              code="Text(${module}.${element}),"
            else 
              code="Text(${module}.${element}.listDisplayName),"
            fi
        fi
        sed -i -e "s/$comment/$comment${lineBreak}$code/g" "./lib/ui/${module}/view/${module}_view.dart"

        comment="STARTER: sort - do not remove comment"
        if [ "$type" = "String" ]; then
            code="${Module}Fields.${element},${lineBreak}"
            sed -i -e "s/$comment/$comment${lineBreak}$code/g" "./lib/ui/${module}/${module}_screen.dart"
        fi

        if [ "$idx" -eq 0 ]; then
            comment="STARTER: sort default - do not remove comment"
            code="return ${module}A.${element}.compareTo(${module}B.${element});${lineBreak}"
            sed -i -e "s/$comment/$comment${lineBreak}$code/g" "./lib/data/models/${module}_model.dart"

            comment="STARTER: display name - do not remove comment"
            if [ "$type" = "String" ]; then
                code="return ${element};${lineBreak}"
            else
                code="return ${element}.toString();${lineBreak}"
            fi
            sed -i -e "s/$comment/$comment${lineBreak}$code/g" "./lib/data/models/${module}_model.dart"
        fi

        if [ "$idx" -eq 1 ]; then
            comment="STARTER: subtitle - do not remove comment"
            code="subtitle: Text(${module}.${element}, maxLines: 4),${lineBreak}"
            sed -i -e "s/$comment/$comment${lineBreak}$code/g" "./lib/ui/${module}/${module}_item.dart"
        fi
    done


    file="./lib/main.dart"
    comment="STARTER: import - do not remove comment"
    firstLine="import 'package:${package}\/ui\/${module}\/${module}_screen.dart';${lineBreak}"
        code="${firstLine}import 'package:${package}\/ui\/${module}\/edit\/${module}_edit_vm.dart';${lineBreak}"
        code="${code}import 'package:${package}\/ui\/${module}\/view\/${module}_view_vm.dart';${lineBreak}"
        code="${code}import 'package:${package}\/redux\/${module}\/${module}_actions.dart';${lineBreak}"
        code="${code}import 'package:${package}\/redux\/${module}\/${module}_middleware.dart';${lineBreak}"
    lastLine="import 'package:${package}\/data\/repositories\/${module}_repository_firestore.dart';"
    code="${code}${lastLine}"
    sed -i "/${firstLine%"$lineBreak"}/,/${lastLine}/d" $file
    sed -i -e "s/$comment/$comment${lineBreak}$code/g" $file

    comment="STARTER: middleware - do not remove comment"
    code="..addAll(createStore${Module}sMiddleware(new ${Module}Repository(Firestore.instance)))"
    sed -i "/$code/d" $file
    sed -i -e "s/$comment/$comment${lineBreak}$code/g" $file

    comment="STARTER: routes - do not remove comment"
    firstLine="${Module}Screen.route: (context) {${lineBreak}";
        code="${firstLine}widget.store.dispatch(Load${Module}s());${lineBreak}"
        code="${code}return ${Module}Screen();${lineBreak}"
        code="${code}},${lineBreak}"
        code="${code}${Module}ViewScreen.route: (context) => ${Module}ViewScreen(),${lineBreak}"
    lastLine="${Module}EditScreen.route: (context) => ${Module}EditScreen(),";
    code="${code}${lastLine}"
    sed -i "/${firstLine%"$lineBreak"}/,/${lastLine}/d" $file
    sed -i -e "s/$comment/$comment${lineBreak}$code/g" $file


    file="./lib/data/models/serializers.dart"
    comment="STARTER: import - do not remove comment"
    firstLine="import 'package:${package}\/data\/models\/${module}_model.dart';${lineBreak}"
    lastLine="import 'package:${package}\/redux\/${module}\/${module}_state.dart';"
    code="${firstLine}${lastLine}"
    sed -i "/${firstLine%"$lineBreak"}/,/${lastLine}/d" $file
    sed -i -e "s/$comment/$comment${lineBreak}$code/g" $file

    comment="STARTER: serializers - do not remove comment"
    code="  ${Module}Entity,"
    sed -i "/$code/d" $file
    sed -i -e "s/$comment/$comment${lineBreak}$code/g" $file


    file="./lib/redux/app/data_state.dart"
    comment="STARTER: import - do not remove comment"
    code="import 'package:${package}\/redux\/${module}\/${module}_state.dart';"
    sed -i "/$code/d" $file
    sed -i -e "s/$comment/$comment${lineBreak}$code/g" $file

    comment="STARTER: fields - do not remove comment"
    code="${Module}State get ${module}State;"
    sed -i "/$code/d" $file
    sed -i -e "s/$comment/$comment${lineBreak}$code/g" $file


    file="./lib/redux/app/data_state.dart"
    comment="STARTER: constructor - do not remove comment"
    code="${module}State: ${Module}State(),"
    sed -i "/$code/d" $file
    sed -i -e "s/$comment/$comment${lineBreak}$code/g" $file


    file="./lib/redux/app/data_reducer.dart"
    comment="STARTER: import - do not remove comment"
    code="import 'package:${package}\/redux\/${module}\/${module}_reducer.dart';"
    sed -i "/$code/d" $file
    sed -i -e "s/$comment/$comment${lineBreak}$code/g" $file

    comment="STARTER: reducer - do not remove comment"
    code="..${module}State.replace(${module}sReducer(state.${module}State, action))"
    sed -i "/$code/d" $file
    sed -i -e "s/$comment/$comment${lineBreak}$code/g" $file


    file="./lib/ui/app/app_drawer.dart"
    comment="STARTER: import - do not remove comment"
    code="import 'package:${package}\/redux\/${module}\/${module}_actions.dart';"
    sed -i "/$code/d" $file
    sed -i -e "s/$comment/$comment${lineBreak}$code/g" $file

    comment="STARTER: menu - do not remove comment"
    firstLine="ListTile( \/\/--${Module}${lineBreak}"
        code="${firstLine}leading: Icon(Icons.widgets),${lineBreak}"
        code="${code}title: Text('${Module}s'),${lineBreak}"
    lastLine="onTap: () => store.dispatch(View${Module}List(context)),),"
    code="${code}${lastLine}"
    sed -i "/${firstLine%"$lineBreak"}/,/${lastLine}/d" $file
    sed -i -e "s/$comment/$comment${lineBreak}$code/g" $file


    file="./lib/data/models/entities.dart"
    comment="STARTER: types - do not remove comment"
    code="static const EntityType ${module} = _$"
    code="${code}${module};"
    sed -i "/$code/d" $file
    sed -i -e "s/$comment/$comment${lineBreak}$code/g" $file

    
    file="./lib/redux/ui/ui_state.dart"
    comment="STARTER: import - do not remove comment"
    code="import 'package:${package}\/redux\/${module}\/${module}_state.dart';"
    sed -i "/$code/d" $file
    sed -i -e "s/$comment/$comment${lineBreak}$code/g" $file

    comment="STARTER: properties - do not remove comment"
    code="${Module}UIState get ${module}UIState;"
    sed -i "/$code/d" $file
    sed -i -e "s/$comment/$comment${lineBreak}$code/g" $file

    comment="STARTER: constructor - do not remove comment"
    code="${module}UIState: ${Module}UIState(),"
    sed -i "/$code/d" $file
    sed -i -e "s/$comment/$comment${lineBreak}$code/g" $file


    file="./lib/redux/ui/ui_reducer.dart"
    comment="STARTER: import - do not remove comment"
    code="import 'package:${package}\/redux\/${module}\/${module}_reducer.dart';"
    sed -i "/$code/d" $file
    sed -i -e "s/$comment/$comment${lineBreak}$code/g" $file

    comment="STARTER: reducer - do not remove comment"
    code="..${module}UIState.replace(${module}UIReducer(state.${module}UIState, action))"
    sed -i "/$code/d" $file
    sed -i -e "s/$comment/$comment${lineBreak}$code/g" $file

fi

echo "Successfully completed"