000000 IDENTIFICATION DIVISION.
       PROGRAM-ID.
           EXEC_SQL_DELETE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 FILLER PIC X(10) VALUE 'PGM WORKING-STORAGE: EXEC_SQL_DELETE'.
       01 DCL_EXEC_SQL_DELETE_VAR PIC X(3).

      * Include SQL table from another COBOL source.
      * These SQL tables are created through copybooks.
       EXEC SQL INCLUDE SQL_TBL END-EXEC.

       EXEC SQL
           DELETE FROM SQL_TBL
           WHERE NUM_1 = :DCL_EXEC_SQL_DELETE_VAR
       END-EXEC.
