#!/usr/bin/evn bash
#Author : Raj

# variables

LOG=/tmp/project.log
mv $LOG $LOG-$RANDOM

# Functions
Head() {
  echo -e "\n\e[1;32m###########  \e[4m$1\e[0m  \e[1;32m###########\e[0m" #underline
}

Print() {
  echo -e "\n######### $2 #########\n" >>$LOG
  echo -e "\e[1m ==> \e[31m$1\e[0m: \e[32m$2\e[0m"
}

Stat() {
  case $1 in
  0)
    echo -e " ==>\e[31m $program_name \e[0m: \e[32m $2 is Sucess \e[0m"
    ;;
  *)
    echo -e " ==> \e[31m $program_name \e[0m: \e[31m $2 is Failed \e[0m"
    echo -e "\n Check the log file for errors :: LOG-FILE = $LOG"
    ;;
  esac
}

MongoDB_F() {
  Head "MongoDB Setup"
  program_name=MongoDB
  Print $program_name "Installing $program_name"
  curl -s https://raw.githubusercontent.com/linuxautomations/labautomation/master/tools/mongodb/install.sh | bash &>>$LOG
  Stat $? "Installation of $program_name"
  Print $program_name "starting $program_name"
  systemctl enable mongod &>>$LOG
  systemctl start mongod &>>$LOG
  Stat $? "Starting $program_name Services"
  echo show dbs | mongo | grep catalogue &>>$LOG
  if [ $? -ne 0 ]; then
    Print $program_name "Loading Schema"
    cd /tmp/robo-shop/mongo
    mongo localhost catalogue.js &>>$LOG
    mongo localhost users.js &>>$LOG
    Stat $? "Loading Schema to $program_name"
  fi
}

RabbitMQ_F() {
  Head "RabbitMQ setup"
  program_name=RabbitMQ
  Print $program_name "Installing $program_name"
  curl -s https://raw.githubusercontent.com/linuxautomations/labautomation/master/tools/rabbitmq/install.sh | bash &>>$LOG
  Stat $? "Installation of $program_name"
  Print $program_name "starting $program_name"
  systemctl enable rabbitmq-server &>>$LOG
  systemctl start rabbitmq-server &>>$LOG
  Stat $? "Starting $program_name Services"
}

MySQL_F() {
  Head "MySQL setup"
  program_name=MySQL
  Print $program_name "Installing $program_name"
  curl -s https://raw.githubusercontent.com/linuxautomations/labautomation/master/tools/mysql/install-5.7.sh | bash &>>$LOG
  Stat $? "Installation of $program_name"
  Print $program_name "starting $program_name"
  systemctl enable mysqld &>>$LOG
  systemctl start mysqld &>>$LOG
  Stat $? "Starting $program_name Services"
  Print $program_name "Loading Schema"

}

Redis_F() {
  Head "Redis setup"
  program_name=Redis
  Print $program_name "Installing $program_name"
  curl -s https://raw.githubusercontent.com/linuxautomations/labautomation/master/tools/redis/install.sh | bash &>>$LOG
  Stat $? "Installation of $program_name"
  Print $program_name "starting $program_name"
  systemctl enable redis &>>$LOG
  systemctl start redis &>>$LOG
  Stat $? "Starting $program_name Services"
}



NodeJS_F() {
    Head "NodeJS Setup"
    program_name=NodeJS
    Print $program_name "Installing $program_name"
    if [ -d /opt/node ]; then
        Stat 0 "Installation of $program_name"
    else
        curl -s https://raw.githubusercontent.com/linuxautomations/labautomation/master/tools/nodejs/install.sh | bash &>>$LOG
        Stat $? "Installation of $program_name"
    fi
}


Reset_App_F() {
    systemctl stop $program_name &>>/dev/null
    Print $program_name "Setup $program_name Application"
    cd $APP_ROOT_DIR
    rm -rf $program_name
    cp -r /tmp/robo-shop/$program_name .
    Stat $? "Copied $program_name application"
}
Reset_App_F() {
    systemctl stop $program_name &>>/dev/null
    Print $program_name "Setup $program_name Application"
    cd $APP_ROOT_DIR
    rm -rf $program_name
    cp -r /tmp/robo-shop/$program_name .
    Stat $? "Copied $program_name application"
}

