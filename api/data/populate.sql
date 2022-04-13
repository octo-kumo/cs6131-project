USE evilEr;
CALL register('test', 'test@nush.app', 'password');

INSERT INTO user
VALUES ('13371337-1337-1337-1337-133713371337', 'https://files.catbox.moe/4ri4bv.png', 'yun', true,
        'h1710169@nushigh.edu.sg', SHA1('password'), null),
       ('cf0e72fd-4a38-47e8-94e2-1e0441a64ba6', null, 'Chew Shuhui Phylliscia', true,
        'nhscsp@nushigh.edu.sg', SHA1('password'), null),
       ('a595fb7e-6f7e-48ce-acc8-0bb023843d11', null, 'Evil Mrs Lee', false,
        'evil@nush.app', SHA1('password'), null);

call createContainer('test', 'Examples', '13371337-1337-1337-1337-133713371337');
call createContainer('sandbox', 'Test Collection', 'cf0e72fd-4a38-47e8-94e2-1e0441a64ba6');

INSERT INTO diagram (did, name, isER, cid)
VALUES ('test', 'Test Diagram', true, 'test');

INSERT INTO object (x, y, id, name, type, outlined, did)
VALUES (0, 0, '3e7823d0-ae79-11ec-a4ad-38f3ab0c216b', 'Entity 1', 'entity', false, 'test');

INSERT INTO object (x, y, id, name, type, outlined, did)
VALUES (200, 0, '4cee5ea1-ae79-11ec-a4ad-38f3ab0c216b', 'Entity 2', 'entity', false, 'test');

INSERT INTO object (x, y, id, name, type, outlined, did)
VALUES (0, 200, '53cf6249-ae79-11ec-a4ad-38f3ab0c216b', 'Entity', 'relationship', false, 'test');

INSERT INTO relates (role, total, cardinality, rid, oid, did)
VALUES ('', false, 'N', '3e7823d0-ae79-11ec-a4ad-38f3ab0c216b', '53cf6249-ae79-11ec-a4ad-38f3ab0c216b', 'test'),
       ('', true, 'M', '4cee5ea1-ae79-11ec-a4ad-38f3ab0c216b', '53cf6249-ae79-11ec-a4ad-38f3ab0c216b', 'test');

INSERT INTO diagram (did, name, isER, cid)
VALUES ('test1', 'Test Diagram Beta', true, 'test');

INSERT INTO object (x, y, id, name, type, outlined, did)
VALUES (0, 0, '8e3601e3-ae79-11ec-a4ad-38f3ab0c216b', 'Entity 1', 'entity', false, 'test1');

INSERT INTO object
VALUES (200, 0, '9226b4a1-ae79-11ec-a4ad-38f3ab0c216b', 'Entity 2', 'entity', true, 'test1');
INSERT INTO object
VALUES (0, 400, '9575a150-ae79-11ec-a4ad-38f3ab0c216b', 'Entity', 'relationship', false, 'test1');

INSERT INTO relates (role, total, cardinality, rid, oid, did)
VALUES ('', true, 'N', '8e3601e3-ae79-11ec-a4ad-38f3ab0c216b', '9575a150-ae79-11ec-a4ad-38f3ab0c216b', 'test1'),
       ('', false, 'M', '9226b4a1-ae79-11ec-a4ad-38f3ab0c216b', '9575a150-ae79-11ec-a4ad-38f3ab0c216b', 'test1');
