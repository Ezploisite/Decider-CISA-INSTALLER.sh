#!/bin/bash

echo ""
echo  "x================================================================================================x"  
echo  "                                  Decider CISA GOV AUTO installer                                 "
echo ""
echo " [+] Developed by l.albano | 2023 "
echo " [+] Tested on Ubuntu 22.04.1 LTS and Server"
echo " [+] Version 1.0.0 "
echo " "
echo  "x================================================================================================x"
echo ""
echo " Usage:"
echo "        --i (The --i command will install all the NECESSARY dependencies to start Decider)"
echo "        --o (The --o command will configure and install all the OPTIONAL requirements for Decider)" #WILL BE RELEASED SOON
echo "        --A (The --A command will both install NECESSARY and OPTIONAL requirements for Decider)" #WILL BE RELEASED SOON
echo "        --u (The --u command will both install 
echo "        --batch (The --batch command will automatically set the value to Y when prompted to avoid user interaction..)"
echo ""
echo  "x================================================================================================x"
echo ""
echo " Recommended installation:"
echo ""
echo "          sudo bash installer.sh --i --batch"
echo ""
echo  "x================================================================================================x"
echo ""

BATCH_MODE=false
INSTALL_MODE=false

while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        --batch)
            BATCH_MODE=true
            shift
            ;;
        --i)
            INSTALL_MODE=true
            shift
            ;;
        *)
            echo "Usage: ./script.sh [-i] [--batch]"
            exit 1
            ;;
    esac
done

if [ "$BATCH_MODE" = true ]; then
    export DEBIAN_FRONTEND=noninteractive
    AUTO_CONFIRM="-y"
else
    AUTO_CONFIRM=""
fi

if [ "$INSTALL_MODE" = true ]; then

sleep 1

echo ""
echo  "x================================================================================================x"  
echo  "x                                   Upgrading Operation System                                   x"
echo  "x================================================================================================x"
echo ""

sleep 2

    sudo apt update $AUTO_CONFIRM && sudo apt upgrade $AUTO_CONFIRM
    sudo apt install $AUTO_CONFIRM git python3-pip python3-testresources libssl-dev
    sudo adduser --no-create-home --system --shell /bin/false decider && sudo usermod -L decider
    sudo groupadd decider && sudo usermod -aG decider decider

sleep 1

echo ""
echo  "x================================================================================================x"  
echo  "x                                       Installing PostGres                                      x"
echo  "x================================================================================================x"
echo ""

    sleep 2

    sudo apt install postgresql postgresql-contrib
    sudo systemctl start postgresql && sudo systemctl enable postgresql
    cd /home/ezq/Documents/
    sudo git clone https://github.com/cisagov/decider.git
    sudo mv /home/ezq/Documents/decider /etc/decider/
    cd /etc/decider/

    sleep 1

echo ""
echo  "x================================================================================================x"  
echo  "                               Setting permission for user Decider                               x"
echo  "x================================================================================================x"
echo ""

    sleep 2

sudo chown -R decider:decider /etc/decider
if [ $? -eq 0 ]
then
    echo "[OK]"
else
    echo "[ERROR] exiting.."
    exit 1
fi

sudo find /etc/decider -type d -exec chmod 755 {} +
if [ $? -eq 0 ]
then
    echo "OK"
else
    echo "ERROR exiting.."
    exit 1
fi

sudo find /etc/decider -type f -exec chmod 644 {} +
if [ $? -eq 0 ]
then
    echo "OK"
else
    echo "ERROR exiting.."
    exit 1
fi

    sleep 1

echo ""
echo  "x================================================================================================x"  
echo  "                                  Creating a virtual enviroment                                  x"
echo  "x================================================================================================x"
echo ""

    sleep 2

if sudo apt install python3.10-venv; then
  if sudo python3 -m venv venv/; then
    if source venv/bin/activate; then
      echo "[OK]"
    else
      echo "[ERROR] exiting.."
      exit 1
    fi
  else
    echo "[ERROR] exiting.."
    exit 1
  fi
