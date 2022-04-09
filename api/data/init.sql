DROP DATABASE IF EXISTS evilEr;
CREATE DATABASE evilEr;
USE evilEr;

##### TABLE CREATION #####
CREATE TABLE IF NOT EXISTS `User`
(
  uid        VARCHAR(36) UNIQUE default (uuid()),
  pfp        VARCHAR(128),
  name       VARCHAR(32),
  isAdmin    BOOL,
  email      VARCHAR(32) UNIQUE,
  pwd_hash   CHAR(40),
  last_login DATETIME,
  PRIMARY KEY (uid)
);

CREATE TABLE IF NOT EXISTS MESSAGE
(
  mid      VARCHAR(36),
  text     TEXT,
  datetime DATETIME,
  cid      VARCHAR(36), # from 'Container'; SENT
  uid      VARCHAR(36), # from 'User'; SENT
  PRIMARY KEY (mid, cid, uid)
);

CREATE TABLE IF NOT EXISTS Container
(
  cid  VARCHAR(36) UNIQUE,
  name VARCHAR(32),
  PRIMARY KEY (cid)
);

CREATE TABLE IF NOT EXISTS Diagram
(
  did  VARCHAR(36) UNIQUE,
  name VARCHAR(32),
  isEr BOOL,
  cid  VARCHAR(36), # from 'Container'; FROM
  PRIMARY KEY (did)
);

CREATE TABLE IF NOT EXISTS Admin
(
  retired    BOOL,
  start_time DATETIME,
  uid        VARCHAR(36), # from 'User'; inherits
  PRIMARY KEY (uid)
);

CREATE TABLE IF NOT EXISTS Editor
(
  reputation FLOAT(32),
  uid        VARCHAR(36), # from 'User'; inherits
  PRIMARY KEY (uid)
);

CREATE TABLE IF NOT EXISTS Object
(
  x        FLOAT(16),
  y        FLOAT(16),
  id       VARCHAR(36),
  name     VARCHAR(32),
  type     VARCHAR(16),
  outlined BOOL,
  did      VARCHAR(36), # from 'Diagram'; BELONGS_TO
  PRIMARY KEY (id, did)
);

CREATE TABLE IF NOT EXISTS Attribute
(
  isKey     BOOL,
  isDerived BOOL,
  O1_id     VARCHAR(36), # from 'Object'; ATTR_OF
  O1_did    VARCHAR(36), # from 'Object'; ATTR_OF
  id        VARCHAR(36), # from 'Object'; inherits
  did       VARCHAR(36), # from 'Object'; inherits
  PRIMARY KEY (id, did)
);

CREATE TABLE IF NOT EXISTS Specialization
(
  disjoint BOOL,
  id       VARCHAR(36), # from 'Object'; inherits
  did      VARCHAR(36), # from 'Object'; inherits
  PRIMARY KEY (id, did)
);

CREATE TABLE IF NOT EXISTS `Table`
(
  x    FLOAT(16),
  y    FLOAT(16),
  name VARCHAR(32),
  did  VARCHAR(36), # from 'Diagram'; BELONGS_TO
  PRIMARY KEY (name, did)
);

CREATE TABLE IF NOT EXISTS `Column`
(
  name    VARCHAR(32),
  type    VARCHAR(16),
  param   VARCHAR(16),
  isKey   BOOL,
  notNull BOOL,
  T1_name VARCHAR(32), # from 'Table'; COLUMN_OF
  T1_did  VARCHAR(36), # from 'Table'; COLUMN_OF
  PRIMARY KEY (name, T1_name, T1_did)
);

CREATE TABLE IF NOT EXISTS CAN_EDIT
(
  start_time DATETIME,
  cid        VARCHAR(36), # from 'Container'; Container
  E1_uid     VARCHAR(36), # from 'Editor'; Editor
  PRIMARY KEY (cid, E1_uid)
);

CREATE TABLE IF NOT EXISTS CAN_VIEW
(
  start_time DATETIME,
  cid        VARCHAR(36), # from 'Container'; Container
  uid        VARCHAR(36), # from 'User'; User
  PRIMARY KEY (cid, uid)
);

CREATE TABLE IF NOT EXISTS RELATES
(
  role        VARCHAR(32),
  total       BOOL,
  cardinality VARCHAR(8),
  O1_id       VARCHAR(36), # from 'Object'; Object
  O1_did      VARCHAR(36), # from 'Object'; Object
  O2_id       VARCHAR(36), # from 'Object'; Object
  O2_did      VARCHAR(36), # from 'Object'; Object
  PRIMARY KEY (O1_id, O1_did, O2_id, O2_did, role)
);

CREATE TABLE IF NOT EXISTS LAST_EDITED_BY
(
  datetime DATETIME,
  did      VARCHAR(36), # from 'Diagram'; Diagram
  uid      VARCHAR(36), # from 'User'; User
  PRIMARY KEY (did, uid)
);

CREATE TABLE IF NOT EXISTS CREATED_BY
(
  datetime DATETIME,
  cid      VARCHAR(36), # from 'Container'; Container
  uid      VARCHAR(36), # from 'User'; User
  PRIMARY KEY (cid, uid)
);

CREATE TABLE IF NOT EXISTS `FOREIGN`
(
  role     VARCHAR(32),
  required BOOL,
  T1_name  VARCHAR(32), # from 'Table'; references
  T1_did   VARCHAR(36), # from 'Table'; references
  T2_name  VARCHAR(32), # from 'Table'; by
  T2_did   VARCHAR(36), # from 'Table'; by
  PRIMARY KEY (T1_name, T1_did, T2_name, T2_did)
);

CREATE TABLE IF NOT EXISTS LAST_VIEW
(
  datetime DATETIME,
  did      VARCHAR(36), # from 'Diagram'; Diagram
  uid      VARCHAR(36), # from 'User'; User
  PRIMARY KEY (did, uid)
);

##### TABLE ALTER #####


ALTER TABLE MESSAGE
  ADD FOREIGN KEY (cid) REFERENCES Container (cid),
  ADD FOREIGN KEY (uid) REFERENCES `User` (uid);



ALTER TABLE Diagram
  ADD FOREIGN KEY (cid) REFERENCES Container (cid);

ALTER TABLE Admin
  ADD FOREIGN KEY (uid) REFERENCES `User` (uid);

ALTER TABLE Editor
  ADD FOREIGN KEY (uid) REFERENCES `User` (uid);

ALTER TABLE Object
  ADD FOREIGN KEY (did) REFERENCES Diagram (did);

ALTER TABLE Attribute
  ADD FOREIGN KEY (O1_id, O1_did) REFERENCES Object (id, did),
  ADD FOREIGN KEY (id, did) REFERENCES Object (id, did);

ALTER TABLE Specialization
  ADD FOREIGN KEY (id, did) REFERENCES Object (id, did);

ALTER TABLE `Table`
  ADD FOREIGN KEY (did) REFERENCES Diagram (did);

ALTER TABLE `Column`
  ADD FOREIGN KEY (T1_name, T1_did) REFERENCES `Table` (name, did);

ALTER TABLE CAN_EDIT
  ADD FOREIGN KEY (cid) REFERENCES Container (cid),
  ADD FOREIGN KEY (E1_uid) REFERENCES Editor (uid);

ALTER TABLE CAN_VIEW
  ADD FOREIGN KEY (cid) REFERENCES Container (cid),
  ADD FOREIGN KEY (uid) REFERENCES `User` (uid);

ALTER TABLE RELATES
  ADD FOREIGN KEY (O1_id, O1_did) REFERENCES Object (id, did),
  ADD FOREIGN KEY (O2_id, O2_did) REFERENCES Object (id, did);

ALTER TABLE LAST_EDITED_BY
  ADD FOREIGN KEY (did) REFERENCES Diagram (did),
  ADD FOREIGN KEY (uid) REFERENCES `User` (uid);

ALTER TABLE CREATED_BY
  ADD FOREIGN KEY (cid) REFERENCES Container (cid),
  ADD FOREIGN KEY (uid) REFERENCES `User` (uid);

ALTER TABLE `FOREIGN`
  ADD FOREIGN KEY (T1_name, T1_did) REFERENCES `Table` (name, did),
  ADD FOREIGN KEY (T2_name, T2_did) REFERENCES `Table` (name, did);

ALTER TABLE LAST_VIEW
  ADD FOREIGN KEY (did) REFERENCES Diagram (did),
  ADD FOREIGN KEY (uid) REFERENCES `User` (uid);
