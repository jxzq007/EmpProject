DROP TABLE member PURGE;
CREATE TABLE member (
	mid				VARCHAR2(50),
	password 		VARCHAR2(32),
	CONSTRAINT pk_mid PRIMARY KEY(mid)
);
INSERT INTO member(mid,password) VALUES('zhangqing','56B0FBC82E5050909A1FBD10DE711DBD');
COMMIT;