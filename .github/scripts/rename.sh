# /Users/CS012/Abdul/ReactNative/Practice/AwesomeProject/package.json

#!/bin/zsh
set -e
RED='\033[0;31m'
GREEN='\033[0;32m'
WHITE='\033[1;37m'
project_name=$1
APP_NAME=$2
# SCRIPT_PATH=$3
GLOBAL_PATH=$3
# GLOBAL_PATH='/Users/CS012/Abdul/ReactNative/Practice/AwesomeProject'
SCRIPT_PATH='/Users/CS012/Abdul/Script'

# *** CHANGE DIRECTORY TO THE GLOBAL PATH ***
echo "Project Name ${1}"
# ${PWD} working dir
echo "App Name ${2}"
# if [[ -n "$1" || -n "$2" ]]
# then
    # cd "${GLOBAL_PATH}"
    echo "GLOBAL_PATH PWD==> ${PWD}"
    echo "GLOBAL_PATH ==> ${GLOBAL_PATH}"
    # yarn

    # # *** REMOVE SPACES IN VARIABLE ***
    # # ${str// /_}

    # # # *** RENAMING PROJECT ***
    npx react-native-rename $project_name -b com.$project_name

    # # *** RENAMING APP NAME IOS***
    cd "${GLOBAL_PATH}/ios"
    sed -i '' -e "s,PRODUCT_BUNDLE_IDENTIFIER = .*,PRODUCT_BUNDLE_IDENTIFIER = com.$project_name;,g" ./$project_name.xcodeproj/project.pbxproj

    # # *** RENAMING APP NAME ANDROID***
    cd "${GLOBAL_PATH}/ios/$project_name"
    plutil -replace CFBundleDisplayName -string $APP_NAME Info.plist

    cd "${GLOBAL_PATH}/android/app/src/main/res/values"
    sed -i "" -e 's+<string name="app_name">.*</string>+<string name="app_name">'${APP_NAME}'</string>+g' strings.xml

    # # cd $SCRIPT_PATH 
    # # sh ./generate-apk.sh $1 $GLOBAL_PATH
    
    # echo "RENAMING THE PROJECT NAME IS COMPLETED"
# else
#     echo "Package-Name OR App-Name Not Found"
# fi
