// JOB README
/* These patches apply to the FCOBOL compiler we received on the
/*    5731aa1.fc.9081.rel1m00.c10362.aws tape in the files section.
/* The first job will fix wrong code being generated because of a
/*    PROCEDURE DIVISION USING statement with OPTION XREF in effect
/*    for FCOBOL subprograms.  The workaround is to use OPTION NOXREF
/*    but this will fix the problem.
/* The second job will change what happens when there is an 'E' level
/*    diagnostic.  Currently FCOBOL will reset the LINK or CATAL switch
/*    in COMRG, end, and go on to the next job control card.  Usually
/*    this is an EXEC LNKEDT.  With no option LINK or CATAL in effect
/*    you get STATEMENT OUT OF SEQUENCE on the console and it waits
/*    for operator response.  The change will cancel the job if an 'E'
/*    level error is found.  No operator intervention is then required.
/* The remaining jobs remove 2314 support for compiler work files and
/*    replace it with a 33xx disk drive.  All the jobs are mutually
/*    exclusive.  Pick the one for the device type you are using for
/*    compiler work files and ignore the others.  The compiler
/*    originally supports only 2311 or 2314.  Because of the way it
/*    is written it is easier to replace the 2314 code.  The compiler
/*    we have from the 5731aa1... tape was actually assembled with
/*    release 27.  The SDMODW macro in the compiler assembled an I/O
/*    module that actually supports 3330-1 disk drives.  The compiler
/*    wasn't changed from release 26 but a newer I/O module was
/*    included.  So there are not many changes needed to support a
/*    3330-1.  Just a couple of changes dealing with the DTF parameters
/*    for the work files.  Since the I/O module supports 3330-1 drives
/*    that logic can be replaced to support the 3340 drives.  For 3350
/*    and 3330-11 drives the changes are more extensive because of
/*    required changes to I/O modules for those devices.  Because some
/*    code had to be added I had to replace something.  For 3350 and
/*    3330-11 drives multi-extent work files are no longer supported.
/*    As long as you only use one EXTENT it's okay.  If a second EXTENT
/*    is needed the job will CANCEL with no message when it tries to
/*    OPEN it.  These changes only affect the work files; source code
/*    SELECT statements still only support 2311 and 2314 drives.
/&
// JOB PDZAP FCOBOL51 SUBPROGRAM USING ERROR
/* wrong code generated for PROCEDURE DIVISION USING (or ENTRY USING)
/*   statements if OPTION XREF in effect.  Use NOXREF for workaround.
/* registers saved incorrectly in subroutine to add entry to cross-
/*   reference list.  Save correct registers to patch area.
// UPSI 1
// EXEC PDZAP
NAME=SYS.PRG.
SCIL=FCOBOL51
+C72
VER=90EF7C8E
REP=90E3DC80
+C90
VER=98EF7C8E
REP=98E3DC80
/*
/&
// JOB PDZAP FCOBOL CANCEL ON E ERROR
/* With 'E' level diagnostics the COMRG LINK bit is reset resulting
/*   in 'STATEMENT OUT OF SEQUENCE' if LNKEDT is attempted.
/* Instead of tying up console and requiring operator intervention
/*   let's just cancel the job.
// UPSI 1
// EXEC PDZAP
NAME=SYS.PRG.
SCIL=FCOBOL
+E68                                                                    CAN.ON E
VER=0A0C4120
REP=0A06
END
/*
/&
// JOB PDZAP FCOBOL WORK FILES ON 3330-1
/* +3420 - TEST-2314 TO 3330
/* +36BE - 2314 CODES TO 3330 CODES
/* +36CA - 2314 CAP. TO 3330 CAP.
// UPSI 1
// EXEC PDZAP
NAME=SYS.PRG.
SCIL=FCOBOL
+3420
VER=9162900447E0
REP=956390044770
+36BE
VER=13011C7E
REP=120432E6
+36CA
VER=1C7E
REP=32E6
END
/*
/&
// JOB PDZAP FCOBOL WORK FILES ON 3330-11
/* change DTFs
/*  +3420 - TEST-2314 TO 3330-11
/*  +36BE - 2314 CODES TO 3330 CODES
/*  +36CA - 2314 CAP. TO 3330 CAP.
/* change I/O mod 3330-1 TO 3330-11
/*  +14B8 - TEST-3330-1 TO 3330-11
/*  +1566 - NEW CODE, REPLACE NEW EXTENT CODE
/*  +15B4 - TEST-3330-1 TO 3330-11
/*  +15DC - R34 3350,3330-11 MOD. ID.
/*  +17FC - TEST-3330-1 TO 3330-11
/*  +1800 -   TEST (PART 2)
// UPSI 1
// EXEC PDZAP
NAME=SYS.PRG.
SCIL=FCOBOL
+3420
VER=9162900447E0
REP=956590044770
+36BE
VER=13011C7E
REP=120532E6
+36CA
VER=1C7E
REP=32E6
+14B8
VER=9104101D4710
REP=9505101D4780
+1566
VER=5010F2D8D202F2DDF2D94100F2DC
REP=0A06504010909201109447F0F1F4
+15B4
VER=9104101D4710
REP=9505101D4780
+15DC
VER=504010909201109447F0F1F4
REP=47F0F170FFFFD9E5FFFF3400
+17FC
VER=9104
REP=9505
+1800
VER=4710
REP=4780
END
/*
/&
// JOB PDZAP FCOBOL WORK FILES ON 3340 (35 OR 70)
/* change DTFs
/*  +3420 - TEST-2314 TO 3340
/*  +36BE - 2314 CODES TO 3340 CODES
/*  +36CA - 2314 CAP. TO 3340 CAP.
/* change I/O mod-3330 to 3340
/*  +14B8 - TEST-3330 TO 3340
/*  +14DA - TRACK CALC.-3330 TO 3340
/*  +15B4 - TEST-3330 TO 3340
/*  +16EA - TRACK CAP.-3330 TO 3340
/*  +17FC - TEST-3330 TO 3340
// UPSI 1
// EXEC PDZAP
NAME=SYS.PRG.
SCIL=FCOBOL
+3420
VER=9162
REP=9168
+36BE
VER=13011C7E
REP=0B0820B0
+36CA
VER=1C7E
REP=20B0
+14B8
VER=9104
REP=9108
+14DA
VER=0087
REP=00A7
+15B4
VER=9104
REP=9108
+16EA
VER=32E6
REP=20B0
+17FC
VER=9104
REP=9108
END
/*
/&
// JOB PDZAP FCOBOL WORK FILES ON 3350
/* change DTFs
/*  +3420 - TEST-2314 TO 3350
/*  +36BE - 2314 CODES TO 3350 CODES
/*  +36CA - 2314 CAP. TO 3350 CAP.
/* change I/O mod-3330 TO 3350
/*  +14B8 - TEST-3330 TO 3350
/*  +14DA - TRACK CALC.-3330 TO 3350
/*  +1566 - NEW CODE, REPLACE NEW EXTENT CODE
/*  +15B4 - TEST-3330 TO 3350
/*  +15DC - R34 3350,3330-11 MOD. ID.
/*  +16EA - TRACK CAP.-3330 TO 3350
/*  +17FC - TEST-3330 TO 3350
/*  +1800 -   TEST (PART 2)
// UPSI 1
// EXEC PDZAP
NAME=SYS.PRG.
SCIL=FCOBOL
+3420
VER=9162900447E0
REP=956790044770
+36BE
VER=13011C7E
REP=1D074A7D
+36CA
VER=1C7E
REP=4A7D
+14B8
VER=9104101D4710
REP=9507101D4780
+14DA
VER=0087
REP=00B9
+1566
VER=5010F2D8D202F2DDF2D94100F2DC
REP=0A06504010909201109447F0F1F4
+15B4
VER=9104101D4710
REP=9507101D4780
+15DC
VER=504010909201109447F0F1F4
REP=47F0F170FFFFD9E5FFFF3400
+16EA
VER=32E6
REP=4A7D
+17FC
VER=9104
REP=9507
+1800
VER=4710
REP=4780
END
/*
/&
