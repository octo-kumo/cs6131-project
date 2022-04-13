USE evilEr;

INSERT INTO diagram (did, name, isER, cid)
VALUES ('zen', 'Genshin (Zen)', true, 'test');

INSERT INTO object VALUES (0.0, 96.0, '413df49a-5023-4489-9b6f-a0f1f6661cd9', 'Wishes', 'entity', false, 'zen');
INSERT INTO object VALUES (-48.0, 144.0, '63672678-b6c5-46a5-b28f-56dda32758e9', 'pull_time', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '413df49a-5023-4489-9b6f-a0f1f6661cd9', '63672678-b6c5-46a5-b28f-56dda32758e9', 'zen');
# ================ #
INSERT INTO object VALUES (48.0, 144.0, '5526a294-4c09-4dd4-840f-d762eba091a8', 'wish_id', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (true, false, '413df49a-5023-4489-9b6f-a0f1f6661cd9', '5526a294-4c09-4dd4-840f-d762eba091a8', 'zen');
# ================ #
# ================ #
INSERT INTO object VALUES (304.0, 96.0, '2a24f9a3-7bb0-4343-8c6a-27a94138f598', 'Pullable', 'entity', false, 'zen');
INSERT INTO object VALUES (353.4826975180396, 40.55304421751762, '9b2b14c9-568d-4f0e-a4d0-c7542db4c5f2', 'name', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (true, false, '2a24f9a3-7bb0-4343-8c6a-27a94138f598', '9b2b14c9-568d-4f0e-a4d0-c7542db4c5f2', 'zen');
# ================ #
INSERT INTO object VALUES (437.54138055509026, 30.020077885950087, 'a4b7f0fb-e5a2-4299-8de2-dfca507e1559', 'is_limited', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '2a24f9a3-7bb0-4343-8c6a-27a94138f598', 'a4b7f0fb-e5a2-4299-8de2-dfca507e1559', 'zen');
# ================ #
INSERT INTO object VALUES (431.88072890884723, 67.68304880934622, 'feea6e8a-bad5-46fa-a6b7-ef16eb225e99', 'rarity', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '2a24f9a3-7bb0-4343-8c6a-27a94138f598', 'feea6e8a-bad5-46fa-a6b7-ef16eb225e99', 'zen');
# ================ #
INSERT INTO object VALUES (402.7080667327935, 102.00831928850482, 'bda90afd-1d12-4c59-9b41-46f79805fa09', 'images', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '2a24f9a3-7bb0-4343-8c6a-27a94138f598', 'bda90afd-1d12-4c59-9b41-46f79805fa09', 'zen');
INSERT INTO object VALUES (382.87074296514834, 140.13295340126533, '0464ccea-81df-4706-ad01-3e703603bf5d', 'full_img', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, 'bda90afd-1d12-4c59-9b41-46f79805fa09', '0464ccea-81df-4706-ad01-3e703603bf5d', 'zen');
# ================ #
INSERT INTO object VALUES (464.0, 126.70653927325412, '16c4848c-cfe9-462a-a0f8-4a57b57aefa2', 'icon_img', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, 'bda90afd-1d12-4c59-9b41-46f79805fa09', '16c4848c-cfe9-462a-a0f8-4a57b57aefa2', 'zen');
# ================ #
# ================ #
# ================ #
INSERT INTO object VALUES (0.0, -160.0, '9825497e-0799-4573-979f-5f60cceb7037', 'Game Account', 'entity', true, 'zen');
INSERT INTO object VALUES (96.0, -208.0, 'fb718a4d-db4c-4e03-93f4-25985c389caa', 'last_synced', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '9825497e-0799-4573-979f-5f60cceb7037', 'fb718a4d-db4c-4e03-93f4-25985c389caa', 'zen');
# ================ #
INSERT INTO object VALUES (112.0, -160.0, 'f2c1b1ee-f3d8-4dcf-93be-013838cd2332', 'region', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, true, '9825497e-0799-4573-979f-5f60cceb7037', 'f2c1b1ee-f3d8-4dcf-93be-013838cd2332', 'zen');
# ================ #
INSERT INTO object VALUES (96.0, -112.0, '9714782b-6e74-4c7d-81c8-4d4b88997e4f', 'uid', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (true, false, '9825497e-0799-4573-979f-5f60cceb7037', '9714782b-6e74-4c7d-81c8-4d4b88997e4f', 'zen');
# ================ #
# ================ #
INSERT INTO object VALUES (-336.0, 94.24191308408933, 'ecfbd2be-8216-4f47-8654-db1adc061a5d', 'Banner', 'entity', false, 'zen');
INSERT INTO object VALUES (-336.0, 142.24191308408933, '5ff1d6be-c086-4fef-acb5-a5b0df0a1916', 'id', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (true, false, 'ecfbd2be-8216-4f47-8654-db1adc061a5d', '5ff1d6be-c086-4fef-acb5-a5b0df0a1916', 'zen');
# ================ #
# ================ #
INSERT INTO object VALUES (0.0, -304.0, '6a4d9eee-7e07-4669-af77-49e53ad38dab', 'User', 'entity', false, 'zen');
INSERT INTO object VALUES (72.9784225971784, -374.52320001576805, 'b12db54d-b5dc-45d8-9f81-25b8fed16635', 'pfp_url', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '6a4d9eee-7e07-4669-af77-49e53ad38dab', 'b12db54d-b5dc-45d8-9f81-25b8fed16635', 'zen');
# ================ #
INSERT INTO object VALUES (84.92011490426472, -332.69019094001226, '88e13ff2-6f0c-409f-8895-74a29c487da7', 'user_id', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (true, false, '6a4d9eee-7e07-4669-af77-49e53ad38dab', '88e13ff2-6f0c-409f-8895-74a29c487da7', 'zen');
# ================ #
INSERT INTO object VALUES (-0.11808528253317263, -351.3815354206691, '16adbca0-1b9e-4255-b4d7-974699651244', 'email', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '6a4d9eee-7e07-4669-af77-49e53ad38dab', '16adbca0-1b9e-4255-b4d7-974699651244', 'zen');
# ================ #
INSERT INTO object VALUES (-65.31527495911018, -368.9973858736691, '0ca232e1-e6cd-40a5-808e-b6486bc49308', 'username', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '6a4d9eee-7e07-4669-af77-49e53ad38dab', '0ca232e1-e6cd-40a5-808e-b6486bc49308', 'zen');
# ================ #
INSERT INTO object VALUES (-85.78674748554386, -330.835890892328, 'c40c5dbf-5318-4f82-8cd9-6c9eac1cde2c', 'pw', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '6a4d9eee-7e07-4669-af77-49e53ad38dab', 'c40c5dbf-5318-4f82-8cd9-6c9eac1cde2c', 'zen');
# ================ #
# ================ #
INSERT INTO object VALUES (-336.0, -160.0, '23c7f40a-2f28-46c0-b087-0af167e0b150', 'Event Banner', 'entity', false, 'zen');
# ================ #
INSERT INTO object VALUES (-448.0, -64.0, '4d7480ff-e6b6-4e8b-b75a-b9979b44c89a', 'Permanent Banner', 'entity', false, 'zen');
INSERT INTO object VALUES (-464.0, 16.0, 'e5f83f7a-6ae2-4912-ae7a-b4dd4e8aacca', 'bnr_name', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '4d7480ff-e6b6-4e8b-b75a-b9979b44c89a', 'e5f83f7a-6ae2-4912-ae7a-b4dd4e8aacca', 'zen');
# ================ #
INSERT INTO object VALUES (-416.0, -16.0, '282665d3-f8dc-484a-bd48-00dac7428a62', 'img_url', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '4d7480ff-e6b6-4e8b-b75a-b9979b44c89a', '282665d3-f8dc-484a-bd48-00dac7428a62', 'zen');
# ================ #
# ================ #
INSERT INTO object VALUES (-336.0, -432.0, '17a3b84c-7da7-4142-b51a-42756d801bea', 'Event Info', 'entity', false, 'zen');
INSERT INTO object VALUES (-389.40384137330545, -492.8210415640425, '2e18bf0e-7e9d-4a86-a7f7-3f86658f60b6', 'event_id', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (true, false, '17a3b84c-7da7-4142-b51a-42756d801bea', '2e18bf0e-7e9d-4a86-a7f7-3f86658f60b6', 'zen');
# ================ #
INSERT INTO object VALUES (-436.8739225940215, -455.73504061035806, 'd6624937-b039-409d-bd3a-0abe884dbf28', 'event_name', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '17a3b84c-7da7-4142-b51a-42756d801bea', 'd6624937-b039-409d-bd3a-0abe884dbf28', 'zen');
# ================ #
INSERT INTO object VALUES (-439.84080267031635, -406.7815193514946, '87a9bd5c-6651-4d01-9435-6234cdcbc941', 'img_url', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '17a3b84c-7da7-4142-b51a-42756d801bea', '87a9bd5c-6651-4d01-9435-6234cdcbc941', 'zen');
# ================ #
INSERT INTO object VALUES (-303.0622891252899, -482.5992767582485, 'b8f9a001-0316-4723-a5e7-7e970145b301', 'duration', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '17a3b84c-7da7-4142-b51a-42756d801bea', 'b8f9a001-0316-4723-a5e7-7e970145b301', 'zen');
INSERT INTO object VALUES (-240.0, -512.0, '7d0e644b-8d98-4ff6-994f-dfc2c81244b2', 'start_time', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, 'b8f9a001-0316-4723-a5e7-7e970145b301', '7d0e644b-8d98-4ff6-994f-dfc2c81244b2', 'zen');
# ================ #
INSERT INTO object VALUES (-321.6052896021322, -521.910437769154, '322e42d7-1c78-429c-b98f-dc24c3f562de', 'end_time', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, 'b8f9a001-0316-4723-a5e7-7e970145b301', '322e42d7-1c78-429c-b98f-dc24c3f562de', 'zen');
# ================ #
# ================ #
# ================ #
INSERT INTO object VALUES (128.0, 288.0, 'a10a4bc3-2314-4a0b-82f6-e03e4a0919dc', 'Weapons', 'entity', false, 'zen');
INSERT INTO object VALUES (235.30011365469318, 297.42392558469345, '90680cc7-dde0-4217-bd95-68d6e0321a15', 'desc', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, 'a10a4bc3-2314-4a0b-82f6-e03e4a0919dc', '90680cc7-dde0-4217-bd95-68d6e0321a15', 'zen');
# ================ #
INSERT INTO object VALUES (150.60140037214148, 223.93821271420268, '115c28d8-b7eb-47d4-ac86-421b1dc60b47', 'ability_desc', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, 'a10a4bc3-2314-4a0b-82f6-e03e4a0919dc', '115c28d8-b7eb-47d4-ac86-421b1dc60b47', 'zen');
# ================ #
INSERT INTO object VALUES (224.4117773933317, 262.470259512986, '7482ec21-c0a9-43d2-b2fd-9244e6f816e0', 'base_atk', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, 'a10a4bc3-2314-4a0b-82f6-e03e4a0919dc', '7482ec21-c0a9-43d2-b2fd-9244e6f816e0', 'zen');
# ================ #
INSERT INTO object VALUES (77.92727973215648, 242.94808308364364, '504cca57-b066-4195-8422-556eb69d1357', 'sec_stat', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, 'a10a4bc3-2314-4a0b-82f6-e03e4a0919dc', '504cca57-b066-4195-8422-556eb69d1357', 'zen');
INSERT INTO object VALUES (85.14678842001922, 200.6700419964433, '65f4e2a5-514f-41dd-bca2-47e0c77b6f16', 'sec_val', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '504cca57-b066-4195-8422-556eb69d1357', '65f4e2a5-514f-41dd-bca2-47e0c77b6f16', 'zen');
# ================ #
INSERT INTO object VALUES (6.494737296117762, 221.43820253050657, 'd773c87b-6803-49f4-b80c-040e7dedce09', 'sec_name', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '504cca57-b066-4195-8422-556eb69d1357', 'd773c87b-6803-49f4-b80c-040e7dedce09', 'zen');
# ================ #
# ================ #
# ================ #
INSERT INTO object VALUES (480.0, 288.0, '3a3ce674-803c-4542-8c73-71382985be54', 'Characters', 'entity', false, 'zen');
INSERT INTO object VALUES (467.7094223104872, 229.56657405855606, '0c893f5d-3804-49f2-a5bd-a385ec953db8', 'element', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '3a3ce674-803c-4542-8c73-71382985be54', '0c893f5d-3804-49f2-a5bd-a385ec953db8', 'zen');
# ================ #
INSERT INTO object VALUES (386.464180885211, 260.6660788811854, '37757221-5512-4aba-96fe-c4db0296f94e', 'desc', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '3a3ce674-803c-4542-8c73-71382985be54', '37757221-5512-4aba-96fe-c4db0296f94e', 'zen');
# ================ #
INSERT INTO object VALUES (544.0, 224.0, '454367ed-c1b1-42db-b661-17fcb9510f91', 'base_stats', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '3a3ce674-803c-4542-8c73-71382985be54', '454367ed-c1b1-42db-b661-17fcb9510f91', 'zen');
INSERT INTO object VALUES (512.0, 192.0, '2d104f25-8fda-4460-9d44-a350360b612e', 'base_hp', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '454367ed-c1b1-42db-b661-17fcb9510f91', '2d104f25-8fda-4460-9d44-a350360b612e', 'zen');
# ================ #
INSERT INTO object VALUES (582.4673036337297, 174.70653927325407, '3d36bb3a-2e25-47b6-bca6-b12308a51b44', 'base_def', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '454367ed-c1b1-42db-b661-17fcb9510f91', '3d36bb3a-2e25-47b6-bca6-b12308a51b44', 'zen');
# ================ #
INSERT INTO object VALUES (621.4130785465081, 204.1196178197622, '0ec0d238-ba70-461c-ba54-5e174310d020', 'base_atk', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '454367ed-c1b1-42db-b661-17fcb9510f91', '0ec0d238-ba70-461c-ba54-5e174310d020', 'zen');
# ================ #
# ================ #
INSERT INTO object VALUES (626.4167678178471, 243.75745985815126, '2458e0bc-b6f7-4b46-a611-2f691e0dcaf2', 'asc_stat', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '3a3ce674-803c-4542-8c73-71382985be54', '2458e0bc-b6f7-4b46-a611-2f691e0dcaf2', 'zen');
INSERT INTO object VALUES (712.7110636657554, 254.44151553455902, '5112c735-b842-4717-8486-32a72fe1e916', 'asc_hp', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '2458e0bc-b6f7-4b46-a611-2f691e0dcaf2', '5112c735-b842-4717-8486-32a72fe1e916', 'zen');
# ================ #
INSERT INTO object VALUES (715.1766149756958, 286.49368256378193, 'dd5f2593-5ada-4d56-8d33-db650c797153', 'asc_def', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '2458e0bc-b6f7-4b46-a611-2f691e0dcaf2', 'dd5f2593-5ada-4d56-8d33-db650c797153', 'zen');
# ================ #
INSERT INTO object VALUES (710.2455123558154, 329.22990526941294, 'a6e0978d-96a1-4f89-842f-63032555f66f', 'asc_atk', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '2458e0bc-b6f7-4b46-a611-2f691e0dcaf2', 'a6e0978d-96a1-4f89-842f-63032555f66f', 'zen');
# ================ #
INSERT INTO object VALUES (642.0319261141354, 309.50549478989126, '8642afe2-548e-4448-9545-ea64e5bc25fd', 'sec_stat', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '2458e0bc-b6f7-4b46-a611-2f691e0dcaf2', '8642afe2-548e-4448-9545-ea64e5bc25fd', 'zen');
# ================ #
INSERT INTO object VALUES (582.8586946755695, 284.02813125384193, 'c628ba17-ad58-4e05-8d3c-ebdc46bb6505', 'sec_val', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '2458e0bc-b6f7-4b46-a611-2f691e0dcaf2', 'c628ba17-ad58-4e05-8d3c-ebdc46bb6505', 'zen');
# ================ #
# ================ #
# ================ #
INSERT INTO object VALUES (560.0, 512.0, '7b8e9b86-d46e-4e82-bcb5-54c20d37aecf', 'Character Level', 'entity', true, 'zen');
INSERT INTO object VALUES (512.0, 560.0, '67efcb50-952a-4f24-aade-9335f14e0a9c', 'char_lvl', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (true, false, '7b8e9b86-d46e-4e82-bcb5-54c20d37aecf', '67efcb50-952a-4f24-aade-9335f14e0a9c', 'zen');
# ================ #
INSERT INTO object VALUES (608.0, 560.0, '193566a5-762f-4c09-b033-b263906384ba', 'lvl_ratio', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '7b8e9b86-d46e-4e82-bcb5-54c20d37aecf', '193566a5-762f-4c09-b033-b263906384ba', 'zen');
# ================ #
# ================ #
INSERT INTO object VALUES (368.0, 432.0, 'abd236e9-e40d-4ff4-9a6b-f5ba0e163249', 'Character Talent', 'entity', true, 'zen');
INSERT INTO object VALUES (272.0, 416.0, 'cf5a82f9-c754-4b6e-a735-cb2e3869eb7a', 'tal_desc', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, 'abd236e9-e40d-4ff4-9a6b-f5ba0e163249', 'cf5a82f9-c754-4b6e-a735-cb2e3869eb7a', 'zen');
# ================ #
INSERT INTO object VALUES (464.0, 416.0, 'c2c2b993-915d-4a28-9fa3-d492ebdb9f6d', 'tal_name', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, 'abd236e9-e40d-4ff4-9a6b-f5ba0e163249', 'c2c2b993-915d-4a28-9fa3-d492ebdb9f6d', 'zen');
# ================ #
INSERT INTO object VALUES (432.0, 384.0, '49150ee2-6ae4-4bf7-a2de-6e6853a9e4e7', 'img_url', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, 'abd236e9-e40d-4ff4-9a6b-f5ba0e163249', '49150ee2-6ae4-4bf7-a2de-6e6853a9e4e7', 'zen');
# ================ #
INSERT INTO object VALUES (304.0, 384.0, 'd0dedc26-f7c8-4279-8f35-f41d770bfb8c', 'tal_type', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (true, false, 'abd236e9-e40d-4ff4-9a6b-f5ba0e163249', 'd0dedc26-f7c8-4279-8f35-f41d770bfb8c', 'zen');
# ================ #
# ================ #
INSERT INTO object VALUES (784.0, 384.0, '9669cf85-c2e1-4303-9a34-342c6ec780c3', 'Character Constellation', 'entity', true, 'zen');
INSERT INTO object VALUES (733.8671233645484, 431.66732532551134, '601ed5d6-6db6-47b2-a8f2-ca5fc0951b2e', 'cons_no', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (true, false, '9669cf85-c2e1-4303-9a34-342c6ec780c3', '601ed5d6-6db6-47b2-a8f2-ca5fc0951b2e', 'zen');
# ================ #
INSERT INTO object VALUES (784.0, 466.1850436646748, '73020083-f359-4445-9473-7142b8fb75bd', 'cons_desc', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '9669cf85-c2e1-4303-9a34-342c6ec780c3', '73020083-f359-4445-9473-7142b8fb75bd', 'zen');
# ================ #
INSERT INTO object VALUES (842.3513810019192, 432.4891757621581, '82e6c6f5-0ab7-4d6f-9673-a442ee17fb80', 'img_url', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '9669cf85-c2e1-4303-9a34-342c6ec780c3', '82e6c6f5-0ab7-4d6f-9673-a442ee17fb80', 'zen');
# ================ #
# ================ #
INSERT INTO object VALUES (368.0, 560.0, 'a62173b9-a98d-4424-a6f3-026d7446f69b', 'Talent Stat', 'entity', true, 'zen');
INSERT INTO object VALUES (368.0, 640.0, '62d53d39-2eaf-4703-baf9-805ac2f20a9d', 'stat_lvl', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (true, false, 'a62173b9-a98d-4424-a6f3-026d7446f69b', '62d53d39-2eaf-4703-baf9-805ac2f20a9d', 'zen');
# ================ #
INSERT INTO object VALUES (432.0, 608.0, 'f48b0533-82fd-45ac-96ca-2687becdd765', 'stat_val', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, 'a62173b9-a98d-4424-a6f3-026d7446f69b', 'f48b0533-82fd-45ac-96ca-2687becdd765', 'zen');
# ================ #
INSERT INTO object VALUES (304.0, 608.0, '603499ca-d5de-4e90-aa67-748f5c3c2db1', 'stat_name', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (true, false, 'a62173b9-a98d-4424-a6f3-026d7446f69b', '603499ca-d5de-4e90-aa67-748f5c3c2db1', 'zen');
# ================ #
# ================ #
INSERT INTO object VALUES (-144.0, 288.0, 'd2087358-cb22-463d-b48d-6bd275ee15b5', 'Weapon Level', 'entity', true, 'zen');
INSERT INTO object VALUES (-96.0, 352.0, '7765cc27-4d44-45ff-9825-2543ff3b776d', 'wep_lvl', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (true, false, 'd2087358-cb22-463d-b48d-6bd275ee15b5', '7765cc27-4d44-45ff-9825-2543ff3b776d', 'zen');
# ================ #
INSERT INTO object VALUES (-192.0, 352.0, '7f39ef2e-d873-4ca0-b7c5-efe69f597647', 'lvl_ratio', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, 'd2087358-cb22-463d-b48d-6bd275ee15b5', '7f39ef2e-d873-4ca0-b7c5-efe69f597647', 'zen');
# ================ #
# ================ #
INSERT INTO object VALUES (128.0, 416.0, 'dd645317-e2aa-465d-848f-ed06b6677cde', 'Weapon Ascension', 'entity', true, 'zen');
INSERT INTO object VALUES (176.0, 464.0, '65ec3cf1-86ed-4892-9cb4-d8a2cb3cecc9', 'asc_atk', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, 'dd645317-e2aa-465d-848f-ed06b6677cde', '65ec3cf1-86ed-4892-9cb4-d8a2cb3cecc9', 'zen');
# ================ #
INSERT INTO object VALUES (80.0, 464.0, 'acc728a9-cfbe-4806-b494-ebe1edb88ce2', 'wep_asc', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (true, false, 'dd645317-e2aa-465d-848f-ed06b6677cde', 'acc728a9-cfbe-4806-b494-ebe1edb88ce2', 'zen');
# ================ #
# ================ #
INSERT INTO object VALUES (-176.0, 96.0, 'e51948cb-35cb-4c47-914c-063d528d1d59', 'Wish on', 'relationship', false, 'zen');
INSERT INTO relates VALUES ('', true, 'N', 'e51948cb-35cb-4c47-914c-063d528d1d59', '413df49a-5023-4489-9b6f-a0f1f6661cd9', 'zen');
INSERT INTO relates VALUES ('', false, '1', 'e51948cb-35cb-4c47-914c-063d528d1d59', 'ecfbd2be-8216-4f47-8654-db1adc061a5d', 'zen');
# ================ #
INSERT INTO object VALUES (160.0, 96.0, '427b2313-2dd8-4929-9858-af7bffe744b9', 'Pull of', 'relationship', false, 'zen');
INSERT INTO relates VALUES ('', true, 'N', '427b2313-2dd8-4929-9858-af7bffe744b9', '413df49a-5023-4489-9b6f-a0f1f6661cd9', 'zen');
INSERT INTO relates VALUES ('', false, '1', '427b2313-2dd8-4929-9858-af7bffe744b9', '2a24f9a3-7bb0-4343-8c6a-27a94138f598', 'zen');
# ================ #
INSERT INTO object VALUES (0.0, -16.0, 'aa60c6cc-9a5b-480c-873d-6397ba40b68b', 'Wish of', 'relationship', false, 'zen');
INSERT INTO relates VALUES ('', false, '1', 'aa60c6cc-9a5b-480c-873d-6397ba40b68b', '9825497e-0799-4573-979f-5f60cceb7037', 'zen');
INSERT INTO relates VALUES ('', true, 'N', 'aa60c6cc-9a5b-480c-873d-6397ba40b68b', '413df49a-5023-4489-9b6f-a0f1f6661cd9', 'zen');
# ================ #
INSERT INTO object VALUES (0.0, -224.0, 'fb814cab-8171-4622-bff6-e6a806b1295a', 'Account of', 'relationship', true, 'zen');
INSERT INTO relates VALUES ('', true, 'N', 'fb814cab-8171-4622-bff6-e6a806b1295a', '9825497e-0799-4573-979f-5f60cceb7037', 'zen');
INSERT INTO relates VALUES ('', false, '1', 'fb814cab-8171-4622-bff6-e6a806b1295a', '6a4d9eee-7e07-4669-af77-49e53ad38dab', 'zen');
# ================ #
INSERT INTO object VALUES (-176.0, -16.0, 'e9b2686a-90b8-4cbf-b758-59e2c26ba275', 'Pity Count', 'relationship', false, 'zen');
INSERT INTO relates VALUES ('', false, 'N', 'e9b2686a-90b8-4cbf-b758-59e2c26ba275', 'ecfbd2be-8216-4f47-8654-db1adc061a5d', 'zen');
INSERT INTO relates VALUES ('', false, 'M', 'e9b2686a-90b8-4cbf-b758-59e2c26ba275', '9825497e-0799-4573-979f-5f60cceb7037', 'zen');
INSERT INTO object VALUES (-176.0, -64.0, '8f36cea5-b32f-4c3d-943d-80e1c975e2c1', 'four_star', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, true, 'e9b2686a-90b8-4cbf-b758-59e2c26ba275', '8f36cea5-b32f-4c3d-943d-80e1c975e2c1', 'zen');
# ================ #
INSERT INTO object VALUES (-256.0, -48.0, '15ac305e-8427-44e1-ab22-f66bba832d50', 'five_star', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, true, 'e9b2686a-90b8-4cbf-b758-59e2c26ba275', '15ac305e-8427-44e1-ab22-f66bba832d50', 'zen');
# ================ #
# ================ #
INSERT INTO object VALUES (-176.0, -160.0, '866552bf-9685-42cc-ab5d-46e75791b36b', 'Guaranteed', 'relationship', false, 'zen');
INSERT INTO relates VALUES ('', false, 'N', '866552bf-9685-42cc-ab5d-46e75791b36b', '23c7f40a-2f28-46c0-b087-0af167e0b150', 'zen');
INSERT INTO relates VALUES ('', false, 'M', '866552bf-9685-42cc-ab5d-46e75791b36b', '9825497e-0799-4573-979f-5f60cceb7037', 'zen');
INSERT INTO object VALUES (-128.0, -192.0, '220359ee-028e-4eac-ab48-90069550c9c7', 'four_star', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, true, '866552bf-9685-42cc-ab5d-46e75791b36b', '220359ee-028e-4eac-ab48-90069550c9c7', 'zen');
# ================ #
INSERT INTO object VALUES (-224.0, -192.0, '323d03d4-9398-427b-99c8-220598227bb1', 'five_star', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, true, '866552bf-9685-42cc-ab5d-46e75791b36b', '323d03d4-9398-427b-99c8-220598227bb1', 'zen');
# ================ #
# ================ #
INSERT INTO object VALUES (-336.0, -288.0, '1c1b8f0a-0586-4749-b0fd-0f5c31729fb5', 'Event Type', 'relationship', false, 'zen');
INSERT INTO relates VALUES ('', true, '1', '1c1b8f0a-0586-4749-b0fd-0f5c31729fb5', '23c7f40a-2f28-46c0-b087-0af167e0b150', 'zen');
INSERT INTO relates VALUES ('', true, 'N', '1c1b8f0a-0586-4749-b0fd-0f5c31729fb5', '17a3b84c-7da7-4142-b51a-42756d801bea', 'zen');
# ================ #
INSERT INTO object VALUES (304.0, -432.0, '21092661-3479-4519-8753-0cded0be1265', 'Wish Pool', 'relationship', false, 'zen');
INSERT INTO relates VALUES ('', true, 'N', '21092661-3479-4519-8753-0cded0be1265', '17a3b84c-7da7-4142-b51a-42756d801bea', 'zen');
INSERT INTO relates VALUES ('', false, 'M', '21092661-3479-4519-8753-0cded0be1265', '2a24f9a3-7bb0-4343-8c6a-27a94138f598', 'zen');
INSERT INTO object VALUES (304.2262454332491, -487.44871326377586, '096d1da6-da94-47c6-bb58-b13af411e634', 'is_featured', 'attribute', false, 'zen');
INSERT INTO attribute VALUES (false, false, '21092661-3479-4519-8753-0cded0be1265', '096d1da6-da94-47c6-bb58-b13af411e634', 'zen');
# ================ #
# ================ #
INSERT INTO object VALUES (624.0, 384.0, '98fb52b3-a5d8-4b2d-80e4-619787f3b4f7', 'Cons of', 'relationship', true, 'zen');
INSERT INTO relates VALUES ('', true, 'N', '98fb52b3-a5d8-4b2d-80e4-619787f3b4f7', '9669cf85-c2e1-4303-9a34-342c6ec780c3', 'zen');
INSERT INTO relates VALUES ('', true, '1', '98fb52b3-a5d8-4b2d-80e4-619787f3b4f7', '3a3ce674-803c-4542-8c73-71382985be54', 'zen');
# ================ #
INSERT INTO object VALUES (368.0, 352.0, 'ed149235-3ce3-4f2b-8e7f-ded25538d79c', 'Tals of', 'relationship', true, 'zen');
INSERT INTO relates VALUES ('', true, 'N', 'ed149235-3ce3-4f2b-8e7f-ded25538d79c', 'abd236e9-e40d-4ff4-9a6b-f5ba0e163249', 'zen');
INSERT INTO relates VALUES ('', true, '1', 'ed149235-3ce3-4f2b-8e7f-ded25538d79c', '3a3ce674-803c-4542-8c73-71382985be54', 'zen');
# ================ #
INSERT INTO object VALUES (560.0, 448.0, '62b56a68-a5e7-4a9d-9cda-afea7834f571', 'Level of', 'relationship', true, 'zen');
INSERT INTO relates VALUES ('', true, 'N', '62b56a68-a5e7-4a9d-9cda-afea7834f571', '7b8e9b86-d46e-4e82-bcb5-54c20d37aecf', 'zen');
INSERT INTO relates VALUES ('', true, '1', '62b56a68-a5e7-4a9d-9cda-afea7834f571', '3a3ce674-803c-4542-8c73-71382985be54', 'zen');
# ================ #
INSERT INTO object VALUES (368.0, 496.0, 'baa7c9de-8016-4258-ad60-36071a19abce', 'Stats of', 'relationship', true, 'zen');
INSERT INTO relates VALUES ('', true, 'N', 'baa7c9de-8016-4258-ad60-36071a19abce', 'a62173b9-a98d-4424-a6f3-026d7446f69b', 'zen');
INSERT INTO relates VALUES ('', false, '1', 'baa7c9de-8016-4258-ad60-36071a19abce', 'abd236e9-e40d-4ff4-9a6b-f5ba0e163249', 'zen');
# ================ #
INSERT INTO object VALUES (128.0, 352.0, '1a3c4806-4301-4579-9d8c-e2ce74c4d0d3', 'Ascension of', 'relationship', true, 'zen');
INSERT INTO relates VALUES ('', true, '1', '1a3c4806-4301-4579-9d8c-e2ce74c4d0d3', 'a10a4bc3-2314-4a0b-82f6-e03e4a0919dc', 'zen');
INSERT INTO relates VALUES ('', true, 'N', '1a3c4806-4301-4579-9d8c-e2ce74c4d0d3', 'dd645317-e2aa-465d-848f-ed06b6677cde', 'zen');
# ================ #
INSERT INTO object VALUES (0.0, 288.0, 'd36a691a-5f31-41b2-bb61-bd0e80426483', 'Level of', 'relationship', true, 'zen');
INSERT INTO relates VALUES ('', true, '1', 'd36a691a-5f31-41b2-bb61-bd0e80426483', 'a10a4bc3-2314-4a0b-82f6-e03e4a0919dc', 'zen');
INSERT INTO relates VALUES ('', true, 'N', 'd36a691a-5f31-41b2-bb61-bd0e80426483', 'd2087358-cb22-463d-b48d-6bd275ee15b5', 'zen');
# ================ #
INSERT INTO object VALUES (-336.0, -64.0, 'bfdac73f-bebb-4112-ad99-614aa9c31017', 'd', 'specialization', false, 'zen');
INSERT INTO specialization VALUES (true, 'bfdac73f-bebb-4112-ad99-614aa9c31017', 'zen');
INSERT INTO relates VALUES ('', false, '', 'bfdac73f-bebb-4112-ad99-614aa9c31017', 'ecfbd2be-8216-4f47-8654-db1adc061a5d', 'zen');
INSERT INTO relates VALUES ('', false, '', 'bfdac73f-bebb-4112-ad99-614aa9c31017', '23c7f40a-2f28-46c0-b087-0af167e0b150', 'zen');
INSERT INTO relates VALUES ('', false, '', 'bfdac73f-bebb-4112-ad99-614aa9c31017', '4d7480ff-e6b6-4e8b-b75a-b9979b44c89a', 'zen');
# ================ #
INSERT INTO object VALUES (304.0, 160.0, '4a592c9f-3ae3-4902-9e7d-3290da5d0ef6', 'd', 'specialization', false, 'zen');
INSERT INTO specialization VALUES (true, '4a592c9f-3ae3-4902-9e7d-3290da5d0ef6', 'zen');
INSERT INTO relates VALUES ('', false, '', '4a592c9f-3ae3-4902-9e7d-3290da5d0ef6', '2a24f9a3-7bb0-4343-8c6a-27a94138f598', 'zen');
INSERT INTO relates VALUES ('', false, '', '4a592c9f-3ae3-4902-9e7d-3290da5d0ef6', 'a10a4bc3-2314-4a0b-82f6-e03e4a0919dc', 'zen');
INSERT INTO relates VALUES ('', false, '', '4a592c9f-3ae3-4902-9e7d-3290da5d0ef6', '3a3ce674-803c-4542-8c73-71382985be54', 'zen');
# ================ #
