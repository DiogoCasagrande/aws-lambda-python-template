#!/usr/bin/env bash

if [ -e "lambda.zip" ]; then
   rm lambda.zip
fi

virtualenv env
source env/bin/activate

pip3 install -r requirements.txt

mkdir dist
cp -rf env/lib/python3.*/site-packages/* dist

cp src/*.py dist

cd dist
zip -r lambda.zip .

cd ..
mv dist/lambda.zip .
rm -rf dist env
