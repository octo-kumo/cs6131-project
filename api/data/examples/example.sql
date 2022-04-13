USE evilEr;

INSERT INTO diagram (did, name, isER, cid)
VALUES ('example', 'Example ER', true, 'test');

INSERT INTO object VALUES (500.0, 200.0, '1aceb1f7-473e-45c9-93d2-5d49b719006c', 'Student', 'entity', false, 'example');
INSERT INTO object VALUES (500.0, 100.0, '9f36eec6-3f12-4f5f-81af-96b6caa8fdf7', 'id', 'attribute', false, 'example');
INSERT INTO attribute VALUES (true, false, '1aceb1f7-473e-45c9-93d2-5d49b719006c', '9f36eec6-3f12-4f5f-81af-96b6caa8fdf7', 'example');
# ================ #
INSERT INTO object VALUES (700.0, 200.0, '8c7b4ced-f3c4-4074-9abf-cf2a5e0b67db', 'majors', 'attribute', true, 'example');
INSERT INTO attribute VALUES (false, false, '1aceb1f7-473e-45c9-93d2-5d49b719006c', '8c7b4ced-f3c4-4074-9abf-cf2a5e0b67db', 'example');
# ================ #
# ================ #
INSERT INTO object VALUES (300.0, 200.0, '290bb8c6-d670-4195-94d7-7dd51f924393', 'Relative', 'entity', true, 'example');
INSERT INTO object VALUES (300.0, 100.0, 'd8fda736-24ee-4591-89e7-9fc237127241', 'name', 'attribute', false, 'example');
INSERT INTO attribute VALUES (true, false, '290bb8c6-d670-4195-94d7-7dd51f924393', 'd8fda736-24ee-4591-89e7-9fc237127241', 'example');
# ================ #
INSERT INTO object VALUES (140.0, 200.0, '5550b733-7243-438d-be77-95163d587ec8', 'relationship', 'attribute', false, 'example');
INSERT INTO attribute VALUES (false, false, '290bb8c6-d670-4195-94d7-7dd51f924393', '5550b733-7243-438d-be77-95163d587ec8', 'example');
# ================ #
# ================ #
INSERT INTO object VALUES (400.0, 300.0, 'dbc02f43-e47a-4f65-b782-5d7fcaf50032', 'Alumni', 'entity', false, 'example');
INSERT INTO object VALUES (400.0, 430.0, '6be8ef13-298f-42d0-ac92-a907a378564d', 'year', 'attribute', false, 'example');
INSERT INTO attribute VALUES (false, false, 'dbc02f43-e47a-4f65-b782-5d7fcaf50032', '6be8ef13-298f-42d0-ac92-a907a378564d', 'example');
# ================ #
INSERT INTO object VALUES (350.0, 400.0, 'ac185784-709b-47b9-b3bb-9e473c69a6a2', 'graduated', 'attribute', false, 'example');
INSERT INTO attribute VALUES (false, false, 'dbc02f43-e47a-4f65-b782-5d7fcaf50032', 'ac185784-709b-47b9-b3bb-9e473c69a6a2', 'example');
# ================ #
INSERT INTO object VALUES (450.0, 400.0, '1c0abca2-dd63-489f-9aaa-3232754f8d79', 'grades', 'attribute', true, 'example');
INSERT INTO attribute VALUES (false, false, 'dbc02f43-e47a-4f65-b782-5d7fcaf50032', '1c0abca2-dd63-489f-9aaa-3232754f8d79', 'example');
INSERT INTO object VALUES (450.0, 480.0, '115ff382-470e-43ba-889d-2a4e04291bf7', 'subject', 'attribute', false, 'example');
INSERT INTO attribute VALUES (false, false, '1c0abca2-dd63-489f-9aaa-3232754f8d79', '115ff382-470e-43ba-889d-2a4e04291bf7', 'example');
# ================ #
INSERT INTO object VALUES (530.0, 460.0, '82a99219-b6ac-4636-92ba-e981db91843d', 'cap', 'attribute', false, 'example');
INSERT INTO attribute VALUES (false, false, '1c0abca2-dd63-489f-9aaa-3232754f8d79', '82a99219-b6ac-4636-92ba-e981db91843d', 'example');
# ================ #
# ================ #
# ================ #
INSERT INTO object VALUES (600.0, 300.0, 'f26c0b0f-ed13-4a3c-8aab-ea517e05a57b', 'Dropout', 'entity', false, 'example');
INSERT INTO object VALUES (550.0, 400.0, '69078f13-57fd-4f37-800b-b37cdc6bb6e0', 'year', 'attribute', false, 'example');
INSERT INTO attribute VALUES (false, false, 'f26c0b0f-ed13-4a3c-8aab-ea517e05a57b', '69078f13-57fd-4f37-800b-b37cdc6bb6e0', 'example');
# ================ #
INSERT INTO object VALUES (650.0, 400.0, '5130a595-44dc-41fd-932c-ea8e28aaea17', 'reasons', 'attribute', true, 'example');
INSERT INTO attribute VALUES (false, false, 'f26c0b0f-ed13-4a3c-8aab-ea517e05a57b', '5130a595-44dc-41fd-932c-ea8e28aaea17', 'example');
# ================ #
# ================ #
INSERT INTO object VALUES (400.0, 100.0, '31029a13-deba-4964-be4e-10b5aa8bfc07', 'related to', 'relationship', true, 'example');
INSERT INTO relates VALUES ('', false, '1', '31029a13-deba-4964-be4e-10b5aa8bfc07', '1aceb1f7-473e-45c9-93d2-5d49b719006c', 'example');
INSERT INTO relates VALUES ('', true, 'N', '31029a13-deba-4964-be4e-10b5aa8bfc07', '290bb8c6-d670-4195-94d7-7dd51f924393', 'example');
# ================ #
INSERT INTO object VALUES (680.0, 150.0, '7b817652-3528-42e9-b262-ab0e0e10e866', 'knows', 'relationship', false, 'example');
INSERT INTO relates VALUES ('knows', false, '1', '7b817652-3528-42e9-b262-ab0e0e10e866', '1aceb1f7-473e-45c9-93d2-5d49b719006c', 'example');
INSERT INTO relates VALUES ('known_by', false, 'N', '7b817652-3528-42e9-b262-ab0e0e10e866', '1aceb1f7-473e-45c9-93d2-5d49b719006c', 'example');
# ================ #
INSERT INTO object VALUES (500.0, 250.0, '812f746e-2c2a-437d-83b0-21c80aed1de2', 'o', 'specialization', false, 'example');
INSERT INTO specialization VALUES (false, '812f746e-2c2a-437d-83b0-21c80aed1de2', 'example');
INSERT INTO relates VALUES ('', false, '', '812f746e-2c2a-437d-83b0-21c80aed1de2', '1aceb1f7-473e-45c9-93d2-5d49b719006c', 'example');
INSERT INTO relates VALUES ('', false, '', '812f746e-2c2a-437d-83b0-21c80aed1de2', 'dbc02f43-e47a-4f65-b782-5d7fcaf50032', 'example');
INSERT INTO relates VALUES ('', false, '', '812f746e-2c2a-437d-83b0-21c80aed1de2', 'f26c0b0f-ed13-4a3c-8aab-ea517e05a57b', 'example');
# ================ #
