**vsphereyeeter.sh** is an automated bash script to exploit vulnerabilty **CVE-2021-21972** in the vSphere Client for vCenter servers. Once executed simply give it the IP Address of your vulnerable target and you will be presented with an SSH shell.

"*The vSphere Client (HTML5) contains a remote code execution vulnerability in a vCenter Server plugin. A malicious actor with network access to port 443 may exploit this issue to execute commands with unrestricted privileges on the underlying operating system that hosts vCenter Server. This affects VMware vCenter Server (7.x before 7.0 U1c, 6.7 before 6.7 U3l and 6.5 before 6.5 U3n) and VMware Cloud Foundation (4.x before 4.2 and 3.x before 3.10.1.2)." - mitre*

Great write-up of the vulnerability here: https://swarm.ptsecurity.com/unauth-rce-vmware/

## Prerequisites:
	Download the evilarc.py script from https://github.com/ptoomey3/evilarc and place it in the same directory as this script.

## Automated Steps:
	1. Create SSH Keypair
	2. Add your public key into directory traversal archive w/ evilarc
	3. Send request to vSphere to add your ssh key to the authorized_keys directory (it will create one if one does not exists)

*written by @PettyHacks*


![alt text](https://i.imgur.com/ZW8S83D.jpeg)
