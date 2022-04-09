# All non-ending commands should end with '#' for the self-made parser to understand
USE evilEr;
CREATE PROCEDURE login(IN eml VARCHAR(32), IN pwd VARCHAR(32))
BEGIN
  UPDATE user
  SET last_login = NOW()
  WHERE email = eml
    AND pwd_hash = SHA1(pwd);#
  SELECT uid, name, email, pfp, isAdmin
  FROM user
  WHERE email = eml
    AND pwd_hash = SHA1(pwd);#
END;

CREATE PROCEDURE updateProfile(IN eml VARCHAR(32), IN pwd VARCHAR(32), IN nme VARCHAR(32), IN pp VARCHAR(128))
BEGIN
  UPDATE user
  SET name = nme,
      pfp  = pp
  WHERE email = eml
    AND pwd_hash = SHA1(pwd);#

  SELECT uid, name, email, pfp, isAdmin
  FROM user
  WHERE email = eml
    AND pwd_hash = SHA1(pwd);#
END;

CREATE PROCEDURE updatePassword(IN eml VARCHAR(32), IN pwd VARCHAR(32), IN npwd VARCHAR(32))
BEGIN
  UPDATE user
  SET pwd_hash = SHA1(npwd)
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

CREATE PROCEDURE objects(IN dd VARCHAR(36), IN tpe VARCHAR(36))
BEGIN
  SELECT *
  FROM object
  WHERE did = dd
    AND type = tpe;#
END;

CREATE VIEW vUsers AS
SELECT uid, name, email, pfp, isAdmin
from user;
