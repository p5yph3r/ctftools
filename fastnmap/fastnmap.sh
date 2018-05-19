# Fast-Nmap is a shell script which I wrote to save time,
# in CTF's, I find it very handy..!!!
# Feel free to use and edit the code according to your comfort.
# Written by p5yph3r.
# Email:- psypher1918@gmail.com Twitter:- p5yph3r
#
#!/bin/bash
#    .---------- constant part!
RED='\033[0;31m'
yellow='\033[1;33m'
blue='\033[1;34m' 
NC='\033[0m' # No Color

initial()
{
	echo "Select :"
	echo "1. Fast scan"
	echo "2. Exit"
	read -p "Easynmap --> " main_option
	if [[ $main_option -eq 1 ]]; then
   	echo -e "${blue}Fast Scan${blue}" 
   	fast_scan
fi
 
   	if [[ $main_option -eq 2 ]]; then
   	echo -e "${blue}EXIT${blue}" 
   	exit
fi
}

fast_scan()
{
echo -e "${blue}[+] Started Fast Scan Module ${NC}"
read -p "Enter Target IP -> " fast_target_ip
read -p "Specify Ports / Enter for default or other options -> " fast_target_port

	echo -e "${blue}**********Select syntax************${NC}"
	echo -e "** ${yellow}Port Scan ${NC}**"
	echo "1. nmap ip port (Basic nmap scan)"
	echo "2. nmap -sS (Scan using TCP SYN scan)"
	echo "3. nmap -sT (Scan using TCP connect)"
	echo "4. nmap -sU -p 123,161,162 (Scan UDP ports) "	
	echo "--------------------------------------"
	echo -e "**${yellow}Service and OS Detection${NC} **"
	echo "5. nmap -A (Detect OS and Services)"
	echo "6. nmap -sV (Standard service detection)"
	echo "7. nmap -sV --version-intensity 5 (More aggressive Service Detection) "
	echo "8. nmap -sV --version-intensity 0 (Lighter banner grabbing detection)"
	echo "--------------------------------------"
	echo -e "** ${yellow}others ${NC}**"
	echo "9. nmap -sS -A -p- ip --script=default"
	echo "10. nmap -v -sS -A -T4 target (Prints verbose output, runs stealth syn scan, T4 timing, OS and version detection + traceroute and scripts against target services.) "
	echo "11. nmap -p- -sV -sS -T4 (Full TCP port scan using with service version detection)" 
	echo "12. nmap -sP ip/24 (Ping scans the network, listing machines that respond to ping.)"
	echo "13. nmap -ss -sT ip"
	echo "14. nmap -v -p 1-65535 -sV -O -sS -T4"
	echo "15. EXIT"

read -p "[+]ENTER No.-->" fast_choice
	echo -e "${NC}"
	case $fast_choice in
		1) echo "[.1.] -> starting Basic nmap scan "
		   echo "nmap $fast_target_ip $fast_target_port"
		   nmap $fast_target_ip $fast_target_port
		   ;;
		2) echo "[.2.] -> Scan using TCP SYN scan  "
		   echo "nmap -sS $fast_target_ip $fast_target_port"
		   nmap  -sS $fast_target_ip $fast_target_port
		   ;;
		3) echo "[.3.] -> Scan using TCP connect "
		   echo "nmap -sT $fast_target_ip $fast_target_port"
		   nmap -sT $fast_target_ip $fast_target_port
		   ;;
		4) echo "[.4.] -> Scan UDP ports "
		   echo "nmap -sU -p 123,161,162 $fast_target_ip $fast_target_port"
		   nmap -sU -p 123,161,162 $fast_target_ip $fast_target_port
		   ;;
		5) echo "[.5.] -> Detect OS and Services "
		   echo "nmap -A $fast_target_ip $fast_target_port"
		   nmap -A $fast_target_ip $fast_target_port
		   ;;
		6) echo "[.6.] -> Standard service detection "
		   echo "nmap -sV $fast_target_ip $fast_target_port"
		   nmap -sV $fast_target_ip $fast_target_port
		   ;;
		7) echo "[.7.] -> More aggressive Service Detection "
		   echo "nmap -sV --version-intensity 5 $fast_target_ip $fast_target_port"
		   nmap -sV --version-intensity 5 $fast_target_ip $fast_target_port
		   ;;
		8) echo "[.8.] -> starting Basic nmap scan "
		   echo "nmap -sV --version-intensity 0 $fast_target_ip $fast_target_port"
		   nmap -sV --version-intensity 0 $fast_target_ip $fast_target_port
		   ;;
		9)  echo "[.9.] -> starting Basic nmap scan "
		   echo "nmap -sS -A -p- $fast_target_ip $fast_target_port --script=default"
		   nmap -sS -A -p- $fast_target_ip $fast_target_port --script=default
		   ;;
		10)   echo "[.10.] -> starting Basic nmap scan "
		   echo "nmap -v -sS -A -T4 $fast_target_ip $fast_target_port"
		   nmap -v -sS -A -T4 $fast_target_ip $fast_target_port
		   ;;
		11)   echo "[.11.] -> starting Basic nmap scan "
		   echo "nmap -p- -sV -sS -T4 $fast_target_ip $fast_target_port"
		   nmap -p- -sV -sS -T4 $fast_target_ip $fast_target_port
		   ;;
		12)   echo "[.12.] -> starting Basic nmap scan "
		   echo "nmap -sP ip/24 $fast_target_ip $fast_target_port"
		   nmap -sP ip/24 $fast_target_ip $fast_target_port
		   ;;
		13)   echo "[.13.] -> starting Basic nmap scan "
		   echo "nmap -ss -sT $fast_target_ip $fast_target_port"
		   nmap -ss -sT $fast_target_ip $fast_target_port
		   ;;
		14)   echo "[.14.] -> starting Basic nmap scan "
		   echo "nmap -v -p 1-65535 -sV -O -sS -T4 $fast_target_ip $fast_target_port"
		   nmap -v -p 1-65535 -sV -O -sS -T4 $fast_target_ip $fast_target_port
		   ;;
		15)   echo "[.15} Exit"
			exit
	esac
}
banner()
{
echo -e "${blue}"
echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" 
echo -e "~~               ${yellow}Easy-nmap${blue}                  ~~"
echo -e "~~     Easy nmap is an automation script    ~~"
echo -e "~~To save time and get the most out of nmap ~~"
echo -e "~~        *****${RED}Written by p5yph3r${blue}*****      ~~"
echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "${NC}"
}
chkroot()
{
	if [[ $EUID -ne 0 ]]; then
   	echo -e "${RED}This script must be run as root${NC}" 
   	exit 1
fi

}
select_target()
{
	# get the Info of the target
	read -p "Enter IP-Add / Domain name -->" ip

}
banner
chkroot
initial
#Thats it ..!!!


