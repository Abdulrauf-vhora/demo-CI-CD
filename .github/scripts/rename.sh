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
    cd /ios
    sed -i '' -e "s,PRODUCT_BUNDLE_IDENTIFIER = .*,PRODUCT_BUNDLE_IDENTIFIER = com.$project_name;,g" ./$project_name.xcodeproj/project.pbxproj
    ls
    # # *** RENAMING APP NAME ANDROID***
    echo "IOS time PWD 33 ==> ${PWD}"
    cd "/ios/$project_name"
    plutil -replace CFBundleDisplayName -string $APP_NAME Info.plist
    ls
    # echo "after RENAMING GLOBAL_PATH ==> ${GLOBAL_PATH}"

    echo "android time PWD 44 ==> ${PWD}"
    cd "/android/app/src/main/res/values"
    sed -i "" -e 's+<string name="app_name">.*</string>+<string name="app_name">'${APP_NAME}'</string>+g' strings.xml
    ls
    # echo "DONE ==> ${PWD}"
    # # cd $SCRIPT_PATH 
    # # sh ./generate-apk.sh $1 $GLOBAL_PATH
    
    echo "RENAMING THE PROJECT NAME IS COMPLETED"
# else
#     echo "Package-Name OR App-Name Not Found"
# fi
