# All non-ending commands should end with '#' for the self-made parser to understand
USE evilEr;
CREATE PROCEDURE login(IN eml VARCHAR(32), IN pwd VARCHAR(32))
BEGIN
  SELECT *
  FROM user
  WHERE email = eml
    AND pwd_hash = SHA1(pwd);#
END;

CREATE PROCEDURE register(IN nme VARCHAR(32), IN eml VARCHAR(32), IN password VARCHAR(32))
BEGIN
  INSERT INTO user (name, email, pwd_hash)
  VALUES (nme, eml, SHA1(password));#
END;

CREATE PROCEDURE addEntity(IN id CHAR(36), IN nme VARCHAR(32), IN eml VARCHAR(32), IN password VARCHAR(32))
BEGIN
  INSERT INTO user (uid, name, email, pwd_hash)
  VALUES (id, nme, eml, SHA1(password));#
END;

CREATE VIEW vUsers AS
SELECT uid, name, email, pfp, type
from user;
