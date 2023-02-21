000100 IDENTIFICATION DIVISION.                                         NC2404.2
000200 PROGRAM-ID.                                                      NC2404.2
000300     NC240A.                                                      NC2404.2
000400                                                                  NC2404.2
000500****************************************************************  NC2404.2
000600*                                                              *  NC2404.2
000700*    VALIDATION FOR:-                                          *  NC2404.2
000800*                                                              *  NC2404.2
000900*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2404.2
001000*                                                              *  NC2404.2
001100*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2404.2
001200*                                                              *  NC2404.2
001300****************************************************************  NC2404.2
001400*                                                              *  NC2404.2
001500*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2404.2
001600*                                                              *  NC2404.2
001700*        X-55  - SYSTEM PRINTER NAME.                          *  NC2404.2
001800*        X-82  - SOURCE COMPUTER NAME.                         *  NC2404.2
001900*        X-83  - OBJECT COMPUTER NAME.                         *  NC2404.2
002000*                                                              *  NC2404.2
002100****************************************************************  NC2404.2
002200*                                                              *  NC2404.2
002300*    PROGRAM NC240A TESTS THE CONSTRUCTION AND ACCESS OF A     *  NC2404.2
002400*    THREE-DIMENSIONAL TABLE USING SUBSCRIPTS.  THE CONTENT OF *  NC2404.2
002500*    TABLE ELEMENTS IS VERIFIED BY USE OF THE FORMAT 4         *  NC2404.2
002600*    "PERFORM" STATEMENT.                                      *  NC2404.2
002700*                                                              *  NC2404.2
002800****************************************************************  NC2404.2
002900                                                                  NC2404.2
003000 ENVIRONMENT DIVISION.                                            NC2404.2
003100 CONFIGURATION SECTION.                                           NC2404.2
003200 SOURCE-COMPUTER.                                                 NC2404.2
003300     XXXXX082.                                                    NC2404.2
003400 OBJECT-COMPUTER.                                                 NC2404.2
003500     XXXXX083.                                                    NC2404.2
003600 INPUT-OUTPUT SECTION.                                            NC2404.2
003700 FILE-CONTROL.                                                    NC2404.2
003800     SELECT PRINT-FILE ASSIGN TO                                  NC2404.2
003900     XXXXX055.                                                    NC2404.2
004000 DATA DIVISION.                                                   NC2404.2
004100 FILE SECTION.                                                    NC2404.2
004200 FD  PRINT-FILE.                                                  NC2404.2
004300 01  PRINT-REC PICTURE X(120).                                    NC2404.2
004400 01  DUMMY-RECORD PICTURE X(120).                                 NC2404.2
004500 WORKING-STORAGE SECTION.                                         NC2404.2
004600 77  SUB-1              PICTURE S99   VALUE ZERO.                 NC2404.2
004700 77  SUB-2              PICTURE 99    VALUE ZERO.                 NC2404.2
004800 77  SUB-3              PICTURE 99    VALUE ZERO.                 NC2404.2
004900 77   TEST-CHECK PIC X(4) VALUE SPACE.                            NC2404.2
005000 77  CON-10             PICTURE 99  VALUE 10.                     NC2404.2
005100 77  CON-7              PICTURE 99  VALUE 07.                     NC2404.2
005200 77  ELEM-HOLD-AREA               PICTURE X(15) VALUE SPACES.     NC2404.2
005300 77  CON-5              PICTURE 99  VALUE 05.                     NC2404.2
005400 77  SEC-HOLD-AREA                PICTURE X(11)  VALUE SPACES.    NC2404.2
005500 77  CON-6              PICTURE 99  VALUE 06.                     NC2404.2
005600 77  GRP-HOLD-AREA                PICTURE X(5)  VALUE SPACES.     NC2404.2
005700 01  GRP-NAME.                                                    NC2404.2
005800     02  FILLER              PICTURE XXX    VALUE "GRP".          NC2404.2
005900     02  ADD-GRP             PICTURE 99     VALUE 01.             NC2404.2
006000                                                                  NC2404.2
006100 01  SEC-NAME.                                                    NC2404.2
006200     02  FILLER              PICTURE X(5)   VALUE "SEC (".        NC2404.2
006300     02  SEC-GRP             PICTURE 99     VALUE 00.             NC2404.2
006400     02  FILLER              PICTURE X      VALUE ",".            NC2404.2
006500     02  ADD-SEC             PICTURE 99     VALUE 01.             NC2404.2
006600     02  FILLER              PICTURE X      VALUE ")".            NC2404.2
006700                                                                  NC2404.2
006800 01  ELEM-NAME.                                                   NC2404.2
006900     02  FILLER              PICTURE X(6)   VALUE "ELEM (".       NC2404.2
007000     02  ELEM-GRP            PICTURE 99     VALUE 00.             NC2404.2
007100     02  FILLER              PICTURE X      VALUE ",".            NC2404.2
007200     02  ELEM-SEC            PICTURE 99     VALUE 00.             NC2404.2
007300     02  FILLER              PICTURE X      VALUE ",".            NC2404.2
007400     02  ADD-ELEM            PICTURE 99     VALUE 01.             NC2404.2
007500     02  FILLER              PICTURE X      VALUE ")".            NC2404.2
007600                                                                  NC2404.2
007700 01  3-DIMENSION-TBL.                                             NC2404.2
007800     02  GRP-ENTRY OCCURS 10 TIMES INDEXED BY IDX-1.              NC2404.2
007900         03  ENTRY-1         PICTURE X(5).                        NC2404.2
008000         03  GRP2-ENTRY OCCURS 10 TIMES INDEXED BY IDX-2.         NC2404.2
008100             04  ENTRY-2     PICTURE X(11).                       NC2404.2
008200             04  GRP3-ENTRY OCCURS 10 TIMES INDEXED BY IDX-3.     NC2404.2
008300                 05  ENTRY-3 PICTURE X(15).                       NC2404.2
008400 01  TEST-RESULTS.                                                NC2404.2
008500     02 FILLER                   PIC X      VALUE SPACE.          NC2404.2
008600     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2404.2
008700     02 FILLER                   PIC X      VALUE SPACE.          NC2404.2
008800     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2404.2
008900     02 FILLER                   PIC X      VALUE SPACE.          NC2404.2
009000     02  PAR-NAME.                                                NC2404.2
009100       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2404.2
009200       03  PARDOT-X              PIC X      VALUE SPACE.          NC2404.2
009300       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2404.2
009400     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2404.2
009500     02 RE-MARK                  PIC X(61).                       NC2404.2
009600 01  TEST-COMPUTED.                                               NC2404.2
009700     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2404.2
009800     02 FILLER                   PIC X(17)  VALUE                 NC2404.2
009900            "       COMPUTED=".                                   NC2404.2
010000     02 COMPUTED-X.                                               NC2404.2
010100     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2404.2
010200     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2404.2
010300                                 PIC -9(9).9(9).                  NC2404.2
010400     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2404.2
010500     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2404.2
010600     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2404.2
010700     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2404.2
010800         04 COMPUTED-18V0                    PIC -9(18).          NC2404.2
010900         04 FILLER                           PIC X.               NC2404.2
011000     03 FILLER PIC X(50) VALUE SPACE.                             NC2404.2
011100 01  TEST-CORRECT.                                                NC2404.2
011200     02 FILLER PIC X(30) VALUE SPACE.                             NC2404.2
011300     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2404.2
011400     02 CORRECT-X.                                                NC2404.2
011500     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2404.2
011600     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2404.2
011700     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2404.2
011800     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2404.2
011900     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2404.2
012000     03      CR-18V0 REDEFINES CORRECT-A.                         NC2404.2
012100         04 CORRECT-18V0                     PIC -9(18).          NC2404.2
012200         04 FILLER                           PIC X.               NC2404.2
012300     03 FILLER PIC X(2) VALUE SPACE.                              NC2404.2
012400     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2404.2
012500 01  CCVS-C-1.                                                    NC2404.2
012600     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2404.2
012700-    "SS  PARAGRAPH-NAME                                          NC2404.2
012800-    "       REMARKS".                                            NC2404.2
012900     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2404.2
013000 01  CCVS-C-2.                                                    NC2404.2
013100     02 FILLER                     PIC X        VALUE SPACE.      NC2404.2
013200     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2404.2
013300     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2404.2
013400     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2404.2
013500     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2404.2
013600 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2404.2
013700 01  REC-CT                        PIC 99       VALUE ZERO.       NC2404.2
013800 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2404.2
013900 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2404.2
014000 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2404.2
014100 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2404.2
014200 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2404.2
014300 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2404.2
014400 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2404.2
014500 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2404.2
014600 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2404.2
014700 01  CCVS-H-1.                                                    NC2404.2
014800     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2404.2
014900     02  FILLER                    PIC X(42)    VALUE             NC2404.2
015000     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2404.2
015100     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2404.2
015200 01  CCVS-H-2A.                                                   NC2404.2
015300   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2404.2
015400   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2404.2
015500   02  FILLER                        PIC XXXX   VALUE             NC2404.2
015600     "4.2 ".                                                      NC2404.2
015700   02  FILLER                        PIC X(28)  VALUE             NC2404.2
015800            " COPY - NOT FOR DISTRIBUTION".                       NC2404.2
015900   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2404.2
016000                                                                  NC2404.2
016100 01  CCVS-H-2B.                                                   NC2404.2
016200   02  FILLER                        PIC X(15)  VALUE             NC2404.2
016300            "TEST RESULT OF ".                                    NC2404.2
016400   02  TEST-ID                       PIC X(9).                    NC2404.2
016500   02  FILLER                        PIC X(4)   VALUE             NC2404.2
016600            " IN ".                                               NC2404.2
016700   02  FILLER                        PIC X(12)  VALUE             NC2404.2
016800     " HIGH       ".                                              NC2404.2
016900   02  FILLER                        PIC X(22)  VALUE             NC2404.2
017000            " LEVEL VALIDATION FOR ".                             NC2404.2
017100   02  FILLER                        PIC X(58)  VALUE             NC2404.2
017200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2404.2
017300 01  CCVS-H-3.                                                    NC2404.2
017400     02  FILLER                      PIC X(34)  VALUE             NC2404.2
017500            " FOR OFFICIAL USE ONLY    ".                         NC2404.2
017600     02  FILLER                      PIC X(58)  VALUE             NC2404.2
017700     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2404.2
017800     02  FILLER                      PIC X(28)  VALUE             NC2404.2
017900            "  COPYRIGHT   1985 ".                                NC2404.2
018000 01  CCVS-E-1.                                                    NC2404.2
018100     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2404.2
018200     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2404.2
018300     02 ID-AGAIN                     PIC X(9).                    NC2404.2
018400     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2404.2
018500 01  CCVS-E-2.                                                    NC2404.2
018600     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2404.2
018700     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2404.2
018800     02 CCVS-E-2-2.                                               NC2404.2
018900         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2404.2
019000         03 FILLER                   PIC X      VALUE SPACE.      NC2404.2
019100         03 ENDER-DESC               PIC X(44)  VALUE             NC2404.2
019200            "ERRORS ENCOUNTERED".                                 NC2404.2
019300 01  CCVS-E-3.                                                    NC2404.2
019400     02  FILLER                      PIC X(22)  VALUE             NC2404.2
019500            " FOR OFFICIAL USE ONLY".                             NC2404.2
019600     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2404.2
019700     02  FILLER                      PIC X(58)  VALUE             NC2404.2
019800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2404.2
019900     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2404.2
020000     02 FILLER                       PIC X(15)  VALUE             NC2404.2
020100             " COPYRIGHT 1985".                                   NC2404.2
020200 01  CCVS-E-4.                                                    NC2404.2
020300     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2404.2
020400     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2404.2
020500     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2404.2
020600     02 FILLER                       PIC X(40)  VALUE             NC2404.2
020700      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2404.2
020800 01  XXINFO.                                                      NC2404.2
020900     02 FILLER                       PIC X(19)  VALUE             NC2404.2
021000            "*** INFORMATION ***".                                NC2404.2
021100     02 INFO-TEXT.                                                NC2404.2
021200       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2404.2
021300       04 XXCOMPUTED                 PIC X(20).                   NC2404.2
021400       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2404.2
021500       04 XXCORRECT                  PIC X(20).                   NC2404.2
021600     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2404.2
021700 01  HYPHEN-LINE.                                                 NC2404.2
021800     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2404.2
021900     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2404.2
022000-    "*****************************************".                 NC2404.2
022100     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2404.2
022200-    "******************************".                            NC2404.2
022300 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2404.2
022400     "NC240A".                                                    NC2404.2
022500 PROCEDURE DIVISION.                                              NC2404.2
022600 CCVS1 SECTION.                                                   NC2404.2
022700 OPEN-FILES.                                                      NC2404.2
022800     OPEN     OUTPUT PRINT-FILE.                                  NC2404.2
022900     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2404.2
023000     MOVE    SPACE TO TEST-RESULTS.                               NC2404.2
023100     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2404.2
023200     GO TO CCVS1-EXIT.                                            NC2404.2
023300 CLOSE-FILES.                                                     NC2404.2
023400     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2404.2
023500 TERMINATE-CCVS.                                                  NC2404.2
023600S    EXIT PROGRAM.                                                NC2404.2
023700STERMINATE-CALL.                                                  NC2404.2
023800     STOP     RUN.                                                NC2404.2
023900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2404.2
024000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2404.2
024100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2404.2
024200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2404.2
024300     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2404.2
024400 PRINT-DETAIL.                                                    NC2404.2
024500     IF REC-CT NOT EQUAL TO ZERO                                  NC2404.2
024600             MOVE "." TO PARDOT-X                                 NC2404.2
024700             MOVE REC-CT TO DOTVALUE.                             NC2404.2
024800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2404.2
024900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2404.2
025000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2404.2
025100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2404.2
025200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2404.2
025300     MOVE SPACE TO CORRECT-X.                                     NC2404.2
025400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2404.2
025500     MOVE     SPACE TO RE-MARK.                                   NC2404.2
025600 HEAD-ROUTINE.                                                    NC2404.2
025700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2404.2
025800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2404.2
025900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2404.2
026000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2404.2
026100 COLUMN-NAMES-ROUTINE.                                            NC2404.2
026200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2404.2
026300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2404.2
026400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2404.2
026500 END-ROUTINE.                                                     NC2404.2
026600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2404.2
026700 END-RTN-EXIT.                                                    NC2404.2
026800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2404.2
026900 END-ROUTINE-1.                                                   NC2404.2
027000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2404.2
027100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2404.2
027200      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2404.2
027300*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2404.2
027400      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2404.2
027500      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2404.2
027600      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2404.2
027700      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2404.2
027800  END-ROUTINE-12.                                                 NC2404.2
027900      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2404.2
028000     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2404.2
028100         MOVE "NO " TO ERROR-TOTAL                                NC2404.2
028200         ELSE                                                     NC2404.2
028300         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2404.2
028400     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2404.2
028500     PERFORM WRITE-LINE.                                          NC2404.2
028600 END-ROUTINE-13.                                                  NC2404.2
028700     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2404.2
028800         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2404.2
028900         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2404.2
029000     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2404.2
029100     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2404.2
029200      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2404.2
029300          MOVE "NO " TO ERROR-TOTAL                               NC2404.2
029400      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2404.2
029500      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2404.2
029600      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2404.2
029700     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2404.2
029800 WRITE-LINE.                                                      NC2404.2
029900     ADD 1 TO RECORD-COUNT.                                       NC2404.2
030000Y    IF RECORD-COUNT GREATER 50                                   NC2404.2
030100Y        MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2404.2
030200Y        MOVE SPACE TO DUMMY-RECORD                               NC2404.2
030300Y        WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2404.2
030400Y        MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2404.2
030500Y        MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2404.2
030600Y        MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2404.2
030700Y        MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2404.2
030800Y        MOVE ZERO TO RECORD-COUNT.                               NC2404.2
030900     PERFORM WRT-LN.                                              NC2404.2
031000 WRT-LN.                                                          NC2404.2
031100     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2404.2
031200     MOVE SPACE TO DUMMY-RECORD.                                  NC2404.2
031300 BLANK-LINE-PRINT.                                                NC2404.2
031400     PERFORM WRT-LN.                                              NC2404.2
031500 FAIL-ROUTINE.                                                    NC2404.2
031600     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2404.2
031700     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2404.2
031800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2404.2
031900     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2404.2
032000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2404.2
032100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2404.2
032200     GO TO  FAIL-ROUTINE-EX.                                      NC2404.2
032300 FAIL-ROUTINE-WRITE.                                              NC2404.2
032400     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2404.2
032500     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2404.2
032600     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2404.2
032700     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2404.2
032800 FAIL-ROUTINE-EX. EXIT.                                           NC2404.2
032900 BAIL-OUT.                                                        NC2404.2
033000     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2404.2
033100     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2404.2
033200 BAIL-OUT-WRITE.                                                  NC2404.2
033300     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2404.2
033400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2404.2
033500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2404.2
033600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2404.2
033700 BAIL-OUT-EX. EXIT.                                               NC2404.2
033800 CCVS1-EXIT.                                                      NC2404.2
033900     EXIT.                                                        NC2404.2
034000 SECT-NC24A-0001 SECTION.                                         NC2404.2
034100 TH-13-001.                                                       NC2404.2
034200 BUILD-LEVEL-1.                                                   NC2404.2
034300     ADD 1 TO SUB-1.                                              NC2404.2
034400     IF SUB-1 = 11 GO TO CHECK-ENTRIES.                           NC2404.2
034500     MOVE GRP-NAME TO ENTRY-1 (SUB-1).                            NC2404.2
034600     ADD 1 TO ADD-GRP.                                            NC2404.2
034700                                                                  NC2404.2
034800 BUILD-LEVEL-2.                                                   NC2404.2
034900     ADD 1 TO SUB-2.                                              NC2404.2
035000     IF SUB-2 = 11                                                NC2404.2
035100         MOVE ZERO TO SUB-2                                       NC2404.2
035200         MOVE 01 TO ADD-SEC                                       NC2404.2
035300         GO TO BUILD-LEVEL-1.                                     NC2404.2
035400     MOVE SUB-1 TO SEC-GRP.                                       NC2404.2
035500     MOVE SEC-NAME TO ENTRY-2 (SUB-1, SUB-2).                     NC2404.2
035600     ADD 1 TO ADD-SEC.                                            NC2404.2
035700                                                                  NC2404.2
035800 BUILD-LEVEL-3.                                                   NC2404.2
035900     ADD 1 TO SUB-3.                                              NC2404.2
036000     IF SUB-3 = 11                                                NC2404.2
036100         MOVE ZERO TO SUB-3                                       NC2404.2
036200              MOVE 01 TO ADD-ELEM                                 NC2404.2
036300              GO TO BUILD-LEVEL-2.                                NC2404.2
036400     MOVE SUB-1 TO ELEM-GRP.                                      NC2404.2
036500     MOVE SUB-2 TO ELEM-SEC.                                      NC2404.2
036600     MOVE ELEM-NAME TO ENTRY-3 (SUB-1, SUB-2, SUB-3).             NC2404.2
036700     ADD 1 TO ADD-ELEM.                                           NC2404.2
036800     GO TO BUILD-LEVEL-3.                                         NC2404.2
036900                                                                  NC2404.2
037000 CHECK-ENTRIES.                                                   NC2404.2
037100     MOVE "PERFORM VARYING LEV1" TO FEATURE.                      NC2404.2
037200     MOVE "CHECK-ENTRIES       " TO PAR-NAME.                     NC2404.2
037300     MOVE SPACES TO TEST-CHECK.                                   NC2404.2
037400     MOVE "GRP05" TO GRP-HOLD-AREA.                               NC2404.2
037500     PERFORM FIND-LEVEL-1-ENTRY VARYING CON-5 FROM 1 BY 1         NC2404.2
037600         UNTIL CON-5 = 11.                                        NC2404.2
037700     IF TEST-CHECK = "PASS" GO TO TH1-INIT-GF-2.                  NC2404.2
037800     MOVE GRP-HOLD-AREA TO CORRECT-A.                             NC2404.2
037900     MOVE ENTRY-1 (05) TO COMPUTED-A.                             NC2404.2
038000                                                                  NC2404.2
038100     MOVE "PERFORM VARYING DATA NAMES " TO RE-MARK.               NC2404.2
038200     PERFORM FAIL.                                                NC2404.2
038300     PERFORM PRINT-DETAIL.                                        NC2404.2
038400*                                                                 NC2404.2
038500 TH1-INIT-GF-2.                                                   NC2404.2
038600     MOVE "GRP10" TO GRP-HOLD-AREA.                               NC2404.2
038700     MOVE "TH1-TEST-GF-2      " TO PAR-NAME.                      NC2404.2
038800     MOVE "VI-109" TO ANSI-REFERENCE.                             NC2404.2
038900     MOVE SPACES TO TEST-CHECK.                                   NC2404.2
039000 TH1-TEST-GF-2.                                                   NC2404.2
039100     PERFORM FIND-LEVEL-1-ENTRY                                   NC2404.2
039200             VARYING CON-5 FROM 1 BY 1 UNTIL CON-5 = 11.          NC2404.2
039300     IF TEST-CHECK = "PASS"                                       NC2404.2
039400         PERFORM PASS                                             NC2404.2
039500         GO TO TH1-WRITE-GF-2                                     NC2404.2
039600     ELSE                                                         NC2404.2
039700         GO TO TH1-FAIL-GF-2.                                     NC2404.2
039800 TH1-DELETE-GF-2.                                                 NC2404.2
039900     PERFORM DE-LETE.                                             NC2404.2
040000     GO TO TH1-WRITE-GF-2.                                        NC2404.2
040100 TH1-FAIL-GF-2.                                                   NC2404.2
040200     MOVE GRP-HOLD-AREA TO CORRECT-A.                             NC2404.2
040300     MOVE ENTRY-1 (10) TO COMPUTED-A.                             NC2404.2
040400                                                                  NC2404.2
040500     MOVE "PERFORM VARYING DATA NAMES " TO RE-MARK.               NC2404.2
040600     PERFORM FAIL.                                                NC2404.2
040700 TH1-WRITE-GF-2.                                                  NC2404.2
040800     PERFORM PRINT-DETAIL.                                        NC2404.2
040900                                                                  NC2404.2
041000 TH1-INIT-GF-3.                                                   NC2404.2
041100     MOVE "GRP07" TO GRP-HOLD-AREA.                               NC2404.2
041200     MOVE "TH1-TEST-GF-3      " TO PAR-NAME.                      NC2404.2
041300     MOVE "VI-109" TO ANSI-REFERENCE.                             NC2404.2
041400     MOVE SPACES TO TEST-CHECK.                                   NC2404.2
041500 TH1-TEST-GF-3.                                                   NC2404.2
041600     PERFORM FIND-LEVEL-1-ENTRY                                   NC2404.2
041700             VARYING CON-5 FROM 1 BY 1 UNTIL CON-5 = 11.          NC2404.2
041800     IF TEST-CHECK = "PASS"                                       NC2404.2
041900         PERFORM PASS                                             NC2404.2
042000         GO TO TH1-WRITE-GF-3                                     NC2404.2
042100     ELSE                                                         NC2404.2
042200         GO TO TH1-FAIL-GF-3.                                     NC2404.2
042300 TH1-DELETE-GF-3.                                                 NC2404.2
042400     PERFORM DE-LETE.                                             NC2404.2
042500     GO TO TH1-WRITE-GF-3.                                        NC2404.2
042600 TH1-FAIL-GF-3.                                                   NC2404.2
042700     MOVE GRP-HOLD-AREA TO CORRECT-A.                             NC2404.2
042800     MOVE ENTRY-1 (07) TO COMPUTED-A.                             NC2404.2
042900                                                                  NC2404.2
043000     MOVE "PERFORM VARYING DATA NAMES " TO RE-MARK.               NC2404.2
043100     PERFORM FAIL.                                                NC2404.2
043200 TH1-WRITE-GF-3.                                                  NC2404.2
043300     PERFORM PRINT-DETAIL.                                        NC2404.2
043400*                                                                 NC2404.2
043500 TH1-INIT-GF-4.                                                   NC2404.2
043600     MOVE "TH1-TEST-GF-4      " TO PAR-NAME.                      NC2404.2
043700     MOVE "VI-109" TO ANSI-REFERENCE.                             NC2404.2
043800     MOVE "GRP01" TO GRP-HOLD-AREA.                               NC2404.2
043900 TH1-TEST-GF-4.                                                   NC2404.2
044000     PERFORM FIND-LEVEL-1-ENTRY                                   NC2404.2
044100             VARYING CON-5 FROM 1 BY 1 UNTIL CON-5 = 11.          NC2404.2
044200     IF TEST-CHECK = "PASS"                                       NC2404.2
044300         PERFORM PASS                                             NC2404.2
044400         GO TO TH1-WRITE-GF-4                                     NC2404.2
044500     ELSE                                                         NC2404.2
044600         GO TO TH1-FAIL-GF-4.                                     NC2404.2
044700 TH1-DELETE-GF-4.                                                 NC2404.2
044800     PERFORM DE-LETE.                                             NC2404.2
044900     GO TO TH1-WRITE-GF-4.                                        NC2404.2
045000 TH1-FAIL-GF-4.                                                   NC2404.2
045100     MOVE GRP-HOLD-AREA TO CORRECT-A.                             NC2404.2
045200     MOVE ENTRY-1 (01) TO COMPUTED-A.                             NC2404.2
045300                                                                  NC2404.2
045400     MOVE "PERFORM VARYING DATA NAMES " TO RE-MARK.               NC2404.2
045500     PERFORM FAIL.                                                NC2404.2
045600 TH1-WRITE-GF-4.                                                  NC2404.2
045700     PERFORM PRINT-DETAIL.                                        NC2404.2
045800     GO TO TH2-INIT-GF-1.                                         NC2404.2
045900                                                                  NC2404.2
046000 FIND-LEVEL-1-ENTRY.                                              NC2404.2
046100     IF ENTRY-1 (CON-5) = GRP-HOLD-AREA                           NC2404.2
046200         MOVE "PASS" TO TEST-CHECK.                               NC2404.2
046300                                                                  NC2404.2
046400 TH2-INIT-GF-1.                                                   NC2404.2
046500     MOVE "TH2-TEST-GF-1      " TO PAR-NAME.                      NC2404.2
046600     MOVE "PERFORM VARYING LEV2" TO FEATURE.                      NC2404.2
046700     MOVE "VI-109" TO ANSI-REFERENCE.                             NC2404.2
046800     MOVE "SEC (03,05)" TO SEC-HOLD-AREA.                         NC2404.2
046900     MOVE SPACES TO TEST-CHECK.                                   NC2404.2
047000 TH2-TEST-GF-1.                                                   NC2404.2
047100     PERFORM FIND-LEVEL-2-ENTRY                                   NC2404.2
047200             VARYING CON-5 FROM 1 BY 1 UNTIL CON-5 = 11           NC2404.2
047300             AFTER   CON-6 FROM 1 BY 1 UNTIL CON-6 = 10.          NC2404.2
047400     IF TEST-CHECK = "PASS"                                       NC2404.2
047500         PERFORM PASS                                             NC2404.2
047600         GO TO TH2-WRITE-GF-1                                     NC2404.2
047700     ELSE                                                         NC2404.2
047800         GO TO TH2-FAIL-GF-1.                                     NC2404.2
047900 TH2-DELETE-GF-1.                                                 NC2404.2
048000     PERFORM DE-LETE.                                             NC2404.2
048100     GO TO TH2-WRITE-GF-1.                                        NC2404.2
048200 TH2-FAIL-GF-1.                                                   NC2404.2
048300     MOVE SEC-HOLD-AREA TO CORRECT-A.                             NC2404.2
048400     MOVE ENTRY-2 (03, 05) TO COMPUTED-A.                         NC2404.2
048500                                                                  NC2404.2
048600     MOVE "PERFORM VARYING DATA NAMES " TO RE-MARK.               NC2404.2
048700     PERFORM FAIL.                                                NC2404.2
048800 TH2-WRITE-GF-1.                                                  NC2404.2
048900     PERFORM PRINT-DETAIL.                                        NC2404.2
049000                                                                  NC2404.2
049100 TH2-INIT-GF-2.                                                   NC2404.2
049200     MOVE "TH2-TEST-GF-2      " TO PAR-NAME.                      NC2404.2
049300     MOVE "VI-109" TO ANSI-REFERENCE.                             NC2404.2
049400     MOVE SPACES TO TEST-CHECK.                                   NC2404.2
049500     MOVE "SEC (01,01)" TO SEC-HOLD-AREA.                         NC2404.2
049600 TH2-TEST-GF-2.                                                   NC2404.2
049700     PERFORM FIND-LEVEL-2-ENTRY                                   NC2404.2
049800             VARYING CON-5 FROM 1 BY 1 UNTIL CON-5 = 11           NC2404.2
049900             AFTER   CON-6 FROM 1 BY 1 UNTIL CON-6 = 10.          NC2404.2
050000     IF TEST-CHECK = "PASS"                                       NC2404.2
050100         PERFORM PASS                                             NC2404.2
050200         GO TO TH2-WRITE-GF-2                                     NC2404.2
050300     ELSE                                                         NC2404.2
050400         GO TO TH2-FAIL-GF-2.                                     NC2404.2
050500 TH2-DELETE-GF-2.                                                 NC2404.2
050600     PERFORM DE-LETE.                                             NC2404.2
050700     GO TO TH2-WRITE-GF-2.                                        NC2404.2
050800 TH2-FAIL-GF-2.                                                   NC2404.2
050900     MOVE SEC-HOLD-AREA TO CORRECT-A.                             NC2404.2
051000     MOVE ENTRY-2 (01, 01) TO COMPUTED-A.                         NC2404.2
051100                                                                  NC2404.2
051200     MOVE "PERFORM VARYING DATA NAMES " TO RE-MARK.               NC2404.2
051300     PERFORM FAIL.                                                NC2404.2
051400 TH2-WRITE-GF-2.                                                  NC2404.2
051500     PERFORM PRINT-DETAIL.                                        NC2404.2
051600                                                                  NC2404.2
051700 TH2-INIT-GF-3.                                                   NC2404.2
051800     MOVE "TH2-TEST-GF-3      " TO PAR-NAME.                      NC2404.2
051900     MOVE SPACES TO TEST-CHECK.                                   NC2404.2
052000     MOVE "VI-109" TO ANSI-REFERENCE.                             NC2404.2
052100     MOVE "SEC (10,01)" TO SEC-HOLD-AREA.                         NC2404.2
052200 TH2-TEST-GF-3.                                                   NC2404.2
052300     PERFORM FIND-LEVEL-2-ENTRY                                   NC2404.2
052400             VARYING CON-5 FROM 1 BY 1 UNTIL CON-5 = 11           NC2404.2
052500             AFTER   CON-6 FROM 1 BY 1 UNTIL CON-6 = 10.          NC2404.2
052600     IF TEST-CHECK = "PASS"                                       NC2404.2
052700         PERFORM PASS                                             NC2404.2
052800         GO TO TH2-WRITE-GF-3                                     NC2404.2
052900     ELSE                                                         NC2404.2
053000         GO TO TH2-FAIL-GF-3.                                     NC2404.2
053100 TH2-DELETE-GF-3.                                                 NC2404.2
053200     PERFORM DE-LETE.                                             NC2404.2
053300     GO TO TH2-WRITE-GF-3.                                        NC2404.2
053400 TH2-FAIL-GF-3.                                                   NC2404.2
053500     MOVE SEC-HOLD-AREA TO CORRECT-A.                             NC2404.2
053600     MOVE ENTRY-2 (10, 01) TO COMPUTED-A.                         NC2404.2
053700                                                                  NC2404.2
053800     MOVE "PERFORM VARYING DATA NAMES " TO RE-MARK.               NC2404.2
053900     PERFORM FAIL.                                                NC2404.2
054000 TH2-WRITE-GF-3.                                                  NC2404.2
054100     PERFORM PRINT-DETAIL.                                        NC2404.2
054200*                                                                 NC2404.2
054300 TH2-INIT-GF-4.                                                   NC2404.2
054400     MOVE "TH2-TEST-GF-4      " TO PAR-NAME.                      NC2404.2
054500     MOVE "VI-109" TO ANSI-REFERENCE.                             NC2404.2
054600     MOVE SPACES TO TEST-CHECK.                                   NC2404.2
054700     MOVE SPACES TO TEST-CHECK.                                   NC2404.2
054800     MOVE "SEC (10,10)" TO SEC-HOLD-AREA.                         NC2404.2
054900 TH2-TEST-GF-4.                                                   NC2404.2
055000     PERFORM FIND-LEVEL-2-ENTRY                                   NC2404.2
055100             VARYING CON-5 FROM 2 BY 2 UNTIL CON-5 = 12           NC2404.2
055200             AFTER   CON-6 FROM 2 BY 2 UNTIL CON-6 = 12.          NC2404.2
055300     IF TEST-CHECK = "PASS"                                       NC2404.2
055400         PERFORM PASS                                             NC2404.2
055500         GO TO TH2-WRITE-GF-4                                     NC2404.2
055600     ELSE                                                         NC2404.2
055700         GO TO TH2-FAIL-GF-4.                                     NC2404.2
055800 TH2-DELETE-GF-4.                                                 NC2404.2
055900     PERFORM DE-LETE.                                             NC2404.2
056000     GO TO TH2-WRITE-GF-4.                                        NC2404.2
056100 TH2-FAIL-GF-4.                                                   NC2404.2
056200     MOVE SEC-HOLD-AREA TO CORRECT-A.                             NC2404.2
056300     MOVE ENTRY-2 (10, 10) TO COMPUTED-A.                         NC2404.2
056400                                                                  NC2404.2
056500     MOVE "PERFORM VARYING DATA NAMES " TO RE-MARK.               NC2404.2
056600     PERFORM FAIL.                                                NC2404.2
056700 TH2-WRITE-GF-4.                                                  NC2404.2
056800     PERFORM PRINT-DETAIL.                                        NC2404.2
056900     GO TO TH3-INIT-GF-1.                                         NC2404.2
057000*                                                                 NC2404.2
057100 FIND-LEVEL-2-ENTRY.                                              NC2404.2
057200     IF ENTRY-2 (CON-5, CON-6) = SEC-HOLD-AREA                    NC2404.2
057300         MOVE "PASS" TO TEST-CHECK.                               NC2404.2
057400*                                                                 NC2404.2
057500 TH3-INIT-GF-1.                                                   NC2404.2
057600     MOVE "PERFORM VARYING LEV3" TO FEATURE.                      NC2404.2
057700     MOVE "VI-109" TO ANSI-REFERENCE.                             NC2404.2
057800     MOVE SPACES TO TEST-CHECK.                                   NC2404.2
057900     MOVE "TH3-TEST-GF-1      " TO PAR-NAME.                      NC2404.2
058000     MOVE "ELEM (01,02,03)" TO ELEM-HOLD-AREA.                    NC2404.2
058100 TH3-TEST-GF-1.                                                   NC2404.2
058200     PERFORM FIND-LEVEL-3-ENTRY                                   NC2404.2
058300             VARYING CON-5 FROM 1 BY 1 UNTIL CON-5 = 11           NC2404.2
058400             AFTER   CON-6 FROM 1 BY 1 UNTIL CON-6 = 10           NC2404.2
058500             AFTER   CON-7 FROM 1 BY 1 UNTIL CON-7 = 10.          NC2404.2
058600     IF TEST-CHECK = "PASS"                                       NC2404.2
058700         PERFORM PASS                                             NC2404.2
058800         GO TO TH3-WRITE-GF-1                                     NC2404.2
058900     ELSE                                                         NC2404.2
059000         GO TO TH3-FAIL-GF-1.                                     NC2404.2
059100 TH3-DELETE-GF-1.                                                 NC2404.2
059200     PERFORM DE-LETE.                                             NC2404.2
059300     GO TO TH3-WRITE-GF-1.                                        NC2404.2
059400 TH3-FAIL-GF-1.                                                   NC2404.2
059500     MOVE ELEM-HOLD-AREA TO CORRECT-A.                            NC2404.2
059600     MOVE ENTRY-3 (01, 02, 03) TO COMPUTED-A.                     NC2404.2
059700                                                                  NC2404.2
059800     MOVE "PERFORM VARYING DATA NAMES " TO RE-MARK.               NC2404.2
059900     PERFORM FAIL.                                                NC2404.2
060000 TH3-WRITE-GF-1.                                                  NC2404.2
060100     PERFORM PRINT-DETAIL.                                        NC2404.2
060200                                                                  NC2404.2
060300 TH3-INIT-GF-2.                                                   NC2404.2
060400     MOVE "TH3-TEST-GF-2      " TO PAR-NAME.                      NC2404.2
060500     MOVE "VI-109" TO ANSI-REFERENCE.                             NC2404.2
060600     MOVE "ELEM (10,10,10)" TO ELEM-HOLD-AREA.                    NC2404.2
060700     MOVE SPACES TO TEST-CHECK.                                   NC2404.2
060800 TH3-TEST-GF-2.                                                   NC2404.2
060900     PERFORM FIND-LEVEL-3-ENTRY                                   NC2404.2
061000             VARYING CON-5 FROM 1 BY 1 UNTIL CON-5 = 11           NC2404.2
061100             AFTER   CON-6 FROM 1 BY 1 UNTIL CON-6 = 11           NC2404.2
061200             AFTER   CON-7 FROM 1 BY 1 UNTIL CON-7 = 11.          NC2404.2
061300     IF TEST-CHECK = "PASS"                                       NC2404.2
061400         PERFORM PASS                                             NC2404.2
061500         GO TO TH3-WRITE-GF-2                                     NC2404.2
061600     ELSE                                                         NC2404.2
061700         GO TO TH3-FAIL-GF-2.                                     NC2404.2
061800 TH3-DELETE-GF-2.                                                 NC2404.2
061900     PERFORM DE-LETE.                                             NC2404.2
062000     GO TO TH3-WRITE-GF-2.                                        NC2404.2
062100 TH3-FAIL-GF-2.                                                   NC2404.2
062200     MOVE ELEM-HOLD-AREA TO CORRECT-A.                            NC2404.2
062300     MOVE ENTRY-3 (10, 10, 10) TO COMPUTED-A.                     NC2404.2
062400                                                                  NC2404.2
062500     MOVE "PERFORM VARYING DATA NAMES " TO RE-MARK.               NC2404.2
062600     PERFORM FAIL.                                                NC2404.2
062700 TH3-WRITE-GF-2.                                                  NC2404.2
062800     PERFORM PRINT-DETAIL.                                        NC2404.2
062900                                                                  NC2404.2
063000 TH3-INIT-GF-3.                                                   NC2404.2
063100     MOVE "TH3-TEST-GF-3      " TO PAR-NAME.                      NC2404.2
063200     MOVE "VI-109" TO ANSI-REFERENCE.                             NC2404.2
063300     MOVE "ELEM (08,07,06)" TO ELEM-HOLD-AREA.                    NC2404.2
063400     MOVE SPACES TO TEST-CHECK.                                   NC2404.2
063500 TH3-TEST-GF-3.                                                   NC2404.2
063600     PERFORM FIND-LEVEL-3-ENTRY                                   NC2404.2
063700             VARYING CON-5 FROM 1 BY 1 UNTIL CON-5 = 11           NC2404.2
063800             AFTER   CON-6 FROM 1 BY 1 UNTIL CON-6 = 10           NC2404.2
063900             AFTER   CON-7 FROM 1 BY 1 UNTIL CON-7 = 10.          NC2404.2
064000     IF TEST-CHECK = "PASS"                                       NC2404.2
064100         PERFORM PASS                                             NC2404.2
064200         GO TO TH3-WRITE-GF-3                                     NC2404.2
064300     ELSE                                                         NC2404.2
064400         GO TO TH3-FAIL-GF-3.                                     NC2404.2
064500 TH3-DELETE-GF-3.                                                 NC2404.2
064600     PERFORM DE-LETE.                                             NC2404.2
064700     GO TO TH3-WRITE-GF-3.                                        NC2404.2
064800 TH3-FAIL-GF-3.                                                   NC2404.2
064900     MOVE ELEM-HOLD-AREA TO CORRECT-A.                            NC2404.2
065000     MOVE ENTRY-3 (08, 07, 06) TO COMPUTED-A.                     NC2404.2
065100                                                                  NC2404.2
065200     MOVE "PERFORM VARYING DATA NAMES " TO RE-MARK.               NC2404.2
065300     PERFORM FAIL.                                                NC2404.2
065400 TH3-WRITE-GF-3.                                                  NC2404.2
065500     PERFORM PRINT-DETAIL.                                        NC2404.2
065600*                                                                 NC2404.2
065700 TH3-INIT-GF-4.                                                   NC2404.2
065800     MOVE "TH3-TEST-GF-4      " TO PAR-NAME.                      NC2404.2
065900     MOVE "VI-109" TO ANSI-REFERENCE.                             NC2404.2
066000     MOVE SPACES TO TEST-CHECK.                                   NC2404.2
066100     MOVE "ELEM (06,04,08)" TO ELEM-HOLD-AREA.                    NC2404.2
066200 TH3-TEST-GF-4.                                                   NC2404.2
066300     PERFORM FIND-LEVEL-3-ENTRY                                   NC2404.2
066400             VARYING CON-5 FROM 3 BY 3 UNTIL CON-5 = 12           NC2404.2
066500             AFTER   CON-6 FROM 2 BY 2 UNTIL CON-6 = 12           NC2404.2
066600             AFTER   CON-7 FROM 8 BY 8 UNTIL CON-7 = 16.          NC2404.2
066700     IF TEST-CHECK = "PASS"                                       NC2404.2
066800         PERFORM PASS                                             NC2404.2
066900         GO TO TH3-WRITE-GF-4                                     NC2404.2
067000     ELSE                                                         NC2404.2
067100         GO TO TH3-FAIL-GF-4.                                     NC2404.2
067200 TH3-DELETE-GF-4.                                                 NC2404.2
067300     PERFORM DE-LETE.                                             NC2404.2
067400     GO TO TH3-WRITE-GF-4.                                        NC2404.2
067500 TH3-FAIL-GF-4.                                                   NC2404.2
067600     MOVE ELEM-HOLD-AREA TO CORRECT-A.                            NC2404.2
067700     MOVE ENTRY-3 (06, 04, 08) TO COMPUTED-A.                     NC2404.2
067800                                                                  NC2404.2
067900     MOVE "PERFORM VARYING DATA NAMES " TO RE-MARK.               NC2404.2
068000     PERFORM FAIL.                                                NC2404.2
068100 TH3-WRITE-GF-4.                                                  NC2404.2
068200     PERFORM PRINT-DETAIL.                                        NC2404.2
068300     GO TO END-3LEVEL-TEST.                                       NC2404.2
068400                                                                  NC2404.2
068500 FIND-LEVEL-3-ENTRY.                                              NC2404.2
068600     IF ENTRY-3 (CON-5, CON-6, CON-7) = ELEM-HOLD-AREA            NC2404.2
068700         MOVE "PASS" TO TEST-CHECK.                               NC2404.2
068800                                                                  NC2404.2
068900 END-3LEVEL-TEST.                                                 NC2404.2
069000     EXIT.                                                        NC2404.2
069100 CCVS-EXIT SECTION.                                               NC2404.2
069200 CCVS-999999.                                                     NC2404.2
069300     GO TO CLOSE-FILES.                                           NC2404.2