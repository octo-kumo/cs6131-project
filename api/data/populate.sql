USE evilEr;
CALL register('admin', 'admin@nush.app', 'password');
CALL register('test', 'test@nush.app', 'password');

INSERT INTO container (cid, name)
VALUES ('test', 'Test Collection');

INSERT INTO container (cid, name)
VALUES ('sandbox', 'Sandbox');

INSERT INTO diagram (did, name, isER, C1_cid)
VALUES ('test', 'Test Diagram', true, 'test');

INSERT INTO object (x, y, id, name, type, outlined, D1_did)
VALUES (0, 0, '3e7823d0-ae79-11ec-a4ad-38f3ab0c216b', 'Entity 1', 'entity', false, 'test');

INSERT INTO object (x, y, id, name, type, outlined, D1_did)
VALUES (200, 0, '4cee5ea1-ae79-11ec-a4ad-38f3ab0c216b', 'Entity 2', 'entity', false, 'test');

INSERT INTO object (x, y, id, name, type, outlined, D1_did)
VALUES (0, 200, '53cf6249-ae79-11ec-a4ad-38f3ab0c216b', 'Entity', 'relationship', false, 'test');

INSERT INTO relates (role, total, cardinality, O1_id, O1_did, O2_id, O2_did)
VALUES ('', false, 'N', '3e7823d0-ae79-11ec-a4ad-38f3ab0c216b', 'test', '53cf6249-ae79-11ec-a4ad-38f3ab0c216b', 'test');
INSERT INTO relates (role, total, cardinality, O1_id, O1_did, O2_id, O2_did)
VALUES ('', true, 'M', '4cee5ea1-ae79-11ec-a4ad-38f3ab0c216b', 'test', '53cf6249-ae79-11ec-a4ad-38f3ab0c216b', 'test');

INSERT INTO diagram (did, name, isER, C1_cid)
VALUES ('test1', 'Test Diagram Beta', true, 'test');

INSERT INTO object (x, y, id, name, type, outlined, D1_did)
VALUES (0, 0, '8e3601e3-ae79-11ec-a4ad-38f3ab0c216b', 'Entity 1', 'entity', false, 'test1');

INSERT INTO object (x, y, id, name, type, outlined, D1_did)
VALUES (200, 0, '9226b4a1-ae79-11ec-a4ad-38f3ab0c216b', 'Entity 2', 'entity', false, 'test1');

INSERT INTO object (x, y, id, name, type, outlined, D1_did)
VALUES (0, 400, '9575a150-ae79-11ec-a4ad-38f3ab0c216b', 'Entity', 'relationship', false, 'test1');

INSERT INTO relates (role, total, cardinality, O1_id, O1_did, O2_id, O2_did)
VALUES ('', true, 'N', '8e3601e3-ae79-11ec-a4ad-38f3ab0c216b', 'test1', '9575a150-ae79-11ec-a4ad-38f3ab0c216b',
        'test1');
INSERT INTO relates (role, total, cardinality, O1_id, O1_did, O2_id, O2_did)
VALUES ('', false, 'M', '9226b4a1-ae79-11ec-a4ad-38f3ab0c216b', 'test1', '9575a150-ae79-11ec-a4ad-38f3ab0c216b',
        'test1');
