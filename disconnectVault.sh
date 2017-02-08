
#!/bin/bash
#some params
vault="${1}Vault"
clearDir="/opt/secure/${vault}"
#some helpers
strindex() {
  x="${1%%$2*}"
  index=$( [[ $x = $1 ]] && echo -1 || echo  ${#x})
}
######################### start ########################

echo "disconnecting ${vault}"
echo "unmounting webDav from ${clearDir}"
umount $clearDir
echo "get screensID of ${vault}"
screensList=$(screen -list)
if [[ $screensList == *"$vault"* ]]; then
        echo "${vault}s screen was opened"
        strindex "$screensList" "$vault"
        indexOfSession=$index-5
        sessionID=${screensList:$indexOfSession:4}
        sessionName="${sessionID}.${vault}"
        echo "Session: $sessionName will be closed"
        screen -r $sessionName -X quit
else
        echo "${vault}s screen was not found"
fi
