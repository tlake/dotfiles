#!/bin/zsh

vpn() {
    OVPN_CONF_PATH="/etc/openvpn/configs"
    TODAY=$(date +%Y-%m-%d)
    LOGPATH="/var/tmp/openvpn"
    LOGFILE="openvpn_${TODAY}.log"


	if [ -z $1 ] || [ $1 = "-h" ] || [ $1 = "--help" ] || [ $1 = "help" ] ; then
        shift

        echo "USAGE: vpn COMMAND|CONFIG_NAME"
        echo
        echo "Available commands:"
        echo "  help"
        echo "  setup"
        echo "  list"
        echo
        echo "If you specify something other than one of the above commands,"
        echo "this script will interpret the input as the name of an ovpn config."

	elif [ $1 = "setup" ] ; then
        shift
        
        echo "Executing [mkdir -p ${LOGPATH}]..."
        mkdir -p ${LOGPATH}

        echo "Executing [sudo mkdir -p ${OVPN_CONF_PATH}]..."
        sudo mkdir -p ${OVPN_CONF_PATH}
        
        echo "Setup complete."

	elif [ $1 = "-l" ] || [ $1 = "--list" ] || [ $1 = "ls" ]|| [ $1 = "list" ] ; then
        shift

        echo "Listing available configurations in [${OVPN_CONF_PATH}]..."
        echo $(ls ${OVPN_CONF_PATH})

        echo "Listing complete."

    else
        OVPN_CONF=$1
        shift

        echo "Executing [sudo openvpn --config ${OVPN_CONF_PATH}/${OVPN_CONF} --daemon --log-append ${LOGPATH}/${LOGFILE}]"
        sudo openvpn --config ${OVPN_CONF_PATH}/${OVPN_CONF} --daemon --log-append ${LOGPATH}/${LOGFILE}

        echo "Complete."
	fi
}
