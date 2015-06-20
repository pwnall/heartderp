#! /usr/bin/bash

git submodule update --init --recursive

mkdir -p bin

mkdir -p build/MPQExtractor
cd build/MPQExtractor
cmake ../../third_party/MPQExtractor
make
cd ../..
ln -s "$PWD/build/MPQExtractor/bin/MPQExtractor" bin/MPQExtractor

cd third_party/disunity
mvn package
cd ../..
ln -s \
    "$PWD/third_party/disunity/disunity-dist/target/disunity-dist-0.4.0-SNAPSHOT.jar" \
    bin/disunity.jar
