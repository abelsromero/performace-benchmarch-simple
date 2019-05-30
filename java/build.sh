#!/bin/bash

if [ -z "$JAVA_HOME" ]
then
 echo "env var JAVA_HOME is not set"
 exit -1
else
 __java_ver=$(java -version 2>&1)
   if [[ $__java_ver =~ "Graal" ]];
   then
     echo "GraalVM found"
   else
     echo "Found Java is not a GraalVM instance"
     exit -1
   fi
fi

./gradlew clean shadowJar

cd build/libs

native-image \
-cp numbers-runner-all.jar \
-H:+ReportUnsupportedElementsAtRuntime \
-H:Name=number-runner \
org.abelsromero.benchmark.App

# cp $JAVA_HOME/jre/lib/amd64/libsunec.so .