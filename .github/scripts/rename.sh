# /Users/CS012/Abdul/ReactNative/Practice/AwesomeProject/package.json

#!/bin/zsh
set -e
RED='\033[0;31m'
GREEN='\033[0;32m'
WHITE='\033[1;37m'
project_name=$1
APP_NAME=$2
# SCRIPT_PATH=$3
# GLOBAL_PATH=/Users/CS012/Abdul/ReactNative/Practice/AwesomeProjects
# GLOBAL_PATH='/Users/CS012/Abdul/ReactNative/Practice/AwesomeProject'

# *** CHANGE DIRECTORY TO THE GLOBAL PATH ***
echo "Project Name ${1}"
# ${PWD} working dir
echo "App Name ${2}"
# if [[ -n "$1" || -n "$2" ]]
# then
    # cd "${GLOBAL_PATH}"
    # echo "GLOBAL_PATH PWD==> ${PWD}"
    # echo "GLOBAL_PATH ==> ${GLOBAL_PATH}"
    # yarn

    # # *** REMOVE SPACES IN VARIABLE ***
    # # ${str// /_}

    # # # *** RENAMING PROJECT ***
    npx react-native-rename $project_name -b com.$project_name

    # # *** RENAMING APP NAME IOS***
    echo "IOS time PWD 11 ==> ${PWD}"
    ls
    # echo "IOS time LSLS ==> ${ls}"

    echo "IOS time PWD 22 ==> ${PWD}"
    cd ios
    ls
    echo "@@@@@@ ==> ${PWD}"
    echo "project name ==> $project_name"
    # echo "project path ==> $project_name.xcodeproj/project.pbxproj"
    # echo "project path 222 ==> $project_name.xcodeproj/project.pbxproj"
    # sed -i '' -e "s,PRODUCT_BUNDLE_IDENTIFIER = .*,PRODUCT_BUNDLE_IDENTIFIER = com.$project_name,g" $project_name.xcodeproj/project.pbxproj
    # echo "@@@@@@ 2222 ==> ${PWD}"
    # # *** RENAMING APP NAME ANDROID***
    echo "IOS time PWD 33 ==> ${PWD}"
    echo "IOS project_name 11 ==> ${project_name}"
    ls
    echo "IOS project_name before 1.5555  ls"
    cd $project_name
    ls
    echo "IOS project_name 22 after ls"
    echo ${APP_NAME}
    echo "PLOLOO ::<> plutil -replace CFBundleDisplayName -string $APP_NAME Info.plist"
    plutil -replace CFBundleDisplayName -string $APP_NAME Info.plist
    echo "after RENAMING GLOBAL_PATH ==> ls"

    echo "android time PWD 44 ==> ${PWD}"
    ls
    cd /android/app/src/main/res/values 
    ls
    echo "android time PWD after ls ==> ${PWD}"
    sed -i "" -e 's+<string name="app_name">.*</string>+<string name="app_name">'${APP_NAME}'</string>+g' strings.xml
    ls
    # echo "DONE ==> ${PWD}"
    # # cd $SCRIPT_PATH 
    # # sh ./generate-apk.sh $1 $GLOBAL_PATH
    
    echo "RENAMING THE PROJECT NAME IS COMPLETED"
# else
#     echo "Package-Name OR App-Name Not Found"
# fi
