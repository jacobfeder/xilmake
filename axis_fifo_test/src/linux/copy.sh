SOURCE_DIR=$1
LINUX_PROJECT_PATH=$2

# startup script
cp -f -v $SOURCE_DIR"/startup/startup" $LINUX_PROJECT_PATH"/recipes-apps/startup/files/startup"
cp -f -v $SOURCE_DIR"/startup/startup.bb" $LINUX_PROJECT_PATH"/recipes-apps/startup/startup.bb"

# axis-fifo driver
cp -f -v $SOURCE_DIR"/axis-fifo/axis-fifo.c" $LINUX_PROJECT_PATH"/recipes-modules/axis-fifo/files/axis-fifo.c"

# fifo test program
cp -f -v $SOURCE_DIR"/fifo-test/fifo-test.c" $LINUX_PROJECT_PATH"/recipes-apps/fifo-test/files/fifo-test.c"