USERID DOSVS
* $$ JOB JNM=DOMC,CLASS=0,DISP=D,USER='R FERLAND'
* $$ LST CLASS=A,DISP=D,JSEP=0
// JOB DOMCPL1 - DOMC PL/1 PROGRAM (R FERLAND, 2011/02/15)
* DEFINE WORK FILES
// ASSGN  SYS001,X'130'
// ASSGN  SYS002,X'130'
// ASSGN  SYS003,X'130'
// ASSGN  SYS004,X'130'
// DLBL   IJSYS01,'DOS/VS.WORK-FILE.1',0,SD
// EXTENT SYS001,WORK02,1,0,2420,400
// DLBL   IJSYS02,'DOS/VS.WORK-FILE.2',0,SD
// EXTENT SYS002,WORK02,1,0,2820,400
// DLBL   IJSYS03,'DOS/VS.WORK-FILE.3',0,SD
// EXTENT SYS003,WORK02,1,0,3220,400
// DLBL   IJSYS04,'DOS/VS.WORK-FILE.4',0,SD
// EXTENT SYS004,WORK02,1,0,3620,300
// OPTION LINK,NODUMP,NOLISTX,NOSYM,NOXREF
   ACTION NOMAP,CANCEL
* COMPILE,
// EXEC PL/I
 DOMC: PROC OPTIONS(MAIN);

   /* DECLARATIONS DES VARIABLES */
   DCL (S0, R, SIGMA)  FLOAT BINARY(53);
   DCL (T, X, H)       FLOAT BINARY(53);
   DCL ENJEU           FIXED BINARY(31);
   DCL PRIX            FLOAT BINARY(53);
   DCL (Y, S, DT, DW)  FLOAT BINARY(53);
   DCL (N, NPAS, I, J) FIXED BINARY(31);

   /* SEQUENCE DU GENERATEUR */
   DCL (X0, X1, X2, X3) FIXED BINARY(31);

   /****************************************************************
    * GENERATEUR DE NOMBRES PSEUDO-ALEATOIRES                      *
    ****************************************************************/

   UNIF: PROC(X0,X1,X2,X3) RETURNS(FLOAT BINARY(53));
     DCL (X0, X1, X2, X3) FIXED BINARY(31);
     DCL (Z0, Z1, Z2, Z3) FIXED BINARY(31);
     DCL U FLOAT BINARY(53);
     Z0 = (53 * X0) + 11;
     Z1 = (53 * X1) + (15372 * X0);
     Z2 = (53 * X2) + (15372 * X1) + (6238 * X0);
     Z3 = (53 * X3) + (15372 * X2) + (6238 * X1) + (32 * X0);
     X0 = MOD(Z0,16384);
     Z1 = Z1 + Z0/16384;
     X1 = MOD(Z1,16384);
     Z2 = Z2 + Z1/16384;
     X2 = MOD(Z2,16384);
     Z3 = Z3 + Z2/16384;
     X3 = MOD(Z3,64);
     U = (X3 * 0.015625) + (X2 * 9.536743164E-07)
              + (X1 * 5.820766091E-11) + (X0 * 3.552713679E-15);
     RETURN(U);
     END UNIF;

   /****************************************************************
    * GENERATEUR DE VARIABLES NORMALES CENTREES REDUITES           *
    ****************************************************************/

   GAUSS: PROC RETURNS(FLOAT BINARY(53));
     DCL (U1, U2, W) FLOAT BINARY(53);
     W = 2;
     DO WHILE ( W > 1 );
        U1 = 2*UNIF(X0,X1,X2,X3)-1;
        U2 = 2*UNIF(X0,X1,X2,X3)-1;
        W = U1*U1+U2*U2;
     END;
     RETURN(SQRT(-2*LOG(W)/W)*U2);
     END GAUSS;

   /****************************************************************
    * PROGRAMME PRINCIPAL                                          *
    ****************************************************************/

   /* PARAMETRES DU MODELE */
   S0 = 100;
   R = 0.05;
   SIGMA = 0.2;

   /* PARAMETRES DU PRODUIT DERIVE */
   T = 1;
   X = 90;
   H = 80;

   /* PARAMETRES DE LA SIMULATION */
   N = 500;
   NPAS = 365;
   DT = T/NPAS;

   /* INITIALISE LA SIMULATION */
   PRIX = 0;
   X0 = 11; X1 = 3567; X2 = 25; X3 = 23;

   /* BOUCLE PRINCIPALE */
   DO J=1 TO N;

       /* SIMULE LE SOUS-JACENT */
       S = S0;
       ENJEU = 1;
       DO I=1 TO NPAS;
           DW = SQRT(DT)*GAUSS;
           S = S*EXP((R-(SIGMA*SIGMA)/2)*DT+SIGMA*DW);
           IF S < H THEN ENJEU = 0;
       END;

       /* CALCULE LA RECETTE */
       IF S > X THEN
          Y = (S-X)*ENJEU;
       ELSE
          Y = 0;

       /* MISE A JOUR DU PRIX */
       PRIX = PRIX+Y/N;

   END;

   PRIX = EXP(-R*T)*PRIX;
   PUT LIST('Option d''achat avec barriere desactivante');
   PUT SKIP EDIT('Prix = ',PRIX)(A,F(5,2));

   END DOMC;
/*
* LINK EDIT,
// EXEC LNKEDT
* AND GO EXECUTE.
// EXEC
/&
* $$ EOJ		
