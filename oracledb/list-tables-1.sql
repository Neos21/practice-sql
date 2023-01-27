SELECT
    TABLE_NAME,
    TO_NUMBER(
      EXTRACTVALUE(
        XMLTYPE(
          DBMS_XMLGEN.GETXML(
            'SELECT COUNT(*) C FROM ' || TABLE_NAME
          )
        )
        , '/ROWSET/ROW/C'
      )
    ) CNT
FROM
    USER_TABLES
WHERE
    TABLE_NAME NOT LIKE 'BIN$%'
ORDER BY
    TABLE_NAME;
