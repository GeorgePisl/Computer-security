#!/bin/bash
input="english.txt"
START=$(date +%s)
while IFS=$' \t\n\r' read -r LINE
do
    openssl enc -aes-192-cbc -pbkdf2 -d -in ciphertext.enc -out risultato.txt -pass pass:$LINE
    echo $LINE
    if [ "$(file risultato.txt)" = "risultato.txt: ASCII text" ]
    then 
        echo "PASSWORD:"$LINE>>outputshell.txt
        END=$(date +%s.%3N)
        break       
    fi
done < "$input"
DIFF=$(echo "$END - $START" | bc)
echo "Total time: "$DIFF>>outputshell.txt





