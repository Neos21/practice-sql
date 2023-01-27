-- Sleep 処理を実行するには以下の権限を付与しておく
SYS/SYSDBA@my_oracle AS SYSDBA
GRANT EXECUTE ON DBMS_LOCK TO my_db;

-- Sleep 処理のサンプル
SET TIMING ON
SELECT * FROM my_table FOR UPDATE;
-- 5秒停止 : Sleep (Wait) 処理
EXECUTE DBMS_LOCK.SLEEP(5);
COMMIT;

-- SQL*Plus で2500文字以上のデータを INSERT したりする際の分割方法
INSERT INTO long_str_table ( too_long_byte ) VALUES ('hogehoge...' ||  /* この行が2500文字以内に収まるようにする */
'fugafuga...');                                                        /* 「||」で文字列結合し4000文字入れるなど */
