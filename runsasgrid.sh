ORA_MOUNT=/u01/app
ORA_LOC=$ORA_MOUNT/oracle
ORA_INV=$ORA_MOUNT/oraInventory
ORA_PRO=$ORA_MOUNT/oracle/product
ORACLE_HOME=$ORA_PRO/12.1.0/grid

mkdir -p $ORA_LOC
chmod g+rwx $ORA_LOC
mkdir -p  $ORA_INV
chmod g+rwx $ORA_INV
mkdir -p  $ORA_PRO
chmod g+rwx $ORA_PRO


######################### INSTALLING GRID 
#############################################################################
mkdir $HOME/tmp
export TEMP=$HOME/tmp
