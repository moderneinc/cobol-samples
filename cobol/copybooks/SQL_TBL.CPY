000000* Declare SQL table
       EXEC SQL DECLARE SQL_TBL TABLE
       ( NUM_1                  CHAR(3) NOT NULL,
         NUM_2                  CHAR(3) NOT NULL
       ) END-EXEC.

      * Declare local variables in copied source.
       01 DCL_SQL_TBL_NUM_1     PIC X(3).
       01 DCL_SQL_TBL_NUM_2     PIC X(3).

      * SQL SELECT from SQL_TBL
       EXEC SQL
           SELECT NUM_1
           INTO :DCL_SQL_TBL_NUM_1
           FROM SQL_TBL
       END-EXEC.

      * SQL UPDATE
       EXEC SQL
          UPDATE SQL_TBL
          SET NUM_2 = :DCL_SQL_TBL_NUM_1
       END-EXEC.

      * SQL INSERT
       EXEC SQL
           INSERT INTO SQL_TBL
                  (NUM_1,
                   NUM_2)
           VALUES (:DCL_SQL_TBL_NUM_1
                   :DCL_SQL_TBL_NUM_2)
       END-EXEC.

      * SQL DELETE
       EXEC SQL
           DELETE FROM SQL_TBL
           WHERE NUM_1 = :DCL_SQL_TBL_NUM_1
       END-EXEC.

      * Create cursor for SQL_TBL
       EXEC SQL
           DECLARE CURSOR_FROM_SQL_TBL CURSOR FOR
           SELECT NUM_1,
                  NUM_2
           FROM SQL_TBL
           FOR FETCH ONLY
       END-EXEC.

      * SQL SELECT from CURSOR_FROM_SQL_TBL
       EXEC SQL
           SELECT NUM_1
           INTO :DCL_SQL_TBL_NUM_1
           FROM CURSOR_FROM_SQL_TBL
       END-EXEC.