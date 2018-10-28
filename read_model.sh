echo "Flutter/Redux RAD - model file reader"

[ $# -eq 0 ] && { echo "Usage: $0 init or $0 make <package> <module-name> <field:type> or $0 make <package> -f <filename>"; exit 1; }

action="$1"
lineBreak='\'$'\n'

if [ ${action} = "init" ]; then
    echo "nothing"
else
    package="$2"
    echo "Package: $package"

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
                        #echo "Metadata found: $fieldMetadata"
                    
                    elif [[ "${element}" = \@IncludedFields* ]]; then
                        IFS='({})' read -r -a metadataElement <<< "$element" 
                        tmp=${metadataElement[2]//\'/}
                        tmp=${tmp//:/-}
                        tmp=${tmp//,/][}
                        includedFields="includedFields=[$tmp]"
                        echo "Metadata found: ${includedFields}"

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
    
    Module="$(tr '[:lower:]' '[:upper:]' <<< ${module:0:1})${module:1}"
    IFS=', ' read -r -a fieldsArray <<< "$fields"

    echo "Make..."
    echo "creating module: $module | $Module"

    for (( idx=${#fieldsArray[@]}-1 ; idx>=0 ; idx-- )) ; do
        elements="${fieldsArray[idx]}"
        echo "with field: $elements"
    done
fi