DROP DATABASE IF EXISTS evilEr;
CREATE DATABASE evilEr;
USE evilEr;

##### TABLE CREATION #####
CREATE TABLE IF NOT EXISTS `User`
(
  uid              VARCHAR(36)  UNIQUE,
  pfp              VARCHAR(128),
  name             VARCHAR(32),
  type             VARCHAR(16),
  email            VARCHAR(32)  UNIQUE,
  pwd_hash         CHAR(40),
  last_login       DATETIME,
  PRIMARY KEY (uid)
);

CREATE TABLE IF NOT EXISTS MESSAGE
(
  mid              VARCHAR(36),
  text             TEXT,
  datetime         DATETIME,
  C1_cid           VARCHAR(36)  UNIQUE, # from 'Container'; SENT
  U1_uid           VARCHAR(36)  UNIQUE, # from 'User'; SENT
  PRIMARY KEY (mid, C1_cid, U1_uid)
);

CREATE TABLE IF NOT EXISTS Container
(
  cid              VARCHAR(36)  UNIQUE,
  name             VARCHAR(32),
  PRIMARY KEY (cid)
);

CREATE TABLE IF NOT EXISTS Diagram
(
  did              VARCHAR(36)  UNIQUE,
  name             VARCHAR(32),
  type             VARCHAR(16),
  C1_cid           VARCHAR(36)  UNIQUE, # from 'Container'; FROM
  PRIMARY KEY (did)
);

CREATE TABLE IF NOT EXISTS Admin
(
  retired          BOOL,
  start_time       DATETIME,
  uid              VARCHAR(36)  UNIQUE, # from 'User'; inherits
  PRIMARY KEY (uid)
);

CREATE TABLE IF NOT EXISTS Editor
(
  reputation       FLOAT(32),
  uid              VARCHAR(36)  UNIQUE, # from 'User'; inherits
  PRIMARY KEY (uid)
);

CREATE TABLE IF NOT EXISTS Object
(
  x                FLOAT(16),
  y                FLOAT(16),
  id               VARCHAR(36),
  role             VARCHAR(32),
  name             VARCHAR(32),
  type             VARCHAR(16),
  total            BOOL,
  outlined         BOOL,
  cardinality      VARCHAR(8),
  D1_did           VARCHAR(36)  UNIQUE, # from 'Diagram'; BELONGS_TO
  O1_id            VARCHAR(36), # from 'Object'; RELATES
  O1_did           VARCHAR(36)  UNIQUE, # from 'Object'; RELATES
  PRIMARY KEY (id, D1_did)
);

CREATE TABLE IF NOT EXISTS Attribute
(
  isKey            BOOL,
  isDerived        BOOL,
  O1_id            VARCHAR(36), # from 'Object'; ATTR_OF
  O1_did           VARCHAR(36)  UNIQUE, # from 'Object'; ATTR_OF
  id               VARCHAR(36), # from 'Object'; inherits
  did              VARCHAR(36)  UNIQUE, # from 'Object'; inherits
  PRIMARY KEY (id, did)
);

CREATE TABLE IF NOT EXISTS Specialization
(
  disjoint         BOOL,
  id               VARCHAR(36), # from 'Object'; inherits
  did              VARCHAR(36)  UNIQUE, # from 'Object'; inherits
  PRIMARY KEY (id, did)
);

CREATE TABLE IF NOT EXISTS `Table`
(
  x                FLOAT(16),
  y                FLOAT(16),
  name             VARCHAR(32),
  D1_did           VARCHAR(36)  UNIQUE, # from 'Diagram'; BELONGS_TO
  PRIMARY KEY (name, D1_did)
);

CREATE TABLE IF NOT EXISTS `Column`
(
  name             VARCHAR(32),
  type             VARCHAR(16),
  param            VARCHAR(16),
  isKey            BOOL,
  notNull          BOOL,
  T1_name          VARCHAR(32), # from 'Table'; COLUMN_OF
  T1_did           VARCHAR(36)  UNIQUE, # from 'Table'; COLUMN_OF
  PRIMARY KEY (name, T1_name, T1_did)
);

CREATE TABLE IF NOT EXISTS CAN_EDIT
(
  start_time       DATETIME,
  C1_cid           VARCHAR(36)  UNIQUE, # from 'Container'; Container
  E1_uid           VARCHAR(36)  UNIQUE, # from 'Editor'; Editor
  PRIMARY KEY (C1_cid, E1_uid)
);

