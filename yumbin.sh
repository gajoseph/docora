
echo -e " \n\nStarting yum to install binaries \n\n"
set mutilib_policy=all;
yum install binutils-2.* -y;  
 yum install compat-libstdc++-33* -y ;
 yum install elfutils-libelf-0.* -y ;
 yum install libaio-0.* -y ;
 yum install libaio-devel-0.* -y ;
 yum install sysstat-9.* -y ;
 yum install glibc-2.* -y ;
 yum install glibc-common-2.* -y ;
 yum install glibc-devel-2.* -y ;
 yum install glibc-headers-2.* -y ;
 yum install ksh-2* -y ;
 yum install make-3.*-y ;   
 yum install libgcc-4.* -y ;
 yum install libstdc++-4.* -y ;
 yum install libstdc++-4.* -y ;
 yum install libstdc++-devel-4.* -y ;
 yum install gcc-4.*x86_64* -y ;
 yum install gcc-c++-4.*x86_64* -y ;
 yum install elfutils-libelf-0*x86_64* -y ; 
 yum install elfutils-libelf-devel-0*x86_64* -y ;
 yum install elfutils-libelf-0  -y 
 yum install elfutils-libelf-devel-0*i686* -y ;
 yum install libtool-ltdl* -y ;
 yum install ncurses* -y ;
 yum install readline* -y ;
 yum install unixODBC* -y ;  
 yum install compat-libcap1-1.10 -y; 
 #yum install nfs-utils-1.2.3-15 -y;  
 yum install nfs-utils* -y;  
 yum install wget* -y;  
 yum install zip unzip -y;
 

echo " Done yum install of binaries "
#### list out all installed pkgs	
yum list installed



################################ IN a diff file 
DWNLOC_BASE=/tmp
DWNLOC_DB=/tmp/oracledb
DWNLOC_ASM=/tmp/oracleasm
mkdir -p $DWNLOC_DB $DWNLOC_ASM
wget http://download.oracle.com/otn/linux/oracle11g/R2/linux.x64_11gR2_database_1of2.zip --http-user=georgeantonytj@hotmail.com --http-password=Alex20@6 -P $DWNLOC_DB
wget http://download.oracle.com/otn/linux/oracle11g/R2/linux.x64_11gR2_database_2of2.zip --http-user=georgeantonytj@hotmail.com --http-password=Alex20@6 -P $DWNLOC_DB
wget http://download.oracle.com/otn/linux/oracle11g/R2/linux.x64_11gR2_grid.zip  --http-user=georgeantonytj@hotmail.com --http-password=Alex20@6 -P $DWNLOC_DB
wget --no-cookies --no-check-certificate  --header "Cookie: oraclelicense=accept-securebackup-cookie"  'http://download.oracle.com/otn_software/asmlib/oracleasmlib-2.0.4-1.el6.x86_64.rpm' -O $DWNLOC_ASM
wget --no-cookies --no-check-certificate  --header "Cookie: oraclelicense=accept-securebackup-cookie"  'http://oss.oracle.com/projects/oracleasm-support/dist/files/RPMS/rhel6/amd64/2.1.8/oracleasm-support-2.1.8-1.el6.x86_64.rpm' -O $DWNLOC_ASM

yum install -y $DWNLOC_ASM/oracleasmlib-2.0.4-1.el6.x86_64.rpm  $DWNLOC_ASM/oracleasm-support-2.1.8-1.el6.x86_64.rpm 

ORA_MOUNT=/u01/app
mkdir -p $ORA_MOUNT
chown -R grid:dba $ORA_MOUNT
	
############################################################################################################
#where are  going to isntall oracle mount
## Run as grid user
############################################################################################################

su - grid << 'EOF'
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
mkdir $HOME/tmp
DWNLOC_DB=/tmp/oracledb
DWNLOC_ASM=/tmp/oracleasm
export TEMP=$HOME/tmp
for z in $DWNLOC_DB/linuxamd64_12c__*.zip; do unzip $z -d $ORA_MOUNT; done
mkdir /u01/app/grid 
chown grid:oinstall /u01/app/grid


EOF