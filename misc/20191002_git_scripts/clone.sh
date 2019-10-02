#!/bin/sh
###
###
###
###   Purpose:   Shell scripts to distribute material
###   started:   2018/03/04 (pvr)
###
### ##################################################### ###

#Set Script Name variable
SCRIPT=`basename ${BASH_SOURCE[0]}`
echo " *** Start cloning with $SCRIPT ..."

### # define a few constants
BRANCH=r4tea
PROJDIR=LBGFS2019
GITHUBURL=https://github.com/charlotte-ngs/${PROJDIR}.git
ADMIN=`whoami`
CURWD=/home/${ADMIN}
echo " *** * Project dir: $PROJDIR"
echo " *** * Current working dir: $CURWD"
echo " *** * Branch: $BRANCH"
echo " *** * GITHUB: $GITHUBURL"

### # functions
usage () {
  local l_MSG=$1
  echo "Usage Error: $l_MSG"
  echo "Usage: $SCRIPT -s <string>"
  echo "  where <string> specifies username of the student"
  exit 1
}

clone () {
  local l_STUDENT=$1
  local l_HOME=$2
  echo " *** Clone material for student: $l_STUDENT into home dir: $l_HOME"
  cd $l_HOME
  sudo git clone -b $BRANCH $GITHUBURL
  sudo chown -R ${l_STUDENT}:${l_STUDENT} .
}

### Start getopts code ###
#Parse command line flags
#If an option should be followed by an argument, it should be followed by a ":".
#Notice there is no ":" after "h". The leading ":" suppresses error messages from
#getopts. This is required to get my unrecognized option code to work.
while getopts :s: FLAG; do
  case $FLAG in
    s) # set option "t"
    STUDENT=$OPTARG
    HOMEDIR=/home/$STUDENT
    [ -d "${HOMEDIR}" ] || usage "Cannot find student home: $HOMEDIR"
	  ;;
    *) # invalid command line arguments
	  usage "Invalid command line argument $OPTARG"
	  ;;
  esac
done  

### # cloning
clone $STUDENT $HOMEDIR

cd $CURWD
echo "cloning done"
