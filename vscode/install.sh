#! /bin/bash

EXT_FILENAME=extensions
CODE=code

$CODE --help > /dev/null
if [ $? -ne 0 ]; then
    echo 'ERR: fail to execute code command.'
    exit 255
fi

echo 'Start to install vscode extensions...'

while read line
do
    $CODE --install-extension $line
done < $EXT_FILENAME

echo 'done'
