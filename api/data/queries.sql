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

CREATE PROCEDURE createContainer(IN id CHAR(36), IN name CHAR(32), IN uid CHAR(36))
BEGIN
  INSERT INTO container (cid, name) VALUES (id, name);#
  INSERT INTO editor (created, uid) VALUES (1, uid) ON DUPLICATE KEY UPDATE created=created + 1;#
  INSERT INTO created_by (datetime, cid, uid) VALUES (now(), id, uid) ON DUPLICATE KEY UPDATE datetime=now();#
  INSERT INTO can_edit (start_time, cid, uid) VALUES (now(), id, uid) ON DUPLICATE KEY UPDATE start_time=now();#
  INSERT INTO can_view (start_time, cid, uid) VALUES (now(), id, uid) ON DUPLICATE KEY UPDATE start_time=now();#
END;

CREATE PROCEDURE createDiagram(IN cid CHAR(36), IN id CHAR(36), IN name CHAR(32), IN type BOOL, IN uid CHAR(36))
BEGIN
  INSERT INTO diagram (did, name, isEr, cid) VALUES (id, name, type, cid);#
  INSERT INTO editor (created, uid) VALUES (1, uid) ON DUPLICATE KEY UPDATE created=created + 1;#
  INSERT INTO last_edited_by (datetime, did, uid) VALUES (now(), id, uid);#
  INSERT INTO last_view (datetime, did, uid) VALUES (now(), id, uid);#
END;

CREATE PROCEDURE addEntity(IN id CHAR(36), IN nme VARCHAR(32), IN eml VARCHAR(32), IN password VARCHAR(32))
BEGIN
  INSERT INTO user (uid, name, email, pwd_hash)
  VALUES (id, nme, eml, SHA1(password));#
END;

CREATE PROCEDURE sendMessage(IN ud VARCHAR(36), IN cd VARCHAR(36), IN msg text)
BEGIN
  SET @md = uuid();#
  INSERT INTO message (mid, text, datetime, cid, uid)
  VALUES (@md, msg, now(), cd, ud);#
  SELECT *
  FROM message
         NATURAL LEFT JOIN user u
  WHERE mid = @md
    AND cid = cd;#
END;

CREATE PROCEDURE objects(IN dd VARCHAR(36), IN tpe VARCHAR(36))
BEGIN
  SELECT *
  FROM object
  WHERE did = dd
    AND type = tpe;#
END;

CREATE VIEW vUsers AS
SELECT uid, name, email, pfp, isAdmin, messages_sent
from user;
