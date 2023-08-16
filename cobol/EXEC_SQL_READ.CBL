000000 IDENTIFICATION DIVISION.
       PROGRAM-ID.
           EXEC_SQL_READ.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 FILLER PIC X(10) VALUE 'PGM WORKING-STORAGE: EXEC_SQL_PROD_2'.
       01 DCL_EXEC_SQL_READ_VAR PIC X(3).

      * Create SQL table in the COBOL source.
      *    EXEC SQL statement to declare a table
           EXEC SQL DECLARE EXEC_SQL_READ_TBL TABLE
           ( NUM_1                  CHAR(3) NOT NULL,
             NUM_2                  CHAR(3) NOT NULL
           ) END-EXEC.

      * Include SQL table from another COBOL source.
      * These SQL tables are created through copybooks.
       EXEC SQL INCLUDE SQL_TBL END-EXEC.

       EXEC SQL
           SELECT COUNT(*)
           INTO :DCL_EXEC_SQL_READ_VAR
           FROM SQL_TBL
           WHERE EXISTS (
               SELECT *
               FROM EXEC_SQL_READ_TBL
           )
       END-EXEC.
