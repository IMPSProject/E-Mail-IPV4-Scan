#!/bin/bash
exiting(){
	tput clear
	echo -e "${BOLD}Exiting..${NC}"
	sort global.txt -u -o global.txt
	echo "E-mails: " `cat global.txt | wc -l`
	exit 1
}
trap exiting SIGINT # Ctrl+C
trap exiting SIGQUIT # Terminate
trap exiting SIGTSTP # Ctrl+Z
for i in `seq 1 256`; do
	for j in `seq 1 256`; do
		for k in `seq 1 256`; do
			for l in `seq 1 256`; do
				whois $i.$j.$k.$l | grep 'e-mail' | awk '{print $2}' >> global.txt &
			done
			sort global.txt -u -o global.txt
			echo "E-mails: " `cat global.txt | wc -l`
		done
	done
done
