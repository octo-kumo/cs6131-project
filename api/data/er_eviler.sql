USE evilEr;
INSERT INTO object
VALUES (512.0, 128.0, 'da0285a4-053a-4c7d-93b7-533ee6fb8361', 'ER Diagram', 'entity', false, 'evilEr');
# ================ #
INSERT INTO object
VALUES (1152.0, 128.0, '276f80eb-8e41-4b95-b127-6589879ade97', 'User', 'entity', false, 'evilEr');
INSERT INTO object
VALUES (1264.0, 48.0, '82ef852c-6276-4cfb-9ca7-ce5704ee6ba9', 'uid', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (true, false, '276f80eb-8e41-4b95-b127-6589879ade97', 'evilEr', '82ef852c-6276-4cfb-9ca7-ce5704ee6ba9', 'evilEr');
# ================ #
INSERT INTO object
VALUES (1264.0, 80.0, '3295ab18-32d1-4bf5-8412-861fa885b619', 'name', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, '276f80eb-8e41-4b95-b127-6589879ade97', 'evilEr', '3295ab18-32d1-4bf5-8412-861fa885b619', 'evilEr');
# ================ #
INSERT INTO object
VALUES (1264.0, 176.0, 'c2870508-17a7-4483-8320-355ff8c6f580', 'pfp', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, '276f80eb-8e41-4b95-b127-6589879ade97', 'evilEr', 'c2870508-17a7-4483-8320-355ff8c6f580', 'evilEr');
# ================ #
INSERT INTO object
VALUES (1264.0, 112.0, 'b66d6db1-56bb-46ab-a4a1-a17328ed9966', 'email', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, '276f80eb-8e41-4b95-b127-6589879ade97', 'evilEr', 'b66d6db1-56bb-46ab-a4a1-a17328ed9966', 'evilEr');
# ================ #
INSERT INTO object
VALUES (1264.0, 144.0, 'ff93f5da-6b3d-4182-b609-3eaef6aecb8a', 'pwd_hash', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, '276f80eb-8e41-4b95-b127-6589879ade97', 'evilEr', 'ff93f5da-6b3d-4182-b609-3eaef6aecb8a', 'evilEr');
# ================ #
INSERT INTO object
VALUES (1264.0, 208.0, '5e84d83e-4f33-4681-aacd-4dbd35e9ea5c', 'last_login', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, '276f80eb-8e41-4b95-b127-6589879ade97', 'evilEr', '5e84d83e-4f33-4681-aacd-4dbd35e9ea5c', 'evilEr');
# ================ #
# ================ #
INSERT INTO object
VALUES (1024.0, 192.0, '0272416e-d536-4d52-8654-0da11423fda0', 'MESSAGE', 'entity', true, 'evilEr');
INSERT INTO object
VALUES (1104.0, 240.0, 'b3a0726c-5934-4b14-b2fb-d93c3af6f5ac', 'text', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, '0272416e-d536-4d52-8654-0da11423fda0', 'evilEr', 'b3a0726c-5934-4b14-b2fb-d93c3af6f5ac', 'evilEr');
# ================ #
INSERT INTO object
VALUES (1024.0, 240.0, 'b97a0abd-61f3-4eb6-be84-238d8a797ee8', 'datetime', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, '0272416e-d536-4d52-8654-0da11423fda0', 'evilEr', 'b97a0abd-61f3-4eb6-be84-238d8a797ee8', 'evilEr');
# ================ #
INSERT INTO object
VALUES (944.0, 240.0, '51ae65d3-fdda-4961-9a0c-06542a4eb444', 'mid', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (true, false, '0272416e-d536-4d52-8654-0da11423fda0', 'evilEr', '51ae65d3-fdda-4961-9a0c-06542a4eb444', 'evilEr');
# ================ #
# ================ #
INSERT INTO object
VALUES (896.0, 128.0, '7266ad81-6419-4c93-8cb7-b655e36571d5', 'Container', 'entity', false, 'evilEr');
INSERT INTO object
VALUES (832.0, 176.0, '200571a1-8dcf-4139-8409-5d217053ef8d', 'cid', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (true, false, '7266ad81-6419-4c93-8cb7-b655e36571d5', 'evilEr', '200571a1-8dcf-4139-8409-5d217053ef8d', 'evilEr');
# ================ #
INSERT INTO object
VALUES (832.0, 208.0, 'b9d787cb-7ab5-4ef9-a151-696cb85ac714', 'name', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, '7266ad81-6419-4c93-8cb7-b655e36571d5', 'evilEr', 'b9d787cb-7ab5-4ef9-a151-696cb85ac714', 'evilEr');
# ================ #
# ================ #
INSERT INTO object
VALUES (768.0, 64.0, 'ce4f428f-bcb7-4151-866c-0954218e0fe8', 'Diagram', 'entity', false, 'evilEr');
INSERT INTO object
VALUES (816.0, 16.0, '4e8933cf-60e5-43e1-9157-7b40ff7a2c6c', 'did', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (true, false, 'ce4f428f-bcb7-4151-866c-0954218e0fe8', 'evilEr', '4e8933cf-60e5-43e1-9157-7b40ff7a2c6c', 'evilEr');
# ================ #
INSERT INTO object
VALUES (720.0, 16.0, '053ce328-1e99-449c-965d-a23782f8e29d', 'name', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, 'ce4f428f-bcb7-4151-866c-0954218e0fe8', 'evilEr', '053ce328-1e99-449c-965d-a23782f8e29d', 'evilEr');
# ================ #
# ================ #
INSERT INTO object
VALUES (512.0, 64.0, 'e71cbed4-8f6f-462c-be48-d41d776ab7f0', 'Schema', 'entity', false, 'evilEr');
# ================ #
INSERT INTO object
VALUES (1056.0, 432.0, '366c5efe-d997-4fb2-87e1-8bc408acc8e3', 'Admin', 'entity', false, 'evilEr');
INSERT INTO object
VALUES (960.0, 464.0, 'ebbf2613-9dad-41a4-9464-1c5272ee358c', 'start_time', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, '366c5efe-d997-4fb2-87e1-8bc408acc8e3', 'evilEr', 'ebbf2613-9dad-41a4-9464-1c5272ee358c', 'evilEr');
# ================ #
INSERT INTO object
VALUES (960.0, 432.0, '7d5060a9-f8e7-4863-bf2e-dee486099f64', 'retired', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, '366c5efe-d997-4fb2-87e1-8bc408acc8e3', 'evilEr', '7d5060a9-f8e7-4863-bf2e-dee486099f64', 'evilEr');
# ================ #
# ================ #
INSERT INTO object
VALUES (1056.0, 304.0, '36724cc4-52bb-46f7-ab26-5cf7020ee426', 'Editor', 'entity', false, 'evilEr');
INSERT INTO object
VALUES (960.0, 320.0, '04633ca3-28c6-4e4c-b408-08652cc2f89b', 'reputation', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, '36724cc4-52bb-46f7-ab26-5cf7020ee426', 'evilEr', '04633ca3-28c6-4e4c-b408-08652cc2f89b', 'evilEr');
# ================ #
# ================ #
INSERT INTO object
VALUES (1056.0, 368.0, '9a82988a-afb2-4329-805e-9b7d3374897f', 'Viewer', 'entity', false, 'evilEr');
# ================ #
INSERT INTO object
VALUES (512.0, 0.0, 'bd08a2d4-0284-4c08-ac4e-a9351f118c6d', 'EER Diagram', 'entity', false, 'evilEr');
# ================ #
INSERT INTO object
VALUES (512.0, 256.0, 'b993a81d-f126-40f8-9709-f6ef9363db1d', 'Object', 'entity', true, 'evilEr');
INSERT INTO object
VALUES (640.0, 208.0, '69df0251-3eb6-42a8-9260-7a6d18972d96', 'x', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, 'b993a81d-f126-40f8-9709-f6ef9363db1d', 'evilEr', '69df0251-3eb6-42a8-9260-7a6d18972d96', 'evilEr');
# ================ #
INSERT INTO object
VALUES (640.0, 240.0, '7e98255a-41b1-47a9-8ae5-85e45f4606e6', 'y', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, 'b993a81d-f126-40f8-9709-f6ef9363db1d', 'evilEr', '7e98255a-41b1-47a9-8ae5-85e45f4606e6', 'evilEr');
# ================ #
INSERT INTO object
VALUES (639.3365795687109, 272.0, 'a21914c1-5494-410b-86cb-cdf4ba61b6a9', 'name', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, 'b993a81d-f126-40f8-9709-f6ef9363db1d', 'evilEr', 'a21914c1-5494-410b-86cb-cdf4ba61b6a9', 'evilEr');
# ================ #
INSERT INTO object
VALUES (640.0, 304.0, 'f50e1f70-5b94-465d-8c03-a9e93aba8f72', 'id', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (true, false, 'b993a81d-f126-40f8-9709-f6ef9363db1d', 'evilEr', 'f50e1f70-5b94-465d-8c03-a9e93aba8f72', 'evilEr');
# ================ #
INSERT INTO object
VALUES (640.0, 176.0, '867bce8f-921d-4da3-bee5-071e8fb3d544', 'outlined', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, 'b993a81d-f126-40f8-9709-f6ef9363db1d', 'evilEr', '867bce8f-921d-4da3-bee5-071e8fb3d544', 'evilEr');
# ================ #
# ================ #
INSERT INTO object
VALUES (384.0, 320.0, 'ebd6f399-8ae3-4e21-a2ab-42ce6a71b58c', 'Attribute', 'entity', true, 'evilEr');
INSERT INTO object
VALUES (272.0, 304.0, 'f2a9156c-6698-4653-9dc1-067214f6c787', 'isKey', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, 'ebd6f399-8ae3-4e21-a2ab-42ce6a71b58c', 'evilEr', 'f2a9156c-6698-4653-9dc1-067214f6c787', 'evilEr');
# ================ #
INSERT INTO object
VALUES (272.0, 336.0, '0f0cbeda-3397-4e7d-b4d4-0d0ee68e1f52', 'isDerived', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, 'ebd6f399-8ae3-4e21-a2ab-42ce6a71b58c', 'evilEr', '0f0cbeda-3397-4e7d-b4d4-0d0ee68e1f52', 'evilEr');
# ================ #
# ================ #
INSERT INTO object
VALUES (384.0, 384.0, 'c9f8edbb-fc13-4ffd-a8dc-ede917db4385', 'Entity', 'entity', true, 'evilEr');
# ================ #
INSERT INTO object
VALUES (640.0, 384.0, '47165389-f81c-4d81-9183-bec59ed46593', 'Relationship', 'entity', true, 'evilEr');
# ================ #
INSERT INTO object
VALUES (768.0, 432.0, 'd2941ee6-3f05-42f3-bc2b-75954f9e96cc', 'Specialization', 'entity', true, 'evilEr');
INSERT INTO object
VALUES (672.0, 432.0, '1ce0c5ca-3c03-41e0-af92-4b1ffcbe1d53', 'disjoint', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, 'd2941ee6-3f05-42f3-bc2b-75954f9e96cc', 'evilEr', '1ce0c5ca-3c03-41e0-af92-4b1ffcbe1d53', 'evilEr');
# ================ #
# ================ #
INSERT INTO object
VALUES (256.0, 64.0, '651276d1-8a0f-4ff9-a9c3-9075fd6b5326', 'Table', 'entity', true, 'evilEr');
INSERT INTO object
VALUES (160.0, 64.0, '0febc456-5d61-49f1-9754-cccf065fc2ef', 'x', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, '651276d1-8a0f-4ff9-a9c3-9075fd6b5326', 'evilEr', '0febc456-5d61-49f1-9754-cccf065fc2ef', 'evilEr');
# ================ #
INSERT INTO object
VALUES (159.33657956871093, 96.66342043128907, '0797dadc-aaa2-42a5-8e45-6faeeabdcffa', 'y', 'attribute', false,
        'evilEr');
INSERT INTO attribute
VALUES (false, false, '651276d1-8a0f-4ff9-a9c3-9075fd6b5326', 'evilEr', '0797dadc-aaa2-42a5-8e45-6faeeabdcffa', 'evilEr');
# ================ #
INSERT INTO object
VALUES (160.0, 32.0, 'f5e5107c-dc4f-42c7-ac03-db29e1d3d78e', 'name', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (true, false, '651276d1-8a0f-4ff9-a9c3-9075fd6b5326', 'evilEr', 'f5e5107c-dc4f-42c7-ac03-db29e1d3d78e', 'evilEr');
# ================ #
# ================ #
INSERT INTO object
VALUES (256.0, 256.0, 'df42621f-4318-4c92-a77f-a79d477fdda7', 'Column', 'entity', true, 'evilEr');
INSERT INTO object
VALUES (160.0, 304.0, 'ef86e7b3-23b2-4d81-a351-3aa5b8e404c4', 'isKey', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, 'df42621f-4318-4c92-a77f-a79d477fdda7', 'evilEr', 'ef86e7b3-23b2-4d81-a351-3aa5b8e404c4', 'evilEr');
# ================ #
INSERT INTO object
VALUES (160.0, 208.0, '99d93ab7-9236-45a1-a67d-7be29c365e29', 'name', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (true, false, 'df42621f-4318-4c92-a77f-a79d477fdda7', 'evilEr', '99d93ab7-9236-45a1-a67d-7be29c365e29', 'evilEr');
# ================ #
INSERT INTO object
VALUES (160.0, 240.0, '6b05238e-c93e-4135-a503-ad499e0d00ad', 'type', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, 'df42621f-4318-4c92-a77f-a79d477fdda7', 'evilEr', '6b05238e-c93e-4135-a503-ad499e0d00ad', 'evilEr');
# ================ #
INSERT INTO object
VALUES (160.0, 336.0, 'f6e0d71e-1139-4aa3-a1e2-aebe3f74d6cd', 'notNull', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, 'df42621f-4318-4c92-a77f-a79d477fdda7', 'evilEr', 'f6e0d71e-1139-4aa3-a1e2-aebe3f74d6cd', 'evilEr');
# ================ #
INSERT INTO object
VALUES (160.0, 272.0, '49cde97e-7312-4796-870d-c85e82ef1b89', 'param', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, 'df42621f-4318-4c92-a77f-a79d477fdda7', 'evilEr', '49cde97e-7312-4796-870d-c85e82ef1b89', 'evilEr');
# ================ #
# ================ #
INSERT INTO object
VALUES (512.0, 192.0, '96fcd8e1-f7dd-4a31-9803-273b463daffd', 'BELONGS_TO', 'relationship', true, 'evilEr');
INSERT INTO relates
VALUES ('', false, '1', '96fcd8e1-f7dd-4a31-9803-273b463daffd', 'evilEr', 'da0285a4-053a-4c7d-93b7-533ee6fb8361',
        'evilEr');
INSERT INTO relates
VALUES ('', true, 'N', '96fcd8e1-f7dd-4a31-9803-273b463daffd', 'evilEr', 'b993a81d-f126-40f8-9709-f6ef9363db1d',
        'evilEr');
# ================ #
INSERT INTO object
VALUES (864.0, 304.0, 'd217a94e-5895-49ae-be91-4fdac3bd111f', 'CAN_EDIT', 'relationship', false, 'evilEr');
INSERT INTO relates
VALUES ('', false, '', 'd217a94e-5895-49ae-be91-4fdac3bd111f', 'evilEr', '7266ad81-6419-4c93-8cb7-b655e36571d5',
        'evilEr');
INSERT INTO relates
VALUES ('', false, '', 'd217a94e-5895-49ae-be91-4fdac3bd111f', 'evilEr', '36724cc4-52bb-46f7-ab26-5cf7020ee426',
        'evilEr');
INSERT INTO object
VALUES (769.3268408625781, 304.0, '7cdc26cc-76f9-4739-9c02-dd71a5eaa346', 'start_time', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, 'd217a94e-5895-49ae-be91-4fdac3bd111f', 'evilEr', '7cdc26cc-76f9-4739-9c02-dd71a5eaa346', 'evilEr');
# ================ #
# ================ #
INSERT INTO object
VALUES (1024.0, 128.0, '8df8720d-1582-4b24-a672-d180c2e5f4f0', 'SENT', 'relationship', true, 'evilEr');
INSERT INTO relates
VALUES ('', false, '1', '8df8720d-1582-4b24-a672-d180c2e5f4f0', 'evilEr', '276f80eb-8e41-4b95-b127-6589879ade97',
        'evilEr');
INSERT INTO relates
VALUES ('', true, 'N', '8df8720d-1582-4b24-a672-d180c2e5f4f0', 'evilEr', '0272416e-d536-4d52-8654-0da11423fda0',
        'evilEr');
INSERT INTO relates
VALUES ('', false, '1', '8df8720d-1582-4b24-a672-d180c2e5f4f0', 'evilEr', '7266ad81-6419-4c93-8cb7-b655e36571d5',
        'evilEr');
# ================ #
INSERT INTO object
VALUES (768.0, 128.0, 'efc5c205-852a-4511-9cf1-d9093f83e931', 'FROM', 'relationship', false, 'evilEr');
INSERT INTO relates
VALUES ('', false, '1', 'efc5c205-852a-4511-9cf1-d9093f83e931', 'evilEr', '7266ad81-6419-4c93-8cb7-b655e36571d5',
        'evilEr');
INSERT INTO relates
VALUES ('', true, 'N', 'efc5c205-852a-4511-9cf1-d9093f83e931', 'evilEr', 'ce4f428f-bcb7-4151-866c-0954218e0fe8',
        'evilEr');
# ================ #
INSERT INTO object
VALUES (928.0, 368.0, 'a8308082-55ca-4517-9edb-7f47d1318eef', 'CAN_VIEW', 'relationship', false, 'evilEr');
INSERT INTO relates
VALUES ('', false, '', 'a8308082-55ca-4517-9edb-7f47d1318eef', 'evilEr', '9a82988a-afb2-4329-805e-9b7d3374897f',
        'evilEr');
INSERT INTO relates
VALUES ('', false, '', 'a8308082-55ca-4517-9edb-7f47d1318eef', 'evilEr', '7266ad81-6419-4c93-8cb7-b655e36571d5',
        'evilEr');
INSERT INTO object
VALUES (832.0, 368.0, '22a08ffd-e487-45ba-9cdb-12319fa4bcf6', 'start_time', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, 'a8308082-55ca-4517-9edb-7f47d1318eef', 'evilEr', '22a08ffd-e487-45ba-9cdb-12319fa4bcf6', 'evilEr');
# ================ #
# ================ #
INSERT INTO object
VALUES (384.0, 256.0, '6cd21456-f131-44b5-82e1-9ac58097b6c6', 'ATTR_OF', 'relationship', false, 'evilEr');
INSERT INTO relates
VALUES ('', false, '1', '6cd21456-f131-44b5-82e1-9ac58097b6c6', 'evilEr', 'b993a81d-f126-40f8-9709-f6ef9363db1d',
        'evilEr');
INSERT INTO relates
VALUES ('', true, 'N', '6cd21456-f131-44b5-82e1-9ac58097b6c6', 'evilEr', 'ebd6f399-8ae3-4e21-a2ab-42ce6a71b58c',
        'evilEr');
# ================ #
INSERT INTO object
VALUES (512.0, 384.0, '86fb7292-c1fb-4087-a31d-b1721740e430', 'RELATES', 'relationship', false, 'evilEr');
INSERT INTO relates
VALUES ('', false, 'N', '86fb7292-c1fb-4087-a31d-b1721740e430', 'evilEr', 'c9f8edbb-fc13-4ffd-a8dc-ede917db4385',
        'evilEr');
INSERT INTO relates
VALUES ('', true, 'M', '86fb7292-c1fb-4087-a31d-b1721740e430', 'evilEr', '47165389-f81c-4d81-9183-bec59ed46593',
        'evilEr');
INSERT INTO object
VALUES (432.0, 432.0, '8f87c3a9-4721-4b8a-a3ae-e5a491ffb035', 'role', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, '86fb7292-c1fb-4087-a31d-b1721740e430', 'evilEr', '8f87c3a9-4721-4b8a-a3ae-e5a491ffb035', 'evilEr');
# ================ #
INSERT INTO object
VALUES (512.0, 432.0, '5171af51-d2d6-42df-9c5d-29d1e56aeb43', 'total', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, '86fb7292-c1fb-4087-a31d-b1721740e430', 'evilEr', '5171af51-d2d6-42df-9c5d-29d1e56aeb43', 'evilEr');
# ================ #
INSERT INTO object
VALUES (592.0, 432.0, '33a60c33-fcd8-4afe-a829-208ca8e6195e', 'cardinality', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, '86fb7292-c1fb-4087-a31d-b1721740e430', 'evilEr', '33a60c33-fcd8-4afe-a829-208ca8e6195e', 'evilEr');
# ================ #
# ================ #
INSERT INTO object
VALUES (1152.0, 0.0, 'b53d19de-f812-43bf-b11c-519e64224f2e', 'LAST_EDITED_BY', 'relationship', false, 'evilEr');
INSERT INTO relates
VALUES ('', false, '1', 'b53d19de-f812-43bf-b11c-519e64224f2e', 'evilEr', '276f80eb-8e41-4b95-b127-6589879ade97',
        'evilEr');
INSERT INTO relates
VALUES ('', false, 'N', 'b53d19de-f812-43bf-b11c-519e64224f2e', 'evilEr', 'ce4f428f-bcb7-4151-866c-0954218e0fe8',
        'evilEr');
INSERT INTO object
VALUES (1264.0, 0.0, 'd500347b-22b7-439d-b463-497554f55066', 'datetime', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, 'b53d19de-f812-43bf-b11c-519e64224f2e', 'evilEr', 'd500347b-22b7-439d-b463-497554f55066', 'evilEr');
# ================ #
# ================ #
INSERT INTO object
VALUES (1024.0, 80.0, 'b0e58fa1-0d2c-401d-8e5e-f1e9ce337055', 'CREATED_BY', 'relationship', false, 'evilEr');
INSERT INTO relates
VALUES ('', false, '', 'b0e58fa1-0d2c-401d-8e5e-f1e9ce337055', 'evilEr', '276f80eb-8e41-4b95-b127-6589879ade97',
        'evilEr');
INSERT INTO relates
VALUES ('', false, '', 'b0e58fa1-0d2c-401d-8e5e-f1e9ce337055', 'evilEr', '7266ad81-6419-4c93-8cb7-b655e36571d5',
        'evilEr');
INSERT INTO object
VALUES (1072.0, 48.0, '32c01276-16c4-4221-85ca-91c854a3c6f2', 'datetime', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, 'b0e58fa1-0d2c-401d-8e5e-f1e9ce337055', 'evilEr', '32c01276-16c4-4221-85ca-91c854a3c6f2', 'evilEr');
# ================ #
# ================ #
INSERT INTO object
VALUES (256.0, -48.0, 'e264bfa0-3fda-4c1c-bc00-bd2f0a42e471', 'FOREIGN', 'relationship', false, 'evilEr');
INSERT INTO relates
VALUES ('references', false, 'N', 'e264bfa0-3fda-4c1c-bc00-bd2f0a42e471', 'evilEr',
        '651276d1-8a0f-4ff9-a9c3-9075fd6b5326', 'evilEr');
INSERT INTO relates
VALUES ('by', false, 'M', 'e264bfa0-3fda-4c1c-bc00-bd2f0a42e471', 'evilEr', '651276d1-8a0f-4ff9-a9c3-9075fd6b5326',
        'evilEr');
INSERT INTO object
VALUES (208.0, -80.0, 'cda23c39-47a5-482e-9d55-688d498f1a25', 'role', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, 'e264bfa0-3fda-4c1c-bc00-bd2f0a42e471', 'evilEr', 'cda23c39-47a5-482e-9d55-688d498f1a25', 'evilEr');
# ================ #
INSERT INTO object
VALUES (304.0, -80.0, '1faaef05-2370-4c62-abc1-369ef614dc35', 'required', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, 'e264bfa0-3fda-4c1c-bc00-bd2f0a42e471', 'evilEr', '1faaef05-2370-4c62-abc1-369ef614dc35', 'evilEr');
# ================ #
# ================ #
INSERT INTO object
VALUES (384.0, 64.0, '6dad2b2c-2b84-4495-a3b9-39ea3096f027', 'BELONGS_TO', 'relationship', true, 'evilEr');
INSERT INTO relates
VALUES ('', false, '1', '6dad2b2c-2b84-4495-a3b9-39ea3096f027', 'evilEr', 'e71cbed4-8f6f-462c-be48-d41d776ab7f0',
        'evilEr');
INSERT INTO relates
VALUES ('', true, 'N', '6dad2b2c-2b84-4495-a3b9-39ea3096f027', 'evilEr', '651276d1-8a0f-4ff9-a9c3-9075fd6b5326',
        'evilEr');
# ================ #
INSERT INTO object
VALUES (256.0, 144.0, '353bf87f-8a87-429a-94da-72633a7a5515', 'COLUMN_OF', 'relationship', true, 'evilEr');
INSERT INTO relates
VALUES ('has', false, '1', '353bf87f-8a87-429a-94da-72633a7a5515', 'evilEr', '651276d1-8a0f-4ff9-a9c3-9075fd6b5326',
        'evilEr');
INSERT INTO relates
VALUES ('belongs to', true, 'N', '353bf87f-8a87-429a-94da-72633a7a5515', 'evilEr',
        'df42621f-4318-4c92-a77f-a79d477fdda7', 'evilEr');
# ================ #
INSERT INTO object
VALUES (1104.0, -32.0, '95f80a42-326c-4cee-a0aa-4be2cf42e55b', 'LAST_VIEW', 'relationship', false, 'evilEr');
INSERT INTO relates
VALUES ('', false, 'N', '95f80a42-326c-4cee-a0aa-4be2cf42e55b', 'evilEr', '276f80eb-8e41-4b95-b127-6589879ade97',
        'evilEr');
INSERT INTO relates
VALUES ('', false, 'M', '95f80a42-326c-4cee-a0aa-4be2cf42e55b', 'evilEr', 'ce4f428f-bcb7-4151-866c-0954218e0fe8',
        'evilEr');
INSERT INTO object
VALUES (1216.0, -32.0, 'efd907f4-01a2-4d3e-9e94-c41e21afc5f7', 'datetime', 'attribute', false, 'evilEr');
INSERT INTO attribute
VALUES (false, false, '95f80a42-326c-4cee-a0aa-4be2cf42e55b', 'evilEr', 'efd907f4-01a2-4d3e-9e94-c41e21afc5f7', 'evilEr');
# ================ #
# ================ #
INSERT INTO object
VALUES (640.0, 64.0, 'c06bf465-6675-4f3e-a180-8f0339b2da07', 'd', 'specialization', false, 'evilEr');
INSERT INTO specialization
VALUES (true, 'c06bf465-6675-4f3e-a180-8f0339b2da07', 'evilEr');
INSERT INTO relates
VALUES ('', true, '', 'c06bf465-6675-4f3e-a180-8f0339b2da07', 'evilEr', 'ce4f428f-bcb7-4151-866c-0954218e0fe8', 'evilEr');
INSERT INTO relates
VALUES ('', false, '', 'c06bf465-6675-4f3e-a180-8f0339b2da07', 'evilEr', 'da0285a4-053a-4c7d-93b7-533ee6fb8361',
        'evilEr');
INSERT INTO relates
VALUES ('', false, '', 'c06bf465-6675-4f3e-a180-8f0339b2da07', 'evilEr', 'e71cbed4-8f6f-462c-be48-d41d776ab7f0',
        'evilEr');
INSERT INTO relates
VALUES ('', false, '', 'c06bf465-6675-4f3e-a180-8f0339b2da07', 'evilEr', 'bd08a2d4-0284-4c08-ac4e-a9351f118c6d',
        'evilEr');
# ================ #
INSERT INTO object
VALUES (1152.0, 304.0, '5da3c175-bd6c-41ac-88b0-c24dc4f0cd97', 'o', 'specialization', false, 'evilEr');
INSERT INTO specialization
VALUES (false, '5da3c175-bd6c-41ac-88b0-c24dc4f0cd97', 'evilEr');
INSERT INTO relates
VALUES ('', false, '', '5da3c175-bd6c-41ac-88b0-c24dc4f0cd97', 'evilEr', '276f80eb-8e41-4b95-b127-6589879ade97',
        'evilEr');
INSERT INTO relates
VALUES ('', false, '', '5da3c175-bd6c-41ac-88b0-c24dc4f0cd97', 'evilEr', '366c5efe-d997-4fb2-87e1-8bc408acc8e3',
        'evilEr');
INSERT INTO relates
VALUES ('', false, '', '5da3c175-bd6c-41ac-88b0-c24dc4f0cd97', 'evilEr', '36724cc4-52bb-46f7-ab26-5cf7020ee426',
        'evilEr');
INSERT INTO relates
VALUES ('', false, '', '5da3c175-bd6c-41ac-88b0-c24dc4f0cd97', 'evilEr', '9a82988a-afb2-4329-805e-9b7d3374897f',
        'evilEr');
# ================ #
INSERT INTO object
VALUES (512.0, 320.0, '605ec0ec-5a83-4201-a10a-bcee20bdacda', 'd', 'specialization', false, 'evilEr');
INSERT INTO specialization
VALUES (true, '605ec0ec-5a83-4201-a10a-bcee20bdacda', 'evilEr');
INSERT INTO relates
VALUES ('', true, '', '605ec0ec-5a83-4201-a10a-bcee20bdacda', 'evilEr', 'b993a81d-f126-40f8-9709-f6ef9363db1d', 'evilEr');
INSERT INTO relates
VALUES ('', false, '', '605ec0ec-5a83-4201-a10a-bcee20bdacda', 'evilEr', 'ebd6f399-8ae3-4e21-a2ab-42ce6a71b58c',
        'evilEr');
INSERT INTO relates
VALUES ('', false, '', '605ec0ec-5a83-4201-a10a-bcee20bdacda', 'evilEr', 'c9f8edbb-fc13-4ffd-a8dc-ede917db4385',
        'evilEr');
INSERT INTO relates
VALUES ('', false, '', '605ec0ec-5a83-4201-a10a-bcee20bdacda', 'evilEr', '47165389-f81c-4d81-9183-bec59ed46593',
        'evilEr');
# ================ #
INSERT INTO object
VALUES (768.0, 384.0, '82a869e3-8ee1-48f6-a2cb-2dcc9c355c10', 'o', 'specialization', false, 'evilEr');
INSERT INTO specialization
VALUES (false, '82a869e3-8ee1-48f6-a2cb-2dcc9c355c10', 'evilEr');
INSERT INTO relates
VALUES ('', false, '', '82a869e3-8ee1-48f6-a2cb-2dcc9c355c10', 'evilEr', '47165389-f81c-4d81-9183-bec59ed46593',
        'evilEr');
INSERT INTO relates
VALUES ('', false, '', '82a869e3-8ee1-48f6-a2cb-2dcc9c355c10', 'evilEr', 'd2941ee6-3f05-42f3-bc2b-75954f9e96cc',
        'evilEr');
# ================ #
