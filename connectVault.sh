#!/bin/bash
#some consts
pathToCryptoRoot="/opt/cryptoRoot"
portOfWebDav="8080"

# some params
#1-> first part of tresor name
tresorName="${1}Vault"
echo "$tresorName"
#2-> password
pass=${2}
#functions

function createWebDav {
        echo "creating webDav instance of $tresorName"
        screen -dmS ${tresorName} java -jar cryptomator-cli-0.2.1.jar --bind 0.0.0.0 --port ${portOfWebDav} --vault ${tresorName}=${pathToCryptoRoot}/${tresorName} --password ${tresorName}=$pass
        echo "WebDavService was established, mounteable at: http://localhost:${portOfWebDav}/${tresorName}"
}

function checkForMounting {
$checkResult=$(df)
if [[ $checkResult == *"$pathToCryptoRoot"* ]]; then
        echo "$pathToCryptoRoot was mountet"
else
        echo "$pathToCryptoRoot was not mountet"
fi
}

######################## start ######################

#check if root is mountet
checkResult=$(df)
if [[ $checkResult == *"$pathToCryptoRoot"* ]]; then
        echo "$pathToCryptoRoot was mountet"
        createWebDav
        cd /opt/secure
        list=$(ls)
        if [[ $list == *"${tresorName}"* ]]; then
                echo "/opt/secure/${tresorName} does exist"
        else
                echo "/opt/secure/${tresorName} does not exist"
                mkdir ${tresorName}
                echo "created  /opt/secure/${tresorName}"
        fi
        mount -t davfs http://localhost:${portOfWebDav}/${tresorName} /opt/secure/${tresorName}
        echo "mounted ${tresorName} under /opt/secure/${tresorName}"
else
  echo "$pathToCryptoRoot was not mountet"
  echo "trying to mount $pathToCryptoRoot...."
  mount -a
  checkForMounting
fi
