USERID DOSVS
* $$ JOB JNM=WK3350,CLASS=0,DISP=D
* $$ LST CLASS=A,DISP=D,JSEP=0
// JOB WK3350 - BG LU AND LBL FOR 3350 WORK FILES
   ASSGN SYS001,X'362'
   ASSGN SYS002,X'362'
   ASSGN SYS003,X'362'
   ASSGN SYS004,SYSRDR
* BG USER LOGICAL UNITS RESET
// OPTION PARSTD
/*
* BG LABELS ERASED
/&
* $$ EOJ