CREATE TABLE IF NOT EXISTS CAN_VIEW
(
  start_time       DATETIME,
  C1_cid           VARCHAR(36)  UNIQUE, # from 'Container'; Container
  U1_uid           VARCHAR(36)  UNIQUE, # from 'User'; User
  PRIMARY KEY (C1_cid, U1_uid)
);

CREATE TABLE IF NOT EXISTS LAST_EDITED_BY
(
  datetime         DATETIME,
  D1_did           VARCHAR(36)  UNIQUE, # from 'Diagram'; Diagram
  U1_uid           VARCHAR(36)  UNIQUE, # from 'User'; User
  PRIMARY KEY (D1_did, U1_uid)
);

CREATE TABLE IF NOT EXISTS CREATED_BY
(
  datetime         DATETIME,
  C1_cid           VARCHAR(36)  UNIQUE, # from 'Container'; Container
  U1_uid           VARCHAR(36)  UNIQUE, # from 'User'; User
  PRIMARY KEY (C1_cid, U1_uid)
);

CREATE TABLE IF NOT EXISTS `FOREIGN`
(
  role             VARCHAR(32),
  required         BOOL,
  T1_name          VARCHAR(32), # from 'Table'; references
  T1_did           VARCHAR(36)  UNIQUE, # from 'Table'; references
  T2_name          VARCHAR(32), # from 'Table'; by
  T2_did           VARCHAR(36)  UNIQUE, # from 'Table'; by
  PRIMARY KEY (T1_name, T1_did, T2_name, T2_did)
);

CREATE TABLE IF NOT EXISTS LAST_VIEW
(
  datetime         DATETIME,
  D1_did           VARCHAR(36)  UNIQUE, # from 'Diagram'; Diagram
  U1_uid           VARCHAR(36)  UNIQUE, # from 'User'; User
  PRIMARY KEY (D1_did, U1_uid)
);

##### TABLE ALTER #####


ALTER TABLE MESSAGE
  ADD FOREIGN KEY (C1_cid) REFERENCES Container(cid),
  ADD FOREIGN KEY (U1_uid) REFERENCES `User`(uid);



ALTER TABLE Diagram
  ADD FOREIGN KEY (C1_cid) REFERENCES Container(cid);

ALTER TABLE Admin
  ADD FOREIGN KEY (uid) REFERENCES `User`(uid);

ALTER TABLE Editor
  ADD FOREIGN KEY (uid) REFERENCES `User`(uid);

ALTER TABLE Object
  ADD FOREIGN KEY (D1_did) REFERENCES Diagram(did),
  ADD FOREIGN KEY (O1_id, O1_did) REFERENCES Object(id, D1_did);

ALTER TABLE Attribute
  ADD FOREIGN KEY (O1_id, O1_did) REFERENCES Object(id, D1_did),
  ADD FOREIGN KEY (id, did) REFERENCES Object(id, D1_did);

ALTER TABLE Specialization
  ADD FOREIGN KEY (id, did) REFERENCES Object(id, D1_did);

ALTER TABLE `Table`
  ADD FOREIGN KEY (D1_did) REFERENCES Diagram(did);

ALTER TABLE `Column`
  ADD FOREIGN KEY (T1_name, T1_did) REFERENCES `Table`(name, D1_did);

ALTER TABLE CAN_EDIT
  ADD FOREIGN KEY (C1_cid) REFERENCES Container(cid),
  ADD FOREIGN KEY (E1_uid) REFERENCES Editor(uid);

ALTER TABLE CAN_VIEW
  ADD FOREIGN KEY (C1_cid) REFERENCES Container(cid),
  ADD FOREIGN KEY (U1_uid) REFERENCES `User`(uid);

ALTER TABLE LAST_EDITED_BY
  ADD FOREIGN KEY (D1_did) REFERENCES Diagram(did),
  ADD FOREIGN KEY (U1_uid) REFERENCES `User`(uid);

ALTER TABLE CREATED_BY
  ADD FOREIGN KEY (C1_cid) REFERENCES Container(cid),
  ADD FOREIGN KEY (U1_uid) REFERENCES `User`(uid);

ALTER TABLE `FOREIGN`
  ADD FOREIGN KEY (T1_name, T1_did) REFERENCES `Table`(name, D1_did),
  ADD FOREIGN KEY (T2_name, T2_did) REFERENCES `Table`(name, D1_did);

ALTER TABLE LAST_VIEW
  ADD FOREIGN KEY (D1_did) REFERENCES Diagram(did),
  ADD FOREIGN KEY (U1_uid) REFERENCES `User`(uid);
