000000 IDENTIFICATION DIVISION.
       PROGRAM-ID.
           EXEC_SQL_READ.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 FILLER PIC X(10) VALUE 'PGM WORKING-STORAGE: EXEC_SQL_READ'.
       01 DCL_EXEC_SQL_READ_VAR PIC X(3).

      * Create SQL table in the COBOL source.
           EXEC SQL DECLARE EXEC_SQL_READ_TBL TABLE
           ( NUM_1                  CHAR(3) NOT NULL,
             NUM_2                  CHAR(3) NOT NULL
           ) END-EXEC.

      * Include SQL table from another COBOL source.
      * These SQL tables are created through copybooks.
       EXEC SQL INCLUDE SQL_TBL END-EXEC.

      * Read from included table AND the declared table.
       EXEC SQL
           SELECT COUNT(*)
           INTO :DCL_EXEC_SQL_READ_VAR
           FROM SQL_TBL
           WHERE EXISTS (
               SELECT *
               FROM EXEC_SQL_READ_TBL
           )
       END-EXEC.

      * Create cursor for declared table
       EXEC SQL
           DECLARE EXEC_SQL_READ_DECLARED_TABLE_CURSOR CURSOR FOR
           SELECT NUM_1,
                  NUM_2
           FROM EXEC_SQL_READ_TBL
           FOR FETCH ONLY
       END-EXEC.

      * Create cursor included table
       EXEC SQL
           DECLARE EXEC_SQL_READ_INCLUDED_TABLE_CURSOR CURSOR FOR
           SELECT NUM_1,
                  NUM_2
           FROM SQL_TBL
           FOR FETCH ONLY
       END-EXEC.

      * Read from cursors for included table AND the declared table.
       EXEC SQL
           SELECT COUNT(*)
           INTO :DCL_EXEC_SQL_READ_VAR
           FROM EXEC_SQL_READ_INCLUDED_TABLE_CURSOR
           WHERE EXISTS (
               SELECT *
               FROM EXEC_SQL_READ_DECLARED_TABLE_CURSOR
           )
       END-EXEC.