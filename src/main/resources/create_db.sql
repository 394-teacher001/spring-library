-- postgresデータベースに接続
\c postgres
-- 既存のデータベースを破棄
DROP DATABASE IF EXISTS librarydb;
-- 既存のユーザを破棄
DROP ROLE IF EXISTS libraryuser;
CREATE ROLE libraryuser WITH PASSWORD 'himitu' LOGIN;
CREATE DATABASE librarydb OWNER libraryuser ENCODING 'UTF8';