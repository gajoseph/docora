echo -e " \n\nAdding users and group \n\n"
groupadd --gid 54321 oinstall;
groupadd --gid 54322 dba;
groupadd --gid 54323 asmdba;
groupadd --gid 54324 asmoper;
groupadd --gid 54325 asmadmin;
groupadd --gid 54326 oper;
# useradd --uid 55321 --gid oinstall --groups dba,oper,asmdba,asmoper oracle;
# passwd oracle;
#useradd --uid 55322 --gid oinstall --groups dba,asmadmin,asmdba,asmoper grid;
#passwd grid;
useradd --uid 55321  --gid oinstall --groups dba,oper,asmdba,asmoper oracle;
useradd --uid 55322  --gid oinstall --groups dba,asmadmin,asmdba,asmoper grid;

id  oracle 
id grid

useradd --uid 55323 --gid oinstall --groups dba,asmadmin,asmdba,asmoper admin;

mkdir /oradata 
dd if=/dev/zero of=/oradata/asm_disk1  bs=1024 count=100000 
dd if=/dev/zero of=/oradata/asm_disk2  bs=1024 count=100000 
dd if=/dev/zero of=/oradata/asm_disk3  bs=1024 count=100000 
dd if=/dev/zero of=/oradata/asm_disk4  bs=1024 count=100000 
dd if=/dev/zero of=/oradata/asm_disk5  bs=1024 count=100000 
dd if=/dev/zero of=/oradata/asm_disk6  bs=1024 count=100000 


#passwd popmeup;
#### Set the password 
PWD=George
 echo "oracle:$PWD" | chpasswd --md5 oracle
 echo "grid:$PWD" | chpasswd --md5 grid
 echo "admin:$PWD" | chpasswd --md5 admin

