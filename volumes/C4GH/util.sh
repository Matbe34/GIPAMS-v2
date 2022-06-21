#!/bin/bash

if [ $1 == "encrypt" ]; then
	crypt4gh encrypt --recipient_pk /opt/C4GH/.c4gh/key.pub <<< "$2" > /opt/C4GH/M.c4gh
	cat /opt/C4GH/M.c4gh | base64
	rm /opt/C4GH/M.c4gh

elif [ $1 == "decrypt" ]; then
	#crypt4gh decrypt --sk /home/alumne/.c4gh/key < /opt/C4GH/M.c4gh
	crypt4gh decrypt --sk /opt/C4GH/.c4gh/key < /opt/C4GH/M.c4gh
	#{ cat /opt/C4GH/M.c4gh;sleep 0.1;echo "1234"; } | crypt4gh decrypt --sk /home/alumne/.c4gh/key 
else echo ""
fi

