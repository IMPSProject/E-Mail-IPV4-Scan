#!/bin/bash
for i in `seq 0 256`; do
	for j in `seq 0 256`; do
		for k in `seq 0 256`; do
			for l in `seq 0 256`; do
				whois $i.$j.$k.$l | grep 'e-mail' | awk '{print $2}' >> global.txt &
			done
		done
		sort global.txt -u -o global.txt
		"E-mails: "cat global.txt | wc -l
	done
done
