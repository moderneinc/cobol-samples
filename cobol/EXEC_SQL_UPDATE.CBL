000000 IDENTIFICATION DIVISION.
       PROGRAM-ID.
           EXEC_SQL_UPDATE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 FILLER PIC X(10) VALUE 'PGM WORKING-STORAGE: EXEC_SQL_UPDATE'.
       01 DCL_EXEC_SQL_UPDATE_NUM_1 PIC X(3).
       01 DCL_EXEC_SQL_UPDATE_NUM_2 PIC X(3).

      * Include SQL table from another COBOL source.
      * These SQL tables are created through copybooks.
       EXEC SQL INCLUDE SQL_TBL END-EXEC.

       EXEC SQL
           UPDATE SQL_TBL
           SET NUM_1 = :DCL_EXEC_SQL_UPDATE_NUM_1
       END-EXEC.

       EXEC SQL
           INSERT INTO SQL_TBL
                  (NUM_1,
                   NUM_2)
           VALUES (:DCL_EXEC_SQL_UPDATE_NUM_1
                   :DCL_EXEC_SQL_UPDATE_NUM_2)
       END-EXEC.
