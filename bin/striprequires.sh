#!/bin/bash
#
# See http://framework.zend.com/manual/en/performance.classloading.html#performance.classloading.striprequires.sed
# Does not work in OSX, run on GNU/Linux!

CURRENT_DIR=`pwd`
LIB_DIR=`dirname $0`/../library

cd $LIB_DIR

find . -name '*.php' -not -wholename '*/Loader/Autoloader.php' \
  -not -wholename '*/Application.php' -print0 | \
  xargs -0 sed --regexp-extended --in-place 's/(require_once)/\/\/ \1/g'

cd $CURRENT_DIR