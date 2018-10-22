USERID DOSVS
* $$ JOB JNM=GENSUP,CLASS=0,DISP=D
* $$ LST CLASS=A,DISP=D,JSEP=0
// JOB $$A$SUP1 GEN $$A$SUP1                                            00002*16
// OPTION CATAL                                                         00017**5
// EXEC ASSEMBLY,SIZE=128K                                              00018**5
         MACRO                                                          00019**5
         GENSUPVR                                                       00020**5
         SUPVR AP=YES,                                                 *00021**5
               ASCII=YES,                                              *00022**5
               ERRLOG=YES,                                             *00023**5
               EU=NO,                                                  *00024**5
               ID=1,                                                   *00025*16
               MICR=NO,                                                *00026**5
               NPARTS=5,                                               *00027**5
               PAGEIN=5,                                               *00028**5
               PHO=YES,                                                *00029**5
               POWER=YES,                                              *00030**5
               TP=BTAM                                                  00031**5
         CONFG FP=YES,                                                 *00032**5
               MODEL=158                                                00033**5
         STDJC CHARSET=60C,                                            *00034**5
               SYM=YES,                                                *00035**5
               DUMP=PART,                                              *00036**5
               SPARM=YES,                                              *00037**5
               DATE=MDY,                                               *00038**5
               DECK=NO,                                                *00039**5
               LISTX=YES,                                              *00040**5
               RLD=YES                                                  00041**5
         FOPT  AB=YES,                                                 *00042**5
               CBF=8,                                                  *00043**5
               DOC=3277,                                               *00044**5
               ECPREAL=YES,                                            *00045**5
               ERRQ=10,                                                *00046*11
               EVA=(6,6),                                              *00047**5
               FASTTR=YES,                                             *00048**5
               GETVIS=YES,                                             *00049**5
               IDRA=YES,                                               *00050**5
               IT=YES,                                                 *00051**5
               JA=(50,50,50,50,50),                                    *00052**5
               JALIOCS=(250,0),                                        *00053**5
               OC=YES,                                                 *00054**5
               OLTEP=YES,                                              *00055**5
               PC=YES,                                                 *00056**5
               PCIL=YES,                                               *00057**5
               PD=YES,                                                 *00058**5
               PFIX=YES,                                               *00059**5
               PRTY=(BG,F3,F4,F2,F1),                                  *00060*16
               PSLD=5,                                                 *00061**5
               RPS=YES,                                                *00062**5
               SLD=30,                                                 *00063*12
               SYNCH=YES,                                              *00064**5
               SYSFIL=(YES,100,100),                                   *00065**5
               TEBV=CR,                                                *00066**5
               TOD=YES,                                                *00067**5
               TTIME=F2,                                               *00068**5
               USERID=SUPBR3411/24/03,                                 *00069*17
               VSAM=YES,                                               *00070**5
               WAITM=YES,                                              *00071**5
               XECB=YES,                                               *00072**5
               ZONE=(WEST,05,00)                                        00073**5
         PIOCS BLKMPX=YES,                                             *00074**5
               DISK=(2314,3330,3340,3350),                             *00075**5
               BMPX=YES,                                               *00076**5
               TAPE=7                                                   00077**5
         VSTAB RSIZE=4096K,                                            *00078**7
               VSIZE=7168K,                                            *00079*17
               BUFSIZE=160,                                            *00080**5
               SVA=(1024K,128K)                                         00081**5
         ALLOC F4=512K,                                                *00082**5
               F3=512K,                                                *00083**5
               F2=4608K,                                               *00084*17
               F1=256K                                                  00085**5
         ALLOCR BGR=300K,                                              *00086**5
               F4R=300K,                                               *00087**5
               F3R=300K,                                               *00088**5
               F2R=300K,                                               *00089**5
               F1R=36K                                                  00090**5
         IOTAB BGPGR=40,                                               *00091**5
               F4PGR=50,                                               *00092**5
               F3PGR=35,                                               *00093*18
               F2PGR=59,                                               *00094*18
               F1PGR=17,                                               *00095**5
               CHANQ=200,                                              *00096*18
               D2314=08,                                               *
               D3350=32,                                               *00098**5
               D3420=10,                                               *00099**5
               IODEV=150,                                              *00100*14
               JIB=200,                                                *00101*15
               NRES=100                                                 00102**5
         DVCGEN CHUN=X'00C',DVCTYP=2540R                                00103**5
         DVCGEN CHUN=X'01C',DVCTYP=2540R                                00104**5
         DVCGEN CHUN=X'02C',DVCTYP=2540R                                00105**5
         DVCGEN CHUN=X'03C',DVCTYP=2540R                                00106**5
         DVCGEN CHUN=X'00D',DVCTYP=2540P                                00107**5
         DVCGEN CHUN=X'01D',DVCTYP=2540P                                00108**5
         DVCGEN CHUN=X'02D',DVCTYP=2540P                                00109**5
         DVCGEN CHUN=X'03D',DVCTYP=2540P                                00110**5
         DVCGEN CHUN=X'00E',DVCTYP=1403U                                00111**5
         DVCGEN CHUN=X'00F',DVCTYP=1403U                                00112**5
         DVCGEN CHUN=X'01E',DVCTYP=1403U                                00113**5
         DVCGEN CHUN=X'02E',DVCTYP=1403U                                00114**5
         DVCGEN CHUN=X'03E',DVCTYP=1403U                                00115**5
         DVCGEN CHUN=X'04E',DVCTYP=1403U                                00116**5
         DVCGEN CHUN=X'05E',DVCTYP=1403U                                00117**5
         DVCGEN CHUN=X'06E',DVCTYP=1403U                                00118**5
         DVCGEN CHUN=X'07E',DVCTYP=1403U                                00119**5
         DVCGEN CHUN=X'01F',DVCTYP=125D                                 00120**5
         DVCGEN CHUN=X'030',DVCTYP=2701                                 00121**5
         DVCGEN CHUN=X'031',DVCTYP=2701                                 00122**5
         DVCGEN CHUN=X'032',DVCTYP=2701                                 00123**5
         DVCGEN CHUN=X'033',DVCTYP=2701                                 00124**5
         DVCGEN CHUN=X'070',DVCTYP=2703
         DVCGEN CHUN=X'071',DVCTYP=2703
         DVCGEN CHUN=X'072',DVCTYP=2703
         DVCGEN CHUN=X'073',DVCTYP=2703
         DVCGEN CHUN=X'080',DVCTYP=3277                                 00125**5
         DVCGEN CHUN=X'081',DVCTYP=3277                                 00126**5
         DVCGEN CHUN=X'082',DVCTYP=3277                                 00127**5
         DVCGEN CHUN=X'083',DVCTYP=3277                                 00128**5
         DVCGEN CHUN=X'084',DVCTYP=3277                                 00129**5
         DVCGEN CHUN=X'085',DVCTYP=3277                                 00130**5
         DVCGEN CHUN=X'086',DVCTYP=3277                                 00131**5
         DVCGEN CHUN=X'087',DVCTYP=3277                                 00132**5
         DVCGEN CHUN=X'088',DVCTYP=3277                                 00133**5
         DVCGEN CHUN=X'089',DVCTYP=3277                                 00134**5
         DVCGEN CHUN=X'08A',DVCTYP=3277                                 00135**8
         DVCGEN CHUN=X'08B',DVCTYP=3277                                 00136**8
         DVCGEN CHUN=X'08C',DVCTYP=3277                                 00137**8
         DVCGEN CHUN=X'08D',DVCTYP=3277                                 00138**8
         DVCGEN CHUN=X'08E',DVCTYP=3277,MODE=X'01'   3286 PRINTER       00139**5
         DVCGEN CHUN=X'08F',DVCTYP=3277                                 00140*18
         DVCGEN CHUN=X'090',DVCTYP=3277                                 00141*13
         DVCGEN CHUN=X'091',DVCTYP=3277                                 00142*13
         DVCGEN CHUN=X'092',DVCTYP=3277                                 00143*13
         DVCGEN CHUN=X'093',DVCTYP=3277                                 00144*13
         DVCGEN CHUN=X'094',DVCTYP=3277                                 00145*13
         DVCGEN CHUN=X'095',DVCTYP=3277                                 00146*13
         DVCGEN CHUN=X'096',DVCTYP=3277                                 00147*13
         DVCGEN CHUN=X'097',DVCTYP=3277                                 00148*13
         DVCGEN CHUN=X'098',DVCTYP=3277                                 00149*13
         DVCGEN CHUN=X'099',DVCTYP=3277                                 00150*13
         DVCGEN CHUN=X'09A',DVCTYP=3277                                 00151*13
         DVCGEN CHUN=X'09B',DVCTYP=3277                                 00152*13
         DVCGEN CHUN=X'09C',DVCTYP=3277                                 00153*13
         DVCGEN CHUN=X'09D',DVCTYP=3277                                 00154*13
         DVCGEN CHUN=X'09E',DVCTYP=3277,MODE=X'01'                      00155*13
         DVCGEN CHUN=X'09F',DVCTYP=3277,MODE=X'01'                      00156*13
         DVCGEN CHUN=X'130',DVCTYP=2314
         DVCGEN CHUN=X'131',DVCTYP=2314
         DVCGEN CHUN=X'132',DVCTYP=2314
         DVCGEN CHUN=X'133',DVCTYP=2314
         DVCGEN CHUN=X'134',DVCTYP=2314
         DVCGEN CHUN=X'135',DVCTYP=2314
         DVCGEN CHUN=X'136',DVCTYP=2314
         DVCGEN CHUN=X'160',DVCTYP=3330                                 00157**5
         DVCGEN CHUN=X'161',DVCTYP=3330                                 00158**5
         DVCGEN CHUN=X'162',DVCTYP=3330                                 00159**5
         DVCGEN CHUN=X'163',DVCTYP=3330                                 00160**5
         DVCGEN CHUN=X'164',DVCTYP=3330                                 00161**5
         DVCGEN CHUN=X'165',DVCTYP=3330                                 00162**5
         DVCGEN CHUN=X'166',DVCTYP=3330                                 00163**5
         DVCGEN CHUN=X'167',DVCTYP=3330                                 00164**5
         DVCGEN CHUN=X'280',DVCTYP=3420T9,MODE=X'C0'                    00165**5
         DVCGEN CHUN=X'281',DVCTYP=3420T9,MODE=X'C0'                    00166**5
         DVCGEN CHUN=X'282',DVCTYP=3420T9,MODE=X'C0'                    00167**5
         DVCGEN CHUN=X'283',DVCTYP=3420T9,MODE=X'C0'                    00168**5
         DVCGEN CHUN=X'284',DVCTYP=3420T9,MODE=X'C0'                    00169**5
         DVCGEN CHUN=X'285',DVCTYP=3420T9,MODE=X'C0'                    00170**5
         DVCGEN CHUN=X'286',DVCTYP=3420T9,MODE=X'C0'                    00171**5
         DVCGEN CHUN=X'287',DVCTYP=3420T9,MODE=X'C0'                    00172**5
         DVCGEN CHUN=X'350',DVCTYP=3330                                 00173**5
         DVCGEN CHUN=X'351',DVCTYP=3330                                 00174**5
         DVCGEN CHUN=X'352',DVCTYP=3330                                 00175**5
         DVCGEN CHUN=X'353',DVCTYP=3330                                 00176**5
         DVCGEN CHUN=X'354',DVCTYP=3330                                 00177**5
         DVCGEN CHUN=X'355',DVCTYP=3330                                 00178**5
         DVCGEN CHUN=X'356',DVCTYP=3330                                 00179**5
         DVCGEN CHUN=X'357',DVCTYP=3330                                 00180**5
         DVCGEN CHUN=X'360',DVCTYP=3350
         DVCGEN CHUN=X'361',DVCTYP=3350
         DVCGEN CHUN=X'362',DVCTYP=3350
         DVCGEN CHUN=X'363',DVCTYP=3350
         DVCGEN CHUN=X'364',DVCTYP=3350
         DVCGEN CHUN=X'365',DVCTYP=3350
         DVCGEN CHUN=X'366',DVCTYP=3350
         DVCGEN CHUN=X'367',DVCTYP=3350
         DVCGEN CHUN=X'51F',DVCTYP=3277                                 00197*10
         ASSGN SYSLOG,X'01F',BG                                         00198**5
         ASSGN SYSLOG,X'01F',F4                                         00199**5
         ASSGN SYSLOG,X'01F',F3                                         00200**5
         ASSGN SYSLOG,X'01F',F2                                         00201**5
         ASSGN SYSLOG,X'01F',F1                                         00202**5
         ASSGN SYSREC,X'361',BG                                         00203*12
         ASSGN SYSREC,X'361',F4                                         00204*12
         ASSGN SYSREC,X'361',F3                                         00205*12
         ASSGN SYSREC,X'361',F2                                         00206*12
         ASSGN SYSREC,X'361',F1                                         00207*12
         ASSGN SYSRDR,X'00C',BG                                         00208**5
         ASSGN SYSRDR,X'00C',F4                                         00209**5
         ASSGN SYSRDR,X'00C',F3                                         00210**5
         ASSGN SYSRDR,X'00C',F2                                         00211**5
         ASSGN SYSPCH,X'00D',BG                                         00212**5
         ASSGN SYSPCH,X'00D',F4                                         00213**5
         ASSGN SYSPCH,X'00D',F3                                         00214**5
         ASSGN SYSPCH,X'00D',F2                                         00215**5
         ASSGN SYSLST,X'00E',F4                                         00216**5
         ASSGN SYSLST,X'00E',F3                                         00217**5
         ASSGN SYSLST,X'00E',F2                                         00218**5
         ASSGN SYSIPT,X'00C',BG                                         00219**5
         ASSGN SYSIPT,X'00C',F4                                         00220**5
         ASSGN SYSIPT,X'00C',F3                                         00221**5
         ASSGN SYSIPT,X'00C',F2                                         00222**5
         ASSGN SYSCAT,X'360',BG                                         00223*11
         ASSGN SYSCAT,X'360',F4                                         00224*11
         ASSGN SYSCAT,X'360',F3                                         00225*11
         ASSGN SYSCAT,X'360',F2                                         00226*11
         ASSGN SYSCAT,X'360',F1                                         00227*11
         ASSGN SYS000,X'362',BG                                         00228*12
         ASSGN SYS000,X'362',F4                                         00229*12
         ASSGN SYS000,X'362',F3                                         00230*12
         ASSGN SYS000,X'362',F2                                         00231*12
         ASSGN SYS000,X'362',F1
         ASSGN SYS001,X'130',BG                                         00232*12
         ASSGN SYS001,X'130',F4                                         00233*12
         ASSGN SYS001,X'130',F3                                         00234*12
         ASSGN SYS001,X'130',F2                                         00235*12
         ASSGN SYS001,X'130',F1
         ASSGN SYS002,X'130',BG                                         00236*12
         ASSGN SYS002,X'130',F4                                         00237*12
         ASSGN SYS002,X'130',F3                                         00238*12
         ASSGN SYS002,X'130',F2                                         00239*12
         ASSGN SYS002,X'130',F1
         ASSGN SYS003,X'130',BG                                         00240*12
         ASSGN SYS003,X'130',F4                                         00241*12
         ASSGN SYS003,X'130',F3                                         00242*12
         ASSGN SYS003,X'130',F2                                         00243*12
         ASSGN SYS003,X'130',F1
         ASSGN SYSLNK,X'130',BG                                         00244*12
         ASSGN SYSLNK,X'130',F4                                         00245*12
         ASSGN SYSLNK,X'130',F3                                         00246*12
         ASSGN SYSLNK,X'130',F2                                         00247*12
         ASSGN SYS004,X'00C',BG                                         00248**5
         ASSGN SYS004,X'00C',F4                                         00249**5
         ASSGN SYS004,X'00C',F3                                         00250**5
         ASSGN SYS004,X'00C',F2                                         00251**5
         ASSGN SYS005,X'00E',BG                                         00252**5
         ASSGN SYS005,X'00E',F4                                         00253**5
         ASSGN SYS005,X'00E',F3                                         00254**5
         ASSGN SYS005,X'00E',F2                                         00255**5
         ASSGN SYS006,X'00D',BG                                         00256**5
         ASSGN SYS006,X'00D',F4                                         00257**5
         ASSGN SYS006,X'00D',F3                                         00258**5
         ASSGN SYS006,X'00D',F2                                         00259**5
         DPD   UNIT=X'362',CYL=001,VOLID=WORK01                         00260**9
         SEND                                                           00261**5
         MEND                                                           00262**5
         GENSUPVR                                                       00263**5
         END                                                            00264**5
/*                                                                      00265**5
// EXEC LNKEDT
/&                                                                      00268**5
* $$ EOJ                                                                00269**5
