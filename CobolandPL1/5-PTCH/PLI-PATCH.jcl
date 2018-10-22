USERID DOSVS
* $$ JOB JNM=PLIZAP,CLASS=0,DISP=D
* $$ LST CLASS=A,DISP=D,JSEP=0
// JOB PL/I PATCHES README
/* These patches apply to the PL/I compiler we received on the
/*    5731aa1.fc.9081.rel1m00.c10362.aws tape in the files section.
/* The first job will change what happens when there is an 'T' level
/*    diagnostic.  Currently PL/I will reset the LINK or CATAL switch
/*    in COMRG, end, and go on to the next job control card.  Usually
/*    this is an EXEC LNKEDT.  With no option LINK or CATAL in effect
/*    you get STATEMENT OUT OF SEQUENCE on the console and it waits
/*    for operator response.  The change will cancel the job if an 'T'
/*    level error is found.  No operator intervention is then required.
/* The remaining jobs remove 2314 support for compiler work files and
/*    replace it with a 33xx disk drive.  All the jobs are mutually
/*    exclusive.  Pick the one for the device type you are using for
/*    compiler work files and ignore the others.  For 3350 and
/*    3330-11 drives the changes are more extensive because of
/*    required changes to R34 I/O modules for those devices.  For these
/*    drives code had to be added so I had to replace something; 
/*    therefore multi-extent work files are no longer supported.
/*    As long as you only use one EXTENT it's okay.  If a second EXTENT
/*    is needed the job will CANCEL with no message when it tries to
/*    OPEN it.  These changes only affect the work files; source code
/*    DECLARE FILE statements still only support 2311 and 2314 drives.
/&
// JOB PDZAP PL/I CANCEL ON T ERROR
/* With 'T' level diagnostics the LINK bit is reset resulting in
/*   'STATEMENT OUT OF SEQUENCE' if LNKEDT is attempted.
/* Instead of tying up the console and requiring operator intervention
/*   let's just cancel the job.
// UPSI 1
// EXEC PDZAP
NAME=SYS.PRG.
SCIL=PL/IG31
+6C0
VER=4110F3920A0C
REP=9206F0D10700
END
/*
/&
// JOB PDZAP REPLACE 2314 PL/I WORK FILES WITH 3350
/* PL/I
/*  +115A-test for 3350 instead of 2314
/* PL/IA20
/*  +1D-Change IJSYS01 to DEVICE=3350
/*  +B5-Change IJSYS02 to DEVICE=3350
/*  +14D-Change IJSYS03 to DEVICE=3350
/*  +26E-calc. for 3350 record length
/*  +2AC-replace 'new extent' code with moved instructions
/*  +2F4-R34 constant just before READ entry
/*  +382-track capacity for 3350
// UPSI 1
// EXEC PDZAP
NAME=SYS.PRG.
SCIL=PL/I
+115A
VER=9562
REP=9567
END
/*
// EXEC PDZAP
NAME=SYS.PRG.
SCIL=PL/IA20
+1D
VER=01
REP=07
+B5
VER=01
REP=07
+14D
VER=01
REP=07
+26E
VER=4C40F1B88840000941440065
REP=4700000047000000414400B9
+2AC
VER=5010F1A84100F1A84110F1AC0A02
REP=0A06504010909201109447F0F14C
+2F4
VER=504010909201109447F0F14C
REP=47F0F0E6FFFFD9E5FFFF3400
+382
VER=1C7E
REP=4A7D
END
/*
/&
* $$ EOJ
