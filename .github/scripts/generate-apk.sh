#!/bin/bash
# GLOBAL_PATH='/Users/CS005/Kevin/Scripting/scripting-demo/react-native-app'

PROJECT_NAME=$1
GLOBAL_PATH=$2
# APK_RELEASE_PATH=$3
APK_PATH="${GLOBAL_PATH}/android/app/build/outputs/apk/release/"

echo "GLOBAL PATH ==> ${GLOBAL_PATH}"
echo "APK PATH ==> ${APK_PATH}"
# To delete old apk 
cd $APK_PATH
# rm *.apk
echo "GLOBAL PATH inside ==> ${GLOBAL_PATH}/android/"
cd "${GLOBAL_PATH}/android/"
./gradlew app:assembleRelease || { echo "Error while generatig apk"; exit; } 
# ./gradlew assembleRelease || { echo "Error while generatig apk"; exit; } 
# # if get error use below
# ./gradlew app:assembleRelease || { echo "Error while generatig apk"; exit; } 
# # renaming apk with projectname
cd $APK_PATH
mv app-release.apk $PROJECT_NAME.apk

mv "${PROJECT_NAME}.apk" "${APK_RELEASE_PATH}"

echo "APK generated successfully and moved to ${APK_RELEASE_PATH}/$PROJECT_NAME.apk"