else
  echo "[ERROR] exiting.."
  exit 1
fi

    sleep 1

echo ""
echo  "x================================================================================================x"  
echo  "x                                    Installing requirements                                     x"
echo  "x================================================================================================x"
echo ""

    sleep 2

    sudo pip3 install wheel==0.37.1
    sudo pip3 install -r requirements.txt

echo ""
echo  "x================================================================================================x"  
echo  "x                               Changing DB values in conf.py file                               x"
echo  "x================================================================================================x"
echo ""

    echo "# Database connection

from app.env_vars import DB_USER_NAME, DB_USER_PASS

import sqlalchemy as sqlalch


class Config:
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    DECIDER_LOG = \"./decider.log\"
    LOG_LEVEL = \"INFO\"
    START_QUESTION = \"What is the adversary trying to do?\"
    BASE_TECHNIQUE_ANSWER = (
        \"There was **not enough context** to identify a sub-technique, but the **base technique still applies**.\"
    )
    WTF_CSRF_TIME_LIMIT = None


class DefaultConfig(Config):
    SQLALCHEMY_DATABASE_URI = sqlalch.engine.URL.create(
        drivername=\"postgresql\",
        username=DB_USER_NAME,
        password=DB_USER_PASS,
        host=\"localhost\",
        port=5432,
        database=\"decider\",
    )


class ProductionConfig(Config):
    SQLALCHEMY_DATABASE_URI = sqlalch.engine.URL.create(
        drivername=\"postgresql\",
        username=DB_USER_NAME,
        password=DB_USER_PASS,
        host=\"localhost\",
        port=5432,
        database=\"decider\",
    )


class StagingConfig(Config):
    SQLALCHEMY_DATABASE_URI = sqlalch.engine.URL.create(
        drivername=\"postgresql\",
        username=DB_USER_NAME,
        password=DB_USER_PASS,
        host=\"localhost\",
        port=5432,
        database=\"decider\",
    )


class DevelopmentConfig(Config):
    SQLALCHEMY_DATABASE_URI = sqlalch.engine.URL.create(
        drivername=\"postgresql\",
        username=DB_USER_NAME,
        password=DB_USER_PASS,
        host=\"localhost\",
        port=5432,
        database=\"decider\",
    )
    LOG_LEVEL = \"DEBUG\"
    TESTING = True
    DEBUG = True
    WTF_CSRF_CHECK_DEFAULT = False


class PytestConfig(Config):
    SQLALCHEMY_DATABASE_URI = sqlalch.engine.URL.create(
        drivername=\"postgresql\",
        username=DB_USER_NAME,
        password=DB_USER_PASS,
        host=\"localhost\",
        port=5432,
        database=\"decider\",
    )
    WTF_CSRF_CHECK_DEFAULT = False


conf_configs = [
    DefaultConfig,
    ProductionConfig,
    StagingConfig,
    DevelopmentConfig,
    PytestConfig,
]" | sudo tee /etc/decider/app/conf.py >/dev/null

    sleep 2

echo ""
echo  "x================================================================================================x"  
echo  "x                               Configuring DB PostGres and files                                x"
echo  "x================================================================================================x"
echo ""

while true; do
  echo -ne "\rUSER INTERACT REQUIRED"  
  read -t 0.5 -N 1 && break  
  echo -ne "\r                    "  
  tput sgr0  
  sleep 0.5  
done

    sleep 2

    sudo -u decider python3 initial_setup.py
    sudo -u postgres psql -a -f /etc/decider/init.sql
    sudo -u decider python3 -m app.utils.db.actions.full_build --config ProductionConfig
    sudo -u decider /etc/decider/init.sql
    sudo -u decider rm app/utils/jsons/source/role.json

    sleep 2

echo ""
echo  "x================================================================================================x"  
echo  "x                                    Everythings looks fine                                      x"
echo  "x================================================================================================x"
echo ""

sudo -u decider python3 decider.py --config ProductionConfig

fi
