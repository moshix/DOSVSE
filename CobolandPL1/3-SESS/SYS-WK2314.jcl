USERID DOSVS
* $$ JOB JNM=WK2314,CLASS=0,DISP=D
* $$ LST CLASS=A,DISP=D,JSEP=0
// JOB WK2314 - BG LU AND LBL FOR 2314 WORK FILES
   ASSGN  SYS001,X'130'
   ASSGN  SYS002,X'130'
   ASSGN  SYS003,X'130'
   ASSGN  SYS004,X'130'
* BG USER LOGICAL UNITS SET
// OPTION PARSTD
// DLBL   IJSYS01,'DOS/VS.WORK-FILE.1',0,SD
// EXTENT SYS001,WORK02,1,0,2420,400
// DLBL   IJSYS02,'DOS/VS.WORK-FILE.2',0,SD
// EXTENT SYS002,WORK02,1,0,2820,400
// DLBL   IJSYS03,'DOS/VS.WORK-FILE.3',0,SD
// EXTENT SYS003,WORK02,1,0,3220,400
// DLBL   IJSYS04,'DOS/VS.WORK-FILE.4',0,SD
// EXTENT SYS004,WORK02,1,0,3620,300
/*
* BG LABELS FOR WORK FILES SET
/&
* $$ EOJ
