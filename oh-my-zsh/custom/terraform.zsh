alias tf="terraform"

alias tft="tftweak"
alias tfte="tftweak env"
alias tftv="tftweak version"

# Naming convention for Terraform binary versions:
# "terraform-vX.Y.Z"
tftweak() {
	TFTWEAK_DIR="/Users/tlake/.tftweak"
	TFTWEAK_ENVS_DIR="${TFTWEAK_DIR}/envs"
	TFTWEAK_VERS_DIR="${TFTWEAK_DIR}/versions"
	BIN_DIR="/usr/local/bin"

	if [ -z $1 ] || [ $1 = "-h" ] || [ $1 = "help" ] || [ $1 = "--help" ]; then
		echo "tftweak help"
		echo
		echo "USAGE:"
		echo "tftweak COMMAND"
		echo
		echo "COMMANDS:"
		echo "	env"
		echo "	version"
		echo "	gen"

	elif [ $1 = "gen" ]; then
		shift
		echo "Creating environments directory at [ ${TFTWEAK_ENVS_DIR} ]..."
		mkdir -p ${TFTWEAK_ENVS_DIR}
		echo "Creating verisons directory at [ ${TFTWEAK_VERS_DIR} ]..."
		mkdir -p ${TFTWEAK_VERS_DIR}
		echo "Setup complete!"

	elif [ $1 = "env" ]; then
		shift
		if [ -z $1 ] || [ $1 = "help" ] || [ $1 = "h" ]; then
			echo "tftweak env help"
			echo
			echo "USAGE:"
			echo "tftweak env COMMAND"
			echo
			echo "COMMANDS:"
			echo "	help, h"
			echo "	list, ls, l"
			echo "	[desired environment name to use]"
		elif [ $1 = "list" ] || [ $1 = "ls" ] || [ $1 = "l" ]; then
			echo "available environments:"
			for e in $( ls ${TFTWEAK_ENVS_DIR} ); do
				echo "	${e}"
			done
		else
			ENVS=($( ls ${TFTWEAK_ENVS_DIR} ))
			SUCCESS="no"
			for e in ${ENVS} ; do 
				if [ $e = $1 ] && [ $SUCCESS = "no" ]; then
					source ${TFTWEAK_ENVS_DIR}/${1}
					echo "configured environment as defined in ${TFTWEAK_ENVS_DIR}/$1"
					SUCCESS="yes"
				fi
			done
			if [ $SUCCESS = "no" ]; then
				echo "no environment configuration found at ${TFTWEAK_ENVS_DIR}/$1"
			fi
		fi

	elif [ $1 = "version" ]; then
		shift
		if [ -z $1 ] || [ $1 = "help" ] || [ $1 = "h" ]; then
			echo "tftweak version help"
			echo
			echo "USAGE:"
			echo "tftweak version COMMAND"
			echo
			echo "COMMANDS:"
			echo "	help, h"
			echo "	list, ls, l"
			echo "	[terraform version to use]"
			echo
			echo "current Terraform version: $(ls -lt $(which terraform) | grep -o "v[0-9]*\.[0-9]*\.[0-9]*")"
		elif [ $1 = "list" ] || [ $1 = "ls" ] || [ $1 = "l" ]; then
			echo "installed Terraform versions:"
			echo $( ls ${TFTWEAK_VERS_DIR} )
		else
			TF_BIN="$( ls ${TWTWEAK_VERS_DIR} | grep $1 )"
			echo "linking '${TF_BIN}' into '${BIN_DIR}/terraform'..."
			rm ${BIN_DIR}/terraform
			ln -sf ${TFTWEAK_VERS_DIR}/${TF_BIN} ${BIN_DIR}/terraform
			echo "finished!"
		fi
	fi
}