NodeJS_APP_Install_Dep_F() {
    Print $program_name "Install Dependencies for $program_name Application"
    cd ${APP_ROOT_DIR}/$program_name
    npm install &>>$LOG
    Stat $? "Installing of Dependencies for $program_name application"
}

Setup_Systemd_F() {
    Print $program_name "Setup systemd service for $program_name Application"
    sed -e "s|ROOT-DIR|${APP_ROOT_DIR}|" ${TMP_ROOT}/$program_name/systemd.service >/etc/systemd/system/$program_name.service
    Stat $? "Setup Systemd Service for $program_name application"
    systemctl daemon-reload
}

Start_Service_Systemd_F() {
    Print $program_name "Starting $program_name"
    systemctl enable $program_name &>>$LOG
    systemctl start $program_name &>>$LOG
    Stat $? "Starting $program_name Service"
}
NodeJS_APP_Setup_F() {
    Reset_App_F
    NodeJS_APP_Install_Dep_F
    Setup_Systemd_F
    Start_Service_Systemd_F
}

Catalogue_App_F() {
    Head "Catalogue APP Setup"
    program_name=catalogue
    NodeJS_APP_Setup_F
}

User_App_F() {
    Head "User APP Setup"
    program_name=user
    NodeJS_APP_Setup_F
}

Cart_App_F() {
    Head "Cart APP Setup"
    program_name=cart
    NodeJS_APP_Setup_F
}

Install_Java_F() {
    which java &>/dev/null
    if [ $? -ne 0 ]; then
         Print $program_name "Install Java"
         yum install java -y &>>$LOG
         Stat $? "Installing Java"
    fi
}

Shipping_App_F() {
    Head "Shipping App Setup"
    program_name=shipping
    systemctl stop $program_name &>>/dev/null
    Print $program_name "Setup $program_name Application"
    cd $APP_ROOT_DIR
    rm -rf $program_name
    mkdir -p $APP_ROOT_DIR/$program_name
    curl -o $APP_ROOT_DIR/$program_name/shipping.jar https://robo-shop.s3.amazonaws.com/APPLICATION/shipping/shipping.jar &>>$LOG
    Stat $? "Setup $program_name Application"
    Install_Java_F
    Setup_Systemd_F
    Start_Service_Systemd_F
}

Web_App_F() {
    Head "Web Service Setup"
    program_name=nginx
    systemctl stop $program_name &>>/dev/null
    Print $program_name "Install $program_name"
    yum install nginx -y &>>$LOG
    Stat $? "Installing $program_name"
    rm -rf /usr/share/nginx/html/*
    cp -r $TMP_ROOT/web/static/*  /usr/share/nginx/html/.
    Print $program_name "Start Service $program_name"
    systemctl enable $program_name &>>$LOG
    systemctl start $program_name &>>$LOG
    Stat $? "Starting $program_name Service"
}



#Main Program
TMP_ROOT=/tmp/robo-shop
if [ ! -d $TMP_ROOT ]; then
      cd /tmp
      git clone https://rkb03:password@gitlab.com/d45/robo-shop.git &>>$LOG
  else
      cd $TMP_ROOT
     git pull &>>$LOG
fi

APP_ROOT_DIR=/root/ROBO-SHOP
mkdir -p $APP_ROOT_DIR
mkdir -p /var/log/robo-shop

cp /tmp/robo-shop/rsyslog.conf /etc/rsyslog.d/01-robo-shop.conf
systemctl restart rsyslog

case $1 in
mongodb) MongoDB_F ;;
rabbitmq) RabbitMQ_F ;;
mysql) MySQL_F ;;
redis) Redis_F ;;
nodejs) NodeJS_F ;;
catalogue) Catalogue_App_F ;;
user) User_App_F ;;
cart) Cart_App_F ;;
shipping) Shipping_App_F ;;
web) Web_App_F ;;
all)
  MongoDB_F
  RabbitMQ_F
  MySQL_F
  Redis_F
  NodeJS_F
  Catalogue_App_F
  User_App_F
  Cart_App_F
  Shipping_App_F
  Web_App_F
  ;;
esac

#pending mysql schema
