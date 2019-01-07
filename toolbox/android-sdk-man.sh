#!/bin/bash

if [ $# -lt 2 ]; then
	echo "Usage: $0 install|manage [OPTIONS]";
	exit 1;
elif ! command bsdtar -h > /dev/null 2> /dev/null ; then
  echo "Error: The dependency 'bsdtar' not found on the system path";
	exit 1;
fi

function installAndroidSDK {
  ANDROID_HOME=$1

  if [ -d "${ANDROID_HOME}" ]; then
    echo "Error: Android SDK tools have already been installed at this location '$ANDROID_HOME', delete the folder to re-install"
  else
    mkdir ${ANDROID_HOME} && \
      curl -s https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip | bsdtar -xf - -C ${ANDROID_HOME} && \
      find ${ANDROID_HOME}/tools -type f -exec chmod +x '{}' \; && \
      echo "Info: Installation complete"
  fi
}

function installTools {
  if [ $# -eq 2 ]; then
    BUILD_TOOLS_VERSION=$1
    TARGET_SDK_VERSION=$2
  elif [ $# -eq 3 ]; then
    ANDROID_HOME=$1
    BUILD_TOOLS_VERSION=$2
    TARGET_SDK_VERSION=$3
  fi

  if [ ! -d "$ANDROID_HOME" ]; then
    echo "Error: The ANDROID_HOME environment variable is not set, please specify the path as a the first argument or set the variable"
    exit 1;
  fi

  yes | ${ANDROID_HOME}/tools/bin/sdkmanager "platforms;android-${TARGET_SDK_VERSIOn}"
  yes | ${ANDROID_HOME}/tools/bin/sdkmanager "platform-tools"
  yes | ${ANDROID_HOME}/tools/bin/sdkmanager "build-tools;${BUILD_TOOLS_VERSION}"
  yes | ${ANDROID_HOME}/tools/bin/sdkmanager "extras;android;m2repository"
  yes | ${ANDROID_HOME}/tools/bin/sdkmanager "extras;google;m2repository"
  yes | ${ANDROID_HOME}/tools/bin/sdkmanager "extras;google;google_play_services"
  yes | ${ANDROID_HOME}/tools/bin/sdkmanager --licenses
  echo "Info: Installation complete"
}

OPERATION=$1
case "$OPERATION" in
  install)
    installAndroidSDK $2
    ;;
  manage)
    installTools $2 $3 $4
    ;;
  *)
	echo "Usage:
    $0 install /path/to/android/sdk                                        # Install Android SDK tools to the given directory
    $0 manage /path/to/android/sdk build.tool.version target.sdk.version   # Install the sdk tools for the given build tools and target sdk versions
    $0 manage build.tool.version target.sdk.version                        # Install the sdk tools for the given build tools and target sdk versions (assumes the ANDROID_HOME environment variable is set)";
    exit 1
    ;;
esac

exit 0

