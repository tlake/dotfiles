#!/bin/zsh

ddb() {
	REPO_NAMES=(
		"ddb-character-components"
		"ddb-character-listing-client"
		"ddb-character-rules-engine-lib"
		"ddb-character-service"
		"ddb-character-service-terraform"
		"ddb-character-tools-client"
		"ddb-simplified-character-data-service-terraform"
		"ddb-simplified-character-deriver"
		"ddb-waterdeep-web"
	)

	DDB_REPO_DIR="${HOME}/code/DnDBeyond"

	if [ -z $1 ] || [ $1 = "-h" ] || [ $1 = "--help" ] || [ $1 = "help" ] ||; then

	elif  [ $1 = "clone" ] ; then
		shift
		echo "Cloning repos..."

		for NAME in ${REPO_NAMES} ; do
			REPO="git@github.com:DnDBeyond/${NAME}.git"

			echo "Cloning ${REPO} into ${DDB_REPO_DIR}/${NAME} ..."
			git clone "${REPO}" "${DDB_REPO_DIR}/${NAME}"
		done

		echo "Clone finished."

	elif  [ $1 = "fetch" ] ; then
		shift
		echo "Fetching repos..."

		for NAME in ${REPO_NAMES} ; do
			cd ${DDB_REPO_DIR}/${NAME}

			echo "Fetching ${NAME} ..."
			git fetch --all

			cd -
		done

		echo "Fetching complete."

	elif  [ $1 = "refresh" ] ; then
		shift
		echo "Refreshing repos..."

		for NAME in ${REPO_NAMES} ; do
			cd ${DDB_REPO_DIR}/${NAME}

			BRANCH=$(git branch --show-current)

			echo "Fetching ${NAME} ..."
			git fetch --all

			echo "Pulling latest for ${NAME} at [${BRANCH}] ..."
			git pull origin ${BRANCH}

			cd -
		done

		echo "Refreshing complete."

	elif  [ $1 = "sync" ] ; then
		shift
		echo "Syncing repos..."

		for NAME in ${REPO_NAMES}; do
			cd ${DDB_REPO_DIR}/${NAME}

			echo "Syncing ${NAME} ..."
			git sync

			cd -
		done

		echo "Sync complete."

	elif  [ $1 = "fsync" ] ; then
		shift
		echo "Force-syncing repos..."

		for NAME in ${REPO_NAMES}; do
			cd ${DDB_REPO_DIR}/${NAME}

			echo "Force-syncing ${NAME} ..."
			git fsync

			cd -
		done

		echo "Force-sync complete."

	fi
}
