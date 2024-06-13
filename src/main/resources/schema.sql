DROP TABLE IF EXISTS loans;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS book_ledger;
DROP TABLE IF EXISTS status;
DROP TABLE IF EXISTS bibliographic_catalogue;

/**********************************/
/* テーブル名: 書誌情報目録 */
/**********************************/
CREATE TABLE bibliographic_catalogue(
		id           SERIAL,
		title        VARCHAR(255) NOT NULL,
		isbn         INTEGER,
		author       VARCHAR(255) NOT NULL,
		price        INTEGER      NOT NULL,
		purchased_on DATE         NOT NULL DEFAULT current_date
);

/**********************************/
/* テーブル名: 状態マスタ */
/**********************************/
CREATE TABLE status(
		code SERIAL,
		name VARCHAR(10) NOT NULL
);

/**********************************/
/* テーブル名: 資料管理台帳 */
/**********************************/
CREATE TABLE book_ledger(
		id            SERIAL,
		call_number   VARCHAR(7) NOT NULL,
		biblio_number INTEGER    NOT NULL,
		status        INTEGER    NOT NULL,
		purchase_on   DATE       NOT NULL,
		displosal_on  DATE,
		code          INTEGER
);

/**********************************/
/* テーブル名: 権限 */
/**********************************/
CREATE TABLE role(
		code SERIAL,
		name VARCHAR(10) NOT NULL
);

/**********************************/
/* テーブル名: 利用者 */
/**********************************/
CREATE TABLE users(
		id SERIAL,
		patron_number VARCHAR(10)   NOT NULL,
		name          VARCHAR(255)  NOT NULL,
		phone         CHARACTER(18) NOT NULL,
		email         VARCHAR(255)  NOT NULL,
		birthday      DATE,
		role          INTEGER       NOT NULL,
		signup_on     DATE          NOT NULL DEFAULT current_date,
		canceled_on   DATE,
		code          INTEGER
);

/**********************************/
/* テーブル名: 貸出 */
/**********************************/
CREATE TABLE loans(
		id               SERIAL,
		call_number      INTEGER NOT NULL,
		patron_number    INTEGER NOT NULL,
		status           INTEGER NOT NULL,
		issue_date       DATE    NOT NULL DEFAULT current_date,
		due_date         INTEGER NOT NULL
);


ALTER TABLE bibliographic_catalogue ADD CONSTRAINT IDX_bibliographic_catalogue_PK PRIMARY KEY (id);

ALTER TABLE status ADD CONSTRAINT IDX_status_PK PRIMARY KEY (code);

ALTER TABLE book_ledger ADD CONSTRAINT IDX_book_ledger_PK PRIMARY KEY (id);
ALTER TABLE book_ledger ADD CONSTRAINT IDX_book_ledger_FK0 FOREIGN KEY (code) REFERENCES status (code);
ALTER TABLE book_ledger ADD CONSTRAINT IDX_book_ledger_FK1 FOREIGN KEY (biblio_number) REFERENCES bibliographic_catalogue (id);
ALTER TABLE book_ledger ADD CONSTRAINT IDX_book_ledger_UQ UNIQUE (call_number);

ALTER TABLE role ADD CONSTRAINT IDX_role_PK PRIMARY KEY (code);

ALTER TABLE users ADD CONSTRAINT IDX_users_PK PRIMARY KEY (id);
ALTER TABLE users ADD CONSTRAINT IDX_users_FK FOREIGN KEY (code) REFERENCES role (code);
ALTER TABLE users ADD CONSTRAINT IDX_users_UQ UNIQUE (patron_number);

ALTER TABLE loans ADD CONSTRAINT IDX_loans_PK PRIMARY KEY (id);

