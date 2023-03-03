![CISA](https://i.postimg.cc/jjfL0wQr/Immagine-2023-03-03-135805.jpg)
# Install documentation for Decider's AUTO installer.sh


Through the release of Decider software by the American governmental organization CISA GOV, an automatic approach is offered to categorize and map threats using the metrics of MITRE ATT&CK®. This makes the process of threat classification and comprehension extremely fast and versatile. Additionally, a dedicated and highly user-friendly GUI provides an extremely resilient and scalable contextualization capability for the end-user.

To simplify and automate the Decider installation process, a first BETA script has been created, which includes a BASH installer (currently semi-automatic). This allows the user to be guided step-by-step, from the boot phase to the final Decider installation, in a simple and automatic way.

The installer has been tested on few operating systems, including:

```
Ubuntu LTS 22.04.1
Ubuntu Server 22.04.1
Ubuntu Docker 23.0.1
Kali 2022.4
```


## Getting Started

The script currently supports two arguments: --i for installing all the necessary components for running Decider and --batch for automating the installation of dependencies without requiring user interaction for confirmation.

As a BETA version, the installer.sh has not been tested on a multitude of environments to determine its stability during execution. Additionally, there may be certain circumstances where installer.sh fails to execute the instructions due to updates in the decider CISA repository and general services in the package manager of the user's OS.

For best results, it is recommended to install version 22.04.1 of the Ubuntu distribution, ensure that you are in the /home/user/ directory of the non-root user of the system, and sequentially run the following commands:

(1) Make sure you are in the home directory of the system user. 
```
cd /home/$USER/ 
```
(2) Once you have downloaded the script in the current directory, give execution permissions. 
```
sudo chmod +x installer.sh
```
(3) Run the script with the following arguments:
```
sudo bash installer.sh --i --batch
```
