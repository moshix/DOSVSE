USERID DOSVS
* $$ JOB JNM=EXTLBL,CLASS=0,DISP=D
* $$ LST CLASS=A,DISP=D,JSEP=0
// JOB EXTLBL
// EXEC MAINT
   CATALP  EXTLBL,VM=34.0
*  STANDARD LABELS FOR 3350 AND 2314
// OPTION STDLABEL
// DLBL IJSYSRS,'DOSVS.SYSTES',99/365,SD
// EXTENT SYSRES,DOSR34,1,0,1,15449     77 CYLS,   0 -  76, ON SYSRES
// DLBL IJSYSCT,'VSAM.MASTER.CATALOG',99/365,VSAM
// EXTENT SYSCAT,DOSR34,1,0,15450,300   10 CYLS, 515 - 525, ON SYSRES
// DLBL IJSYSCN,'DOS/VS.HARDCOPY.FILE',99/365,SD
// EXTENT SYSREC,PWRR34,1,0,30,300      10 CYLS,   1 -  10, ON PWRR34
// DLBL IJSYSRC,'DOS/VS.RECORDER.FILE',99/365,SD
// EXTENT SYSREC,PWRR34,1,0,330,300     10 CYLS,  11 -  20, ON PWRR34
// DLBL IJAFILE,'POWER.ACCOUNT.FILE',99/365,DA
// EXTENT SYS000,PWRR34,1,0,630,600     20 CYLS,  21 -  40, ON PWRR34
// DLBL IJQFILE,'POWER.QUEUE.FILE',99/365,DA
// EXTENT SYS001,PWRR34,1,0,1230,1200   40 CYLS,  41 -  80, ON PWRR34
// DLBL IJDFILE,'POWER.DATA.FILE',99/365,DA
// EXTENT SYS002,PWRR34,1,0,2430,14190 473 CYLS,  81 - 553, ON PWRR34
// DLBL IJSYSLN,'DOS/VS.SYSLNK.FILE',0,SD
// EXTENT SYSLNK,WORK02,1,0,2220,200    10 CYLS, 111 - 120, ON WORK02
// DLBL IJSYS01,'DOS/VS.WORK-FILE.1',0,SD
// EXTENT SYS001,WORK02,1,0,2420,400    20 CYLS, 121 - 140, ON WORK02
// DLBL IJSYS02,'DOS/VS.WORK-FILE.2',0,SD
// EXTENT SYS002,WORK02,1,0,2820,400    20 CYLS, 141 - 160, ON WORK02
// DLBL IJSYS03,'DOS/VS.WORK-FILE.3',0,SD
// EXTENT SYS003,WORK02,1,0,3220,400    20 CYLS, 161 - 180, ON WORK02
// DLBL IJSYS04,'DOS/VS.WORK-FILE.4',0,SD
// EXTENT SYS004,WORK02,1,0,3620,300    15 CYLS, 181 - 195, ON WORK02
*  DOS/VS 3350/2314 STANDARD LABELS CREATED  *
/*
/+
/*
// EXEC PROC=EXTLBL
/&
* $$ EOJ
