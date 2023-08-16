000000 IDENTIFICATION DIVISION.
       PROGRAM-ID.
           EXEC_SQL_CREATE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 FILLER PIC X(10) VALUE 'PGM WORKING-STORAGE: EXEC_SQL_PROD_2'.

      * Create SQL table in the COBOL source.
      *    EXEC SQL statement to declare a table
           EXEC SQL DECLARE EXEC_SQL_CREATE_TBL TABLE
           ( NUM_1                  CHAR(3) NOT NULL,
             NUM_2                  CHAR(3) NOT NULL
           ) END-EXEC.

      * Create cursors for tables
      * Cursor for table 1
       EXEC SQL
           DECLARE EXEC_SQL_CREATE_CURSOR CURSOR FOR
           SELECT NUM_1,
                  NUM_2
           FROM EXEC_SQL_CREATE_TBL
           FOR FETCH ONLY
       END-EXEC.

      * Include SQL table from another COBOL source.
      * These SQL tables are created through copybooks.
       EXEC SQL INCLUDE SQL_TBL END-EXEC.
