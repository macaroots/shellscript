#!/bin/bash

inputFile=parameters.txt
outputFile=test.env
errorCount=0
successCount=0

# cria/limpa o arquivo
> $outputFile

# trata a opção -d
decriptionType=
while getopts ":d" option; do
   case $option in
      d) decriptionType=--with-decryption
         ;;
   esac
done

export_aws_parameter() {
    parameterName=$1
    variableName=$2
    decriptionType=$3
    fetch_aws_parameter $parameterName $decriptionType
    export_to_file $variableName $parameter
    export_to_environment $variableName $parameter
    echo "Exported \"$parameterName\" to \"$variableName\""
}

fetch_aws_parameter() {
    parameterName=$1
    decriptionType=$2
    
    echo 'Fetching AWS parameter "'$parameterName'"'
    parameter=$parameterName:$($decriptionType 2>&1) #aws ssm get-parameter $parameterName 2>&1)
    case "$parameter" in
        *'not found'* )
            errorCount=$((errorCount+1))
            echo 'Error: Comando "aws" não encontrado!' >&2
            parameter=Error
            ;;
        * )
            successCount=$((successCount+1))
            ;;
    esac
}

export_to_file() {
    variableName=$1
    parameter=$2
    echo $variableName=$parameter >> $outputFile
}

export_to_environment() {
    variableName=$1
    parameter=$2
    export $variableName=$parameter
}


echo Reading \"$inputFile\"
while read line
do
    export_aws_parameter $line
done < $inputFile
echo Finished processing!
echo Success: $successCount, Errors: $errorCount
