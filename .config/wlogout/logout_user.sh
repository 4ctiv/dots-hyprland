#/bin/bash

USERNAME=""
if [[ "$1" = "" ]]; then
  USERNAME="$USER"
else
  if  [[ -z "$(w | awk "/$1/{print\$1}" )" ]];then
   echo "User '$1' has no active user session(-s)";
   exit 1;
 fi
 USERNAME="$1"
fi

echo "Logging out ${USERNAME:?not set}"
echo "Press [CTRL] + [C] to cancel"
echo "2 ..."
sleep 1s;
echo "1 ..."
sleep 1s;
pkill -KILL -u "${USERNAME:?not set}"

exit 0;
