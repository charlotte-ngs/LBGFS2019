#!/bin/bash

SCRIPTDIR=source/misctools/github
DIRTOFETCH=ex/w07
# DIRTOFETCH=sol/w06

#' fetch individual directory
#' change to progdir
cd $SCRIPTDIR

#' fetch for test student
cat /home/quagadmin/user_admin/students-lbgfs2019/test-student-usernames-lbgfs2019 | while read s
do 
  echo " * Student: $s"
  ./fetch.sh -s $s -d $DIRTOFETCH
  sleep 2
done

#' fetch for real students
cat /home/quagadmin/user_admin/students-lbgfs2019/student-usernames-lbgfs2019 | while read s
do 
  echo " * Student: $s"
  ./fetch.sh -s $s -d $DIRTOFETCH
  sleep 2
done

# check content
cat /home/quagadmin/user_admin/students-lbgfs2019/student-usernames-lbgfs2019 | while read s
do 
  echo " * Student: $s"
  ls -l /home/$s/LBGFS2019/$DIRTOFETCH
  sleep 2
done
