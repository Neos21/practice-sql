Set echo off
Set feedback off
Set heading off
Set lines 32767
Set pages 50000
Set newpage none
Set trimspool on
Spool C:\TableList.csv
SELECT 'NO, TABLE_NAME, COUNT, UPDATED_AT' FROM DUAL;
SELECT
    ROWNUM       || ',' ||
    TABLE_NAME   || ',' ||
    COUNT        || ',' ||
    UPDATED_AT
FROM
    (
        SELECT
            TABLE_NAME,
            TO_NUMBER(
              EXTRACTVALUE(
                XMLTYPE(
                  DBMS_XMLGEN.GETXML('SELECT COUNT(*) C FROM ' || TABLE_NAME)
                ),
                '/ROWSET/ROW/C'
              )
            ) COUNT,
            EXTRACTVALUE(
              XMLTYPE(
                DBMS_XMLGEN.GETXML('SELECT DECODE(MAX(updated_at), NULL, ''-'', TO_CHAR(MAX(updated_at), ''YYYY-MM-DD HH24:MI:SS'')) U FROM ' || TABLE_NAME)
              ),
              '/ROWSET/ROW/U'
            ) UPDATED_AT
        FROM
            USER_TABLES
        ORDER BY
            TABLE_NAME
    );
Spool Off
