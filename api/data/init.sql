CREATE DATABASE IF NOT EXISTS evilEr;
USE evilEr;

##### TABLE CREATION #####
CREATE TABLE IF NOT EXISTS `user`
(
  uid           VARCHAR(36) UNIQUE default (uuid()) not null,
  pfp           VARCHAR(128),
  name          VARCHAR(32)                         not null,
  isadmin       BOOL,
  email         VARCHAR(32) UNIQUE                  not null,
  pwd_hash      CHAR(40)                            not null,
  last_login    DATETIME,
  messages_sent INT                default 0        not null,
  PRIMARY KEY (uid)
);

CREATE TABLE IF NOT EXISTS message
(
  mid      VARCHAR(36) not null,
  text     TEXT        not null,
  datetime DATETIME    not null,
  cid      VARCHAR(36) not null, # from 'container'; SENT
  uid      VARCHAR(36) not null, # from 'user'; SENT
  PRIMARY KEY (mid, cid)
);

CREATE TABLE IF NOT EXISTS container
(
  cid  VARCHAR(36) UNIQUE not null,
  name VARCHAR(32)        not null,
  PRIMARY KEY (cid)
);

CREATE TABLE IF NOT EXISTS diagram
(
  did          VARCHAR(36) UNIQUE not null,
  name         VARCHAR(32)        not null,
  isEr         BOOL,
  cid          VARCHAR(36)        not null, # from 'container'; FROM
  objects_made INT default 0      not null,
  PRIMARY KEY (did)
);

CREATE TABLE IF NOT EXISTS admin
(
  retired    BOOL,
  start_time DATETIME,
  uid        VARCHAR(36) not null, # from 'user'; inherits
  PRIMARY KEY (uid)
);

CREATE TABLE IF NOT EXISTS editor
(
  created    INT       default 0,
  reputation FLOAT(32) default 0,
  uid        VARCHAR(36) not null, # from 'user'; inherits
  PRIMARY KEY (uid)
);

CREATE TABLE IF NOT EXISTS object
(
  x        FLOAT(16)   not null,
  y        FLOAT(16)   not null,
  id       VARCHAR(36) not null,
  name     VARCHAR(32) not null,
  type     VARCHAR(16),
  outlined BOOL,
  did      VARCHAR(36) not null, # from 'diagram'; BELONGS_TO
  PRIMARY KEY (id, did)
);

CREATE TABLE IF NOT EXISTS attribute
(
  isKey     BOOL,
  isDerived BOOL,
  pid       VARCHAR(36),          # from 'object'; ATTR_OF
  id        VARCHAR(36) not null, # from 'object'; inherits
  did       VARCHAR(36) not null, # from 'object'; inherits
  PRIMARY KEY (id, did)
);

CREATE TABLE IF NOT EXISTS specialization
(
  disjoint BOOL,
  id       VARCHAR(36) not null, # from 'object'; inherits
  did      VARCHAR(36) not null, # from 'object'; inherits
  PRIMARY KEY (id, did)
);

CREATE TABLE IF NOT EXISTS `table`
(
  x    FLOAT(16)   not null,
  y    FLOAT(16)   not null,
  name VARCHAR(32) not null,
  did  VARCHAR(36) not null, # from 'diagram'; BELONGS_TO
  PRIMARY KEY (name, did)
);

CREATE TABLE IF NOT EXISTS `column`
(
  name    VARCHAR(32),
  type    VARCHAR(16),
  param   VARCHAR(16),
  isKey   BOOL,
  notNull BOOL,
  r_name  VARCHAR(32) not null, # from 'table'; COLUMN_OF
  did     VARCHAR(36) not null, # from 'table'; COLUMN_OF
  PRIMARY KEY (name, r_name, did)
);

