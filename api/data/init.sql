CREATE DATABASE IF NOT EXISTS evilEr;
USE evilEr;

##### TABLE CREATION #####
CREATE TABLE IF NOT EXISTS `User`
(
  uid        VARCHAR(36) UNIQUE default (uuid()) not null,
  pfp        VARCHAR(128),
  name       VARCHAR(32)                         not null,
  isAdmin    BOOL,
  email      VARCHAR(32) UNIQUE                  not null,
  pwd_hash   CHAR(40)                            not null,
  last_login DATETIME,
  PRIMARY KEY (uid)
);

CREATE TABLE IF NOT EXISTS MESSAGE
(
  mid      VARCHAR(36) not null,
  text     TEXT        not null,
  datetime DATETIME    not null,
  cid      VARCHAR(36) not null, # from 'Container'; SENT
  uid      VARCHAR(36) not null, # from 'User'; SENT
  PRIMARY KEY (mid, cid, uid)
);

CREATE TABLE IF NOT EXISTS Container
(
  cid  VARCHAR(36) UNIQUE not null,
  name VARCHAR(32)        not null,
  PRIMARY KEY (cid)
);

CREATE TABLE IF NOT EXISTS Diagram
(
  did  VARCHAR(36) UNIQUE not null,
  name VARCHAR(32)        not null,
  isEr BOOL,
  cid  VARCHAR(36)        not null, # from 'Container'; FROM
  PRIMARY KEY (did)
);

CREATE TABLE IF NOT EXISTS Admin
(
  retired    BOOL,
  start_time DATETIME,
  uid        VARCHAR(36) not null, # from 'User'; inherits
  PRIMARY KEY (uid)
);

CREATE TABLE IF NOT EXISTS Editor
(
  created    INT       default 0,
  reputation FLOAT(32) default 0,
  uid        VARCHAR(36) not null, # from 'User'; inherits
  PRIMARY KEY (uid)
);

CREATE TABLE IF NOT EXISTS Object
(
  x        FLOAT(16)   not null,
  y        FLOAT(16)   not null,
  id       VARCHAR(36) not null,
  name     VARCHAR(32) not null,
  type     VARCHAR(16),
  outlined BOOL,
  did      VARCHAR(36) not null, # from 'Diagram'; BELONGS_TO
  PRIMARY KEY (id, did)
);

CREATE TABLE IF NOT EXISTS Attribute
(
  isKey     BOOL,
  isDerived BOOL,
  pid       VARCHAR(36),          # from 'Object'; ATTR_OF
  id        VARCHAR(36) not null, # from 'Object'; inherits
  did       VARCHAR(36) not null, # from 'Object'; inherits
  PRIMARY KEY (id, did)
);

CREATE TABLE IF NOT EXISTS Specialization
(
  disjoint BOOL,
  id       VARCHAR(36) not null, # from 'Object'; inherits
  did      VARCHAR(36) not null, # from 'Object'; inherits
  PRIMARY KEY (id, did)
);

CREATE TABLE IF NOT EXISTS `Table`
(
  x    FLOAT(16)   not null,
  y    FLOAT(16)   not null,
  name VARCHAR(32) not null,
  did  VARCHAR(36) not null, # from 'Diagram'; BELONGS_TO
  PRIMARY KEY (name, did)
);

CREATE TABLE IF NOT EXISTS `Column`
(
  name    VARCHAR(32),
  type    VARCHAR(16),
  param   VARCHAR(16),
  isKey   BOOL,
  notNull BOOL,
  r_name  VARCHAR(32) not null, # from 'Table'; COLUMN_OF
  did     VARCHAR(36) not null, # from 'Table'; COLUMN_OF
  PRIMARY KEY (name, r_name, did)
);

CREATE TABLE IF NOT EXISTS CAN_EDIT
(
  start_time DATETIME,
  cid        VARCHAR(36) not null, # from 'Container'; Container
  uid        VARCHAR(36) not null, # from 'Editor'; Editor
  PRIMARY KEY (cid, uid)
);

CREATE TABLE IF NOT EXISTS CAN_VIEW
(
  start_time DATETIME,
  cid        VARCHAR(36) not null, # from 'Container'; Container
  uid        VARCHAR(36) not null, # from 'User'; User
  PRIMARY KEY (cid, uid)
);

CREATE TABLE IF NOT EXISTS RELATES
(
  role        VARCHAR(32),
  total       BOOL,
  cardinality VARCHAR(8),
  rid         VARCHAR(36) not null, # from 'Object'; Object
  oid         VARCHAR(36) not null, # from 'Object'; Object
  did         VARCHAR(36) not null, # from 'Object'; Object
  PRIMARY KEY (rid, oid, did, role)
);

CREATE TABLE IF NOT EXISTS LAST_EDITED_BY
(
  datetime DATETIME,
  did      VARCHAR(36) not null, # from 'Diagram'; Diagram
  uid      VARCHAR(36) not null, # from 'User'; User
  PRIMARY KEY (did, uid)
);

CREATE TABLE IF NOT EXISTS CREATED_BY
(
  datetime DATETIME,
  cid      VARCHAR(36) not null, # from 'Container'; Container
  uid      VARCHAR(36) not null, # from 'User'; User
  PRIMARY KEY (cid, uid)
);

CREATE TABLE IF NOT EXISTS `FOREIGN`
(
  role     VARCHAR(32),
  required BOOL,
  r_name   VARCHAR(32) not null, # from 'Table'; references
  name     VARCHAR(32) not null, # from 'Table'; by
  did      VARCHAR(36) not null,
  PRIMARY KEY (r_name, did, name)
);

CREATE TABLE IF NOT EXISTS LAST_VIEW
(
  datetime DATETIME,
  did      VARCHAR(36) not null, # from 'Diagram'; Diagram
  uid      VARCHAR(36) not null, # from 'User'; User
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
  ADD FOREIGN KEY (pid, did) REFERENCES Object (id, did),
  ADD FOREIGN KEY (id, did) REFERENCES Object (id, did);

ALTER TABLE Specialization
  ADD FOREIGN KEY (id, did) REFERENCES Object (id, did);

ALTER TABLE `Table`
  ADD FOREIGN KEY (did) REFERENCES Diagram (did);

ALTER TABLE `Column`
  ADD FOREIGN KEY (r_name, did) REFERENCES `Table` (name, did);

ALTER TABLE CAN_EDIT
  ADD FOREIGN KEY (cid) REFERENCES Container (cid),
  ADD FOREIGN KEY (uid) REFERENCES Editor (uid);

ALTER TABLE CAN_VIEW
  ADD FOREIGN KEY (cid) REFERENCES Container (cid),
  ADD FOREIGN KEY (uid) REFERENCES `User` (uid);

ALTER TABLE RELATES
  ADD FOREIGN KEY (rid, did) REFERENCES Object (id, did);

ALTER TABLE LAST_EDITED_BY
  ADD FOREIGN KEY (did) REFERENCES Diagram (did),
  ADD FOREIGN KEY (uid) REFERENCES `User` (uid);

ALTER TABLE CREATED_BY
  ADD FOREIGN KEY (cid) REFERENCES Container (cid),
  ADD FOREIGN KEY (uid) REFERENCES `User` (uid);

ALTER TABLE `FOREIGN`
  ADD FOREIGN KEY (r_name, did) REFERENCES `Table` (name, did),
  ADD FOREIGN KEY (name, did) REFERENCES `Table` (name, did);

ALTER TABLE LAST_VIEW
  ADD FOREIGN KEY (did) REFERENCES Diagram (did),
  ADD FOREIGN KEY (uid) REFERENCES `User` (uid);
