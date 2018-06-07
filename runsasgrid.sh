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

$ORA_MOUNT/grid/runInstaller -silent -noconfig  \
-showProgress -ignoresysprereqs \
ORACLE_HOSTNAME=server.domain.com  \
INVENTORY_LOCATION=/u01/app/oraInventory \
SELECTED_LANGUAGES=en \
oracle.install.option=HA_CONFIG \
ORACLE_BASE=$ORA_LOC \
ORACLE_HOME=$ORA_PRO/12.1.0/grid \
oracle.install.asm.OSDBA=asmdba \
oracle.install.asm.OSOPER=asmoper \
oracle.install.asm.OSASM=asmadmin \
oracle.install.asm.SYSASMPassword=oracle_4U \
oracle.install.asm.diskGroup.name=DATA \
oracle.install.asm.diskGroup.redundancy=EXTERNAL \
oracle.install.asm.diskGroup.AUSize=4 \
oracle.install.asm.diskGroup.disks=/dev/oracleasm/disks/ORA \
oracle.install.asm.diskGroup.diskDiscoveryString=/dev/oracleasm/disks/* \
oracle.install.asm.monitorPassword=oracle_4U



############################################################################## 
### create vi cfgrsp.properties
##############################################################################
oracle.assistants.asm|S_ASMPASSWORD=oracle_4U
oracle.assistants.asm|S_ASMMONITORPASSWORD=oracle_4U

$ORACLE_HOME/grid/crs/install/roothas.pl  -deconfig -force
