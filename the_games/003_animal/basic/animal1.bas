10 PRINT TAB(32); "ANIMAL"
20 PRINT TAB(15); "CREATIVE COMPUTING  MORRISTOWN, NEW JERSEY"
30 PRINT : PRINT : PRINT
40 PRINT "PLAY 'GUESS THE ANIMAL'"
50 PRINT "THINK OF AN ANIMAL AND THE COMPUTRE WILL TRY TO GUESS IT."
60 PRINT
70 DIM A$(200)
80 FOR I = 0 TO 3
90 READ A$(I)
100 NEXT I
110 N = VAL(A$(0))
120 REM          MAIN CONTROL SECTION
130 INPUT "ARE YOU THINKING OF AN ANIMAL"; A$
140 IF A$ = "LIST" THEN 600
150 IF LEFT$(A$, 1) <> "Y" THEN 120
160 K = 1
170 GOSUB 390
180 IF LEN(A$(K)) = 0 THEN 999
190 IF LEFT$(A$(K), 2) = "\Q" THEN 170
200 PRINT "IS IT A "; RIGHT$(A$(K), LEN(A$(K)) - 2);
210 INPUT A$
220 A$ = LEFT$(A$, 1)
230 IF A$ = "Y" THEN PRINT "WHY NOT TRY ANOTHER ANIMAL?": GOTO 120
240 INPUT "THE ANIMAL YOU WERE THINKING OF WAS A "; V$
250 PRINT "PLEASE TYPE IN A QUESTION THAT WOULD DISTINGUISH A"
260 PRINT V$; " FROM A "; RIGHT$(A$(K), LEN(A$(K)) - 2)
270 INPUT X$
280 PRINT "FOR A "; V$; " THE ANSWER WOULD BE ";
290 INPUT A$
300 A$ = LEFT$(A$, 1): IF A$ <> "Y" AND A$ <> "N" THEN 280
310 IF A$ = "Y" THEN B$ = "N"
320 IF A$ = "N" THEN B$ = "Y"
330 Z1 = VAL(A$(0))
340 A$(0) = STR$(Z1 + 2)
350 A$(Z1) = A$(K)
360 A$(Z1 + 1) = "\A" + V$
370 A$(K) = "\Q" + X$ + "\" + A$ + STR$(Z1 + 1) + "\" + B$ + STR$(Z1) + "\"
380 GOTO 120
390 REM     SUBROUTINE TO PRINT QUESTIONS
400 Q$ = A$(K)
410 FOR Z = 3 TO LEN(Q$)
415 IF MID$(Q$, Z, 1) <> "\" THEN PRINT MID$(Q$, Z, 1); : NEXT Z
INPUT C$
C$ = LEFT$(C$, 1)
440 IF C$ <> "Y" AND C$ <> "N" THEN 410
450 T$ = "\" + C$
455 FOR X = 3 TO LEN(Q$) - 1
460 IF MID$(Q$, X, 2) = T$ THEN 480
470 NEXT X
475 STOP
480 FOR Y = X + 1 TO LEN(Q$)
490 IF MID$(Q$, Y, 1) = "\" THEN 510
500 NEXT Y
505 STOP
510 K = VAL(MID$(Q$, X + 2, Y - X - 2))
520 RETURN
530 DATA "4","\QDOES IT SWIM\Y2\N3\","\AFISH","\ABIRD"
600 PRINT : PRINT "ANIMALS I ALREADY KNOW ARE:"
605 X = 0
610 FOR I = 1 TO 200
620 IF LEFT$(A$(I), 2) <> "\A" THEN 650
624 PRINT TAB(12 * X);
630 FOR Z = 3 TO LEN(A$(I))
640 IF MID$(A$(I), Z, 1) <> "\" THEN PRINT MID$(A$(I), Z, 1); : NEXT Z
645 X = X + 1: IF X > 5 THEN X = 0: PRINT
650 NEXT I
660 PRINT
670 PRINT
680 GOTO 120
999 END