CREATE TABLE IF NOT EXISTS can_edit
(
  start_time DATETIME,
  cid        VARCHAR(36) not null, # from 'container'; container
  uid        VARCHAR(36) not null, # from 'editor'; editor
  PRIMARY KEY (cid, uid)
);

CREATE TABLE IF NOT EXISTS can_view
(
  start_time DATETIME,
  cid        VARCHAR(36) not null, # from 'container'; container
  uid        VARCHAR(36) not null, # from 'user'; user
  PRIMARY KEY (cid, uid)
);

CREATE TABLE IF NOT EXISTS relates
(
  role        VARCHAR(32),
  total       BOOL,
  cardinality VARCHAR(8),
  rid         VARCHAR(36) not null, # from 'object'; object
  oid         VARCHAR(36) not null, # from 'object'; object
  did         VARCHAR(36) not null, # from 'object'; object
  PRIMARY KEY (rid, oid, did, role)
);

CREATE TABLE IF NOT EXISTS last_edited_by
(
  datetime DATETIME,
  did      VARCHAR(36) not null, # from 'diagram'; diagram
  uid      VARCHAR(36) not null, # from 'user'; user
  PRIMARY KEY (did, uid)
);

CREATE TABLE IF NOT EXISTS created_by
(
  datetime DATETIME,
  cid      VARCHAR(36) not null, # from 'container'; container
  uid      VARCHAR(36) not null, # from 'user'; user
  PRIMARY KEY (cid, uid)
);

CREATE TABLE IF NOT EXISTS `foreign`
(
  role     VARCHAR(32),
  required BOOL,
  r_name   VARCHAR(32) not null, # from 'table'; references
  name     VARCHAR(32) not null, # from 'table'; by
  did      VARCHAR(36) not null,
  PRIMARY KEY (r_name, did, name)
);

CREATE TABLE IF NOT EXISTS last_view
(
  datetime DATETIME,
  did      VARCHAR(36) not null, # from 'diagram'; diagram
  uid      VARCHAR(36) not null, # from 'user'; user
  PRIMARY KEY (did, uid)
);

##### TABLE ALTER #####


ALTER TABLE message
  ADD foreign KEY (cid) REFERENCES container (cid) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD foreign KEY (uid) REFERENCES `user` (uid) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE diagram
  ADD foreign KEY (cid) REFERENCES container (cid) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE admin
  ADD foreign KEY (uid) REFERENCES `user` (uid) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE editor
  ADD foreign KEY (uid) REFERENCES `user` (uid) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE object
  ADD foreign KEY (did) REFERENCES diagram (did) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE attribute
  ADD foreign KEY (pid, did) REFERENCES object (id, did) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD foreign KEY (id, did) REFERENCES object (id, did) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE specialization
  ADD foreign KEY (id, did) REFERENCES object (id, did) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `table`
  ADD foreign KEY (did) REFERENCES diagram (did) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `column`
  ADD foreign KEY (r_name, did) REFERENCES `table` (name, did) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE can_edit
  ADD foreign KEY (cid) REFERENCES container (cid) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD foreign KEY (uid) REFERENCES editor (uid) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE can_view
  ADD foreign KEY (cid) REFERENCES container (cid) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD foreign KEY (uid) REFERENCES `user` (uid) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE relates
  ADD foreign KEY (rid, did) REFERENCES object (id, did) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE last_edited_by
  ADD foreign KEY (did) REFERENCES diagram (did) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD foreign KEY (uid) REFERENCES `user` (uid) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE created_by
  ADD foreign KEY (cid) REFERENCES container (cid) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD foreign KEY (uid) REFERENCES `user` (uid) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE `foreign`
  ADD foreign KEY (r_name, did) REFERENCES `table` (name, did) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD foreign KEY (name, did) REFERENCES `table` (name, did) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE last_view
  ADD foreign KEY (did) REFERENCES diagram (did) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD foreign KEY (uid) REFERENCES `user` (uid) ON DELETE CASCADE ON UPDATE CASCADE;
