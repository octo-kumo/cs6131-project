CREATE DATABASE IF NOT EXISTS evilEr;
USE evilEr;

##### TABLE CREATION #####
CREATE TABLE IF NOT EXISTS ER_Diagram
(
  numEntites INTEGER,
  did        VARCHAR(16), # from 'Diagram'; inherits
  PRIMARY KEY (did)
);

CREATE TABLE IF NOT EXISTS `User`
(
  uid            CHAR(36),
  pfp            VARCHAR(100),
  name           VARCHAR(32),
  type           VARCHAR(16),
  email          VARCHAR(32),
  pwd_hash       CHAR(40),
  last_login     DATETIME,
  last_view_time DATETIME,
  C1_cid         VARCHAR(16), # from 'Container'; LAST_VIEW
  PRIMARY KEY (uid)
);

CREATE TABLE IF NOT EXISTS MESSAGE
(
  mid       INTEGER,
  content   TEXT(128),
  sent_time DATETIME,
  C1_cid    VARCHAR(16), # from 'Container'; SENT
  U1_uid    CHAR(36),    # from 'User'; SENT
  PRIMARY KEY (mid, C1_cid, U1_uid)
);

CREATE TABLE IF NOT EXISTS Container
(
  cid  VARCHAR(16),
  name VARCHAR(16),
  PRIMARY KEY (cid)
);

CREATE TABLE IF NOT EXISTS Diagram
(
  did    VARCHAR(16),
  name   VARCHAR(16),
  type   VARCHAR(16),
  C1_cid VARCHAR(16), # from 'Container'; FROM
  PRIMARY KEY (did)
);

CREATE TABLE IF NOT EXISTS `Schema`
(
  numTables INTEGER,
  did       VARCHAR(16), # from 'Diagram'; inherits
  PRIMARY KEY (did)
);

CREATE TABLE IF NOT EXISTS Admin
(
  retired    BOOL,
  start_time DATETIME,
  uid        CHAR(36), # from 'User'; inherits
  PRIMARY KEY (uid)
);

CREATE TABLE IF NOT EXISTS Editor
(
  reputation FLOAT(16),
  uid        CHAR(36), # from 'User'; inherits
  PRIMARY KEY (uid)
);

CREATE TABLE IF NOT EXISTS Object
(
  x           FLOAT(32),
  y           FLOAT(32),
  oid         VARCHAR(16),
  role        VARCHAR(16),
  name        VARCHAR(16),
  type        VARCHAR(16),
  total       BOOL,
  outlined    BOOL,
  cardinality VARCHAR(16),
  E1_did      VARCHAR(16), # from 'ER Diagram'; BELONGS_TO
  O1_oid      VARCHAR(16), # from 'Object'; RELATES
  O1_did      VARCHAR(16), # from 'Object'; RELATES
  PRIMARY KEY (oid, E1_did)
);

CREATE TABLE IF NOT EXISTS Attribute
(
  isKey     BOOL,
  dataType  VARCHAR(16),
  dataSize  INTEGER,
  isDerived BOOL,
  O1_oid    VARCHAR(16), # from 'Object'; ATTR_OF
  O1_did    VARCHAR(16), # from 'Object'; ATTR_OF
  oid       VARCHAR(16), # from 'Object'; inherits
  did       VARCHAR(16), # from 'Object'; inherits
  PRIMARY KEY (oid, did)
);

CREATE TABLE IF NOT EXISTS Specialization
(
  disjoint BOOL,
  oid      VARCHAR(16), # from 'Object'; inherits
  did      VARCHAR(16), # from 'Object'; inherits
  PRIMARY KEY (oid, did)
);

CREATE TABLE IF NOT EXISTS `Table`
(
  x      FLOAT(32),
  y      FLOAT(32),
  name   VARCHAR(16),
  S1_did VARCHAR(16), # from 'Schema'; BELONGS_TO
  PRIMARY KEY (name, S1_did)
);

CREATE TABLE IF NOT EXISTS `Column`
(
  name    VARCHAR(16),
  type    VARCHAR(16),
  param   VARCHAR(16),
  isKey   BOOL,
  notNull BOOL,
  T1_name VARCHAR(16), # from 'Table'; COLUMN_OF
  T1_did  VARCHAR(16), # from 'Table'; COLUMN_OF
  PRIMARY KEY (name, T1_name, T1_did)
);

