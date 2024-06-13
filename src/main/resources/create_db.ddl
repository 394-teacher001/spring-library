-- postgresデータベースに接続
\c postgres
-- 既存のデータベースを破棄
DROP DATABASE IF EXISTS db_library;
-- 既存のユーザを破棄
DROP ROLE IF EXISTS usr_library;
CREATE ROLE usr_library WITH PASSWORD 'himitu' LOGIN;
CREATE DATABASE db_library OWNER usr_library ENCODING 'UTF8';