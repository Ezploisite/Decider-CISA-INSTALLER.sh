![CISA](https://i.postimg.cc/jjfL0wQr/Immagine-2023-03-03-135805.jpg)
# Install documentation for Decider's AUTO installer.sh


Through the release of Decider software by the American governmental organization CISA GOV, an automatic approach is offered to categorize and map threats using the metrics of MITRE ATT&CK®. This makes the process of threat classification and comprehension extremely fast and versatile. Additionally, a dedicated and highly user-friendly GUI provides an extremely resilient and scalable contextualization capability for the end-user.

To simplify and automate the Decider installation process, a first BETA script has been created, which includes a BASH installer (currently semi-automatic). This allows the user to be guided step-by-step, from the boot phase to the final Decider installation, in a simple and automatic way.

The installer has been tested on few operating systems, including:

```
Ubuntu LTS 22.04.1
Ubuntu Server 22.04.1
Docker 23.0.1 - Image Ubuntu
Kali 2022.4
```


## Getting Started

The script currently supports two arguments: --i for installing all the necessary components for running Decider and --batch for automating the installation of dependencies without requiring user interaction for confirmation.

As a BETA version, the installer.sh has not been tested on a multitude of environments to determine its stability during execution. Additionally, there may be certain circumstances where installer.sh fails to execute the instructions due to updates in the decider CISA repository and general services in the package manager of the user's OS.

For best results, it is recommended to install version 22.04.1 of the Ubuntu distribution, ensure that you are in the /home/user/ directory of the non-root user of the system, and sequentially run the following commands:

1. Make sure you are in the home directory of the system user. 
```
cd /home/$USER/ 
```
2. Once you have downloaded the script in the current directory, give execution permissions. 
```
sudo chmod +x installer.sh
```
3. Run the script with the following arguments:
```
sudo bash installer.sh --i --batch
```

## Authors

* **Lorenzo Albano Fontanot** - *Initial work* - [Ezploisite](https://github.com/Ezploisite)

## Disclaimer

The author of the project and the repository are completely independent, not affiliated, associated, or endorsed in any way by the government entity CISA Gov. All information provided is for support purposes only and does not intend to in any way damage the reputation of the owning organization, therefore, all rights remain reserved to CISA Gov.

In the event that any resources belonging to the government agency CISA Gov are found to be infringing on any laws, regulations or policies, the authors of this project and repository hereby declare themselves to be extremely collaborative and willing to cooperate with CISA Gov in order to resolve the matter in a timely and satisfactory manner. We are not affiliated with CISA Gov, but we are committed to maintaining good faith and to act in compliance with all applicable laws and regulations. We reserve the right to remove any infringing content, upon notice and request from CISA Gov, while reserving our rights to defend our position to the extent permitted by applicable laws.

If you believe that any information published on this website is defamatory, constitutes a violation of copyright or other intellectual property rights, or violates any other legal rights, please contact the project author at the following references:

```
E-mail: lorenzoalbanofontanot@proton.me
E-mail: lorenzoalbanofontanot@gmail.com
```

Alternatively, you can request the Ttakedown of the repository by contacting Ezploisite on this Github profile.

## Terms of use

* You are free to edit this script as you wish.
* Don't forget to let me know if the script was useful to you.

## Acknowledgments

* Thanks if you'll choose to use this script.