CREATE TABLE IF NOT EXISTS CAN_EDIT
(
  start_time DATETIME,
  C1_cid     VARCHAR(16), # from 'Container'; Container
  E1_uid     CHAR(36),    # from 'Editor'; Editor
  PRIMARY KEY (C1_cid, E1_uid)
);

CREATE TABLE IF NOT EXISTS CAN_VIEW
(
  start_time DATETIME,
  C1_cid     VARCHAR(16), # from 'Container'; Container
  U1_uid     CHAR(36),    # from 'User'; User
  PRIMARY KEY (C1_cid, U1_uid)
);

CREATE TABLE IF NOT EXISTS LAST_EDITED_BY
(
  datetime DATETIME,
  D1_did   VARCHAR(16), # from 'Diagram'; Diagram
  U1_uid   CHAR(36),    # from 'User'; User
  PRIMARY KEY (D1_did, U1_uid)
);

CREATE TABLE IF NOT EXISTS CREATED_BY
(
  on_time DATETIME,
  C1_cid  VARCHAR(16), # from 'Container'; Container
  U1_uid  CHAR(36),    # from 'User'; User
  PRIMARY KEY (C1_cid, U1_uid)
);

CREATE TABLE IF NOT EXISTS `FOREIGN`
(
  role     VARCHAR(32),
  prefix   VARCHAR(16),
  required BOOL,
  T1_name  VARCHAR(16), # from 'Table'; references
  T1_did   VARCHAR(16), # from 'Table'; references
  T2_name  VARCHAR(16), # from 'Table'; by
  T2_did   VARCHAR(16), # from 'Table'; by
  PRIMARY KEY (T1_name, T1_did, T2_name, T2_did)
);

##### TABLE ALTER #####
ALTER TABLE ER_Diagram
  ADD FOREIGN KEY (did) REFERENCES Diagram (did);

ALTER TABLE `User`
  ADD FOREIGN KEY (C1_cid) REFERENCES Container (cid);

ALTER TABLE MESSAGE
  ADD FOREIGN KEY (C1_cid) REFERENCES Container (cid),
  ADD FOREIGN KEY (U1_uid) REFERENCES `User` (uid);



ALTER TABLE Diagram
  ADD FOREIGN KEY (C1_cid) REFERENCES Container (cid);

ALTER TABLE `Schema`
  ADD FOREIGN KEY (did) REFERENCES Diagram (did);

ALTER TABLE Admin
  ADD FOREIGN KEY (uid) REFERENCES `User` (uid);

ALTER TABLE Editor
  ADD FOREIGN KEY (uid) REFERENCES `User` (uid);

ALTER TABLE Object
  ADD FOREIGN KEY (E1_did) REFERENCES ER_Diagram (did),
  ADD FOREIGN KEY (O1_oid, O1_did) REFERENCES Object (oid, E1_did);

ALTER TABLE Attribute
  ADD FOREIGN KEY (O1_oid, O1_did) REFERENCES Object (oid, E1_did),
  ADD FOREIGN KEY (oid, did) REFERENCES Object (oid, E1_did);

ALTER TABLE Specialization
  ADD FOREIGN KEY (oid, did) REFERENCES Object (oid, E1_did);

ALTER TABLE `Table`
  ADD FOREIGN KEY (S1_did) REFERENCES `Schema` (did);

ALTER TABLE `Column`
  ADD FOREIGN KEY (T1_name, T1_did) REFERENCES `Table` (name, S1_did);

ALTER TABLE CAN_EDIT
  ADD FOREIGN KEY (C1_cid) REFERENCES Container (cid),
  ADD FOREIGN KEY (E1_uid) REFERENCES Editor (uid);

ALTER TABLE CAN_VIEW
  ADD FOREIGN KEY (C1_cid) REFERENCES Container (cid),
  ADD FOREIGN KEY (U1_uid) REFERENCES `User` (uid);

ALTER TABLE LAST_EDITED_BY
  ADD FOREIGN KEY (D1_did) REFERENCES Diagram (did),
  ADD FOREIGN KEY (U1_uid) REFERENCES `User` (uid);

ALTER TABLE CREATED_BY
  ADD FOREIGN KEY (C1_cid) REFERENCES Container (cid),
  ADD FOREIGN KEY (U1_uid) REFERENCES `User` (uid);

ALTER TABLE `FOREIGN`
  ADD FOREIGN KEY (T1_name, T1_did) REFERENCES `Table` (name, S1_did),
  ADD FOREIGN KEY (T2_name, T2_did) REFERENCES `Table` (name, S1_did);
