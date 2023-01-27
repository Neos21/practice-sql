-- データベース一覧
SHOW databases;

-- スキーマ切替
USE my_schema;
-- スキーマ確認
SELECT database();

-- 全 DB の全テーブルと件数確認
SELECT table_schema, table_name, table_rows FROM information_schema.tables;
-- 一つの DB スキーマ内の全テーブルと件数を一覧表示する
SELECT table_name, table_rows FROM information_schema.tables WHERE table_schema = '【スキーマ名】';
-- 現在のスキーマのテーブル一覧
SHOW tables;

-- CREATE TABLE 文確認
SHOW create table 【テーブル名】;

-- MySQL のバージョン確認
SELECT version();

-- 接続ユーザ確認
SELECT user(), current_user(), session_user(), system_user();
-- 現在の同時接続数確認
SHOW status LIKE 'Threads_connected';

-- 文字コード確認
STATUS
SHOW variables LIKE 'chara%';
-- DB 内の全テーブルの文字コード確認
SHOW TABLE STATUS FROM 【DB 名】;
-- コンソールの文字コード変更
CHARSET utf8mb4;

-- 既存 DB スキーマ内で、今後新たに作るテーブルのデフォルトエンコーディングを変更する
ALTER DATABASE 【DB 名】 CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
-- もしくは以下
SET character_set_database=utf8mb4;

-- 既存テーブルのデフォルトエンコーディングを変更する (カラムの文字コードは変わらない)
ALTER TABLE 【テーブル名】 DEFAULT CHARACTER SET utf8mb4;

-- 既存テーブルの全カラムのエンコーディングを変更する
ALTER TABLE 【テーブル名】 CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- 既存テーブルの指定カラムのエンコーディングを変更する
ALTER TABLE 【テーブル名】 MODIFY 【カラム名】 【型】 CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
-- 例 : ALTER TABLE my_table MODIFY my_column varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- その他、サーバやクライアント設定なども全て utf8mb4 に変更する
SET character_set_database=utf8mb4;
SET character_set_server=utf8mb4;
SET character_set_client=utf8mb4;
SET character_set_connection=utf8mb4;

-- ユーザ一覧
SELECT host, user FROM mysql.user;
-- 現在ユーザの権限確認
SHOW grants;
-- 他ユーザの権限確認
SHOW grants FOR 'my_user'@'localhost';
-- ユーザごとの権限確認 SQL を生成
SELECT CONCAT("SHOW grants FOR '", user, "'@'", host, "';") FROM mysql.user ORDER BY host, user;

-- 現在時刻
SELECT now();
-- タイムゾーン
SHOW variables LIKE '%time_zone%';
