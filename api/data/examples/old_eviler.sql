USE evilEr;

INSERT INTO diagram (did, name, isER, cid)
VALUES ('older', 'Old Evil ER', true, 'test');

INSERT INTO object VALUES (560.0, 140.0, 'c7c8d794-1e28-460a-be37-42dc2a1c8eb1', 'ER Diagram', 'entity', false, 'older');
# ================ #
INSERT INTO object VALUES (1200.0, 140.0, '8ca9253e-5bef-4c5a-a4cc-e05274ab1966', 'User', 'entity', false, 'older');
INSERT INTO object VALUES (1260.0, 360.0, '0f77abee-3a56-46f5-99a4-61b61a8015e1', 'uid', 'attribute', false, 'older');
INSERT INTO attribute VALUES (true, false, '8ca9253e-5bef-4c5a-a4cc-e05274ab1966', '0f77abee-3a56-46f5-99a4-61b61a8015e1', 'older');
# ================ #
INSERT INTO object VALUES (1260.0, 200.0, 'd7453143-0009-4e04-80f6-0fe6345ea703', 'name', 'attribute', false, 'older');
INSERT INTO attribute VALUES (false, false, '8ca9253e-5bef-4c5a-a4cc-e05274ab1966', 'd7453143-0009-4e04-80f6-0fe6345ea703', 'older');
# ================ #
INSERT INTO object VALUES (1260.0, 320.0, 'd34570f2-a686-4772-899d-22d51ec4a2b5', 'pfp', 'attribute', false, 'older');
INSERT INTO attribute VALUES (false, false, '8ca9253e-5bef-4c5a-a4cc-e05274ab1966', 'd34570f2-a686-4772-899d-22d51ec4a2b5', 'older');
# ================ #
INSERT INTO object VALUES (1260.0, 240.0, '9093fc21-6a3b-4db2-b465-4cecf437cf04', 'email', 'attribute', false, 'older');
INSERT INTO attribute VALUES (false, false, '8ca9253e-5bef-4c5a-a4cc-e05274ab1966', '9093fc21-6a3b-4db2-b465-4cecf437cf04', 'older');
# ================ #
INSERT INTO object VALUES (1260.0, 280.0, '260ee366-5b6d-4e7e-8238-66e8c427e925', 'pwd_hash', 'attribute', false, 'older');
INSERT INTO attribute VALUES (false, false, '8ca9253e-5bef-4c5a-a4cc-e05274ab1966', '260ee366-5b6d-4e7e-8238-66e8c427e925', 'older');
# ================ #
# ================ #
INSERT INTO object VALUES (1060.0, 80.0, '5aad92cf-4f92-4ecf-a0ba-c75690c95efa', 'MESSAGE', 'entity', true, 'older');
INSERT INTO object VALUES (1140.0, 40.0, '26567b17-5bfb-4fa3-8cd6-2d25ada48003', 'text', 'attribute', false, 'older');
INSERT INTO attribute VALUES (false, false, '5aad92cf-4f92-4ecf-a0ba-c75690c95efa', '26567b17-5bfb-4fa3-8cd6-2d25ada48003', 'older');
# ================ #
INSERT INTO object VALUES (1060.0, 40.0, 'f1f4e216-a9c2-4d1d-a66d-937542c93bed', 'date', 'attribute', false, 'older');
INSERT INTO attribute VALUES (false, false, '5aad92cf-4f92-4ecf-a0ba-c75690c95efa', 'f1f4e216-a9c2-4d1d-a66d-937542c93bed', 'older');
# ================ #
INSERT INTO object VALUES (980.0, 40.0, 'd4a38616-74f6-491d-a9f3-959204f713d2', 'mid', 'attribute', false, 'older');
INSERT INTO attribute VALUES (true, false, '5aad92cf-4f92-4ecf-a0ba-c75690c95efa', 'd4a38616-74f6-491d-a9f3-959204f713d2', 'older');
# ================ #
# ================ #
INSERT INTO object VALUES (920.0, 140.0, 'ddc6ddae-d509-4bd8-ac71-089f609c627f', 'Container', 'entity', false, 'older');
INSERT INTO object VALUES (860.0, 60.0, '1f867746-50d7-4fa1-b564-f3c924e4ed49', 'cid', 'attribute', false, 'older');
INSERT INTO attribute VALUES (true, false, 'ddc6ddae-d509-4bd8-ac71-089f609c627f', '1f867746-50d7-4fa1-b564-f3c924e4ed49', 'older');
# ================ #
INSERT INTO object VALUES (860.0, 100.0, '8df4fb5a-0b06-41da-89d5-0893eb356d50', 'name', 'attribute', false, 'older');
INSERT INTO attribute VALUES (false, false, 'ddc6ddae-d509-4bd8-ac71-089f609c627f', '8df4fb5a-0b06-41da-89d5-0893eb356d50', 'older');
# ================ #
# ================ #
INSERT INTO object VALUES (720.0, 20.0, 'bfba50ef-4a00-4908-9369-e8a25065cf1f', 'Diagram', 'entity', false, 'older');
INSERT INTO object VALUES (860.0, -20.0, 'c7879251-2498-410d-bd57-cf3cb8a930ff', 'did', 'attribute', false, 'older');
INSERT INTO attribute VALUES (true, false, 'bfba50ef-4a00-4908-9369-e8a25065cf1f', 'c7879251-2498-410d-bd57-cf3cb8a930ff', 'older');
# ================ #
INSERT INTO object VALUES (860.0, 20.0, '30abdb37-a4c1-4849-898d-25e296ef7553', 'name', 'attribute', false, 'older');
INSERT INTO attribute VALUES (false, false, 'bfba50ef-4a00-4908-9369-e8a25065cf1f', '30abdb37-a4c1-4849-898d-25e296ef7553', 'older');
# ================ #
# ================ #
INSERT INTO object VALUES (520.0, 80.0, '919bcc29-5124-4e1d-b42b-8a1f22f0b2d8', 'Schema', 'entity', false, 'older');
# ================ #
INSERT INTO object VALUES (1060.0, 200.0, '9b805910-b8f4-4b6e-a91b-604dc639bbdf', 'Admin', 'entity', false, 'older');
INSERT INTO object VALUES (960.0, 240.0, 'a4accef9-5b16-410c-b149-8cd8eb259781', 'start_date', 'attribute', false, 'older');
INSERT INTO attribute VALUES (false, false, '9b805910-b8f4-4b6e-a91b-604dc639bbdf', 'a4accef9-5b16-410c-b149-8cd8eb259781', 'older');
# ================ #
INSERT INTO object VALUES (960.0, 200.0, '6f4a3922-b87a-4c54-92b9-b62e4f5ed840', 'retired', 'attribute', false, 'older');
INSERT INTO attribute VALUES (false, false, '9b805910-b8f4-4b6e-a91b-604dc639bbdf', '6f4a3922-b87a-4c54-92b9-b62e4f5ed840', 'older');
# ================ #
# ================ #
INSERT INTO object VALUES (1060.0, 280.0, 'c161fa1e-da01-4411-90dc-73f0b6c53798', 'Editor', 'entity', false, 'older');
INSERT INTO object VALUES (1060.0, 320.0, 'd0043642-c5ac-4c27-8f66-d83506ac3f48', 'reputation', 'attribute', false, 'older');
INSERT INTO attribute VALUES (false, false, 'c161fa1e-da01-4411-90dc-73f0b6c53798', 'd0043642-c5ac-4c27-8f66-d83506ac3f48', 'older');
# ================ #
# ================ #
INSERT INTO object VALUES (1060.0, 360.0, 'a8d4a86d-d6a4-4ac9-ab3f-be643bc003bf', 'Viewer', 'entity', false, 'older');
# ================ #
INSERT INTO object VALUES (560.0, 20.0, '64930b6b-c482-4576-95cf-683ef80ea298', 'EER Diagram', 'entity', false, 'older');
# ================ #
INSERT INTO object VALUES (560.0, 280.0, '1fb260ba-2a18-450d-86f6-86d0f17a689a', 'Object', 'entity', true, 'older');
INSERT INTO object VALUES (660.0, 240.0, '686946b4-dba8-4358-be01-5185b7218bc4', 'x', 'attribute', false, 'older');
INSERT INTO attribute VALUES (false, false, '1fb260ba-2a18-450d-86f6-86d0f17a689a', '686946b4-dba8-4358-be01-5185b7218bc4', 'older');
# ================ #
INSERT INTO object VALUES (660.0, 280.0, '7b06e0b6-7372-462a-b21d-59d7ebb4ac7e', 'y', 'attribute', false, 'older');
INSERT INTO attribute VALUES (false, false, '1fb260ba-2a18-450d-86f6-86d0f17a689a', '7b06e0b6-7372-462a-b21d-59d7ebb4ac7e', 'older');
# ================ #
INSERT INTO object VALUES (660.0, 320.0, '50a2e339-6c40-404f-a3bf-db3352d62cc3', 'name', 'attribute', false, 'older');
INSERT INTO attribute VALUES (false, false, '1fb260ba-2a18-450d-86f6-86d0f17a689a', '50a2e339-6c40-404f-a3bf-db3352d62cc3', 'older');
# ================ #
INSERT INTO object VALUES (660.0, 360.0, '5129831a-2969-4d18-a398-b1b15139d3e6', 'id', 'attribute', false, 'older');
INSERT INTO attribute VALUES (true, false, '1fb260ba-2a18-450d-86f6-86d0f17a689a', '5129831a-2969-4d18-a398-b1b15139d3e6', 'older');
# ================ #
INSERT INTO object VALUES (660.0, 200.0, '633899bb-9cdf-4b85-b1dd-3fadf240e19f', 'outlined', 'attribute', false, 'older');
INSERT INTO attribute VALUES (false, false, '1fb260ba-2a18-450d-86f6-86d0f17a689a', '633899bb-9cdf-4b85-b1dd-3fadf240e19f', 'older');
# ================ #
# ================ #
INSERT INTO object VALUES (380.0, 340.0, 'c3565943-acb7-4200-8b44-5dbefe6acb82', 'Attribute', 'entity', true, 'older');
# ================ #
INSERT INTO object VALUES (380.0, 400.0, '0ec8a9c2-fdf8-4cbd-8d7b-529115cc2a77', 'Entity', 'entity', true, 'older');
# ================ #
INSERT INTO object VALUES (620.0, 400.0, '1f1596cb-5dcf-47b9-9b74-70065a628a6c', 'Relationship', 'entity', true, 'older');
# ================ #
INSERT INTO object VALUES (700.0, 460.0, '71dc6ba2-c6d4-4ec8-bb7b-20527b68aa3e', 'Specialization', 'entity', true, 'older');
INSERT INTO object VALUES (600.0, 480.0, 'b2c9fb56-a52f-4011-8cca-5133ca7ebccf', 'disjoint', 'attribute', false, 'older');
INSERT INTO attribute VALUES (false, false, '71dc6ba2-c6d4-4ec8-bb7b-20527b68aa3e', 'b2c9fb56-a52f-4011-8cca-5133ca7ebccf', 'older');
# ================ #
# ================ #
INSERT INTO object VALUES (560.0, 200.0, '35fe6dc2-180a-4fcd-8fb5-faa3ebcebb0f', 'ENTITY_OF', 'relationship', true, 'older');
INSERT INTO relates VALUES ('', false, '1', '35fe6dc2-180a-4fcd-8fb5-faa3ebcebb0f', 'c7c8d794-1e28-460a-be37-42dc2a1c8eb1', 'older');
INSERT INTO relates VALUES ('', false, '', '35fe6dc2-180a-4fcd-8fb5-faa3ebcebb0f', '1fb260ba-2a18-450d-86f6-86d0f17a689a', 'older');
# ================ #
INSERT INTO object VALUES (860.0, 280.0, '182bdc7d-fbbd-4d55-b3c5-2cfbbaed377e', 'CAN_EDIT', 'relationship', false, 'older');
INSERT INTO relates VALUES ('', false, '', '182bdc7d-fbbd-4d55-b3c5-2cfbbaed377e', 'ddc6ddae-d509-4bd8-ac71-089f609c627f', 'older');
INSERT INTO relates VALUES ('', false, '', '182bdc7d-fbbd-4d55-b3c5-2cfbbaed377e', 'c161fa1e-da01-4411-90dc-73f0b6c53798', 'older');
INSERT INTO object VALUES (760.0, 280.0, 'f60ddfa3-79bf-40fd-a101-48e8af2ae38b', 'start_time', 'attribute', false, 'older');
INSERT INTO attribute VALUES (false, false, '182bdc7d-fbbd-4d55-b3c5-2cfbbaed377e', 'f60ddfa3-79bf-40fd-a101-48e8af2ae38b', 'older');
# ================ #
# ================ #
INSERT INTO object VALUES (1060.0, 140.0, '8bb03504-1fa2-4fee-8616-2ddcf716c417', 'SENT', 'relationship', true, 'older');
INSERT INTO relates VALUES ('', false, '1', '8bb03504-1fa2-4fee-8616-2ddcf716c417', '8ca9253e-5bef-4c5a-a4cc-e05274ab1966', 'older');
INSERT INTO relates VALUES ('', true, 'N', '8bb03504-1fa2-4fee-8616-2ddcf716c417', '5aad92cf-4f92-4ecf-a0ba-c75690c95efa', 'older');
INSERT INTO relates VALUES ('', false, '1', '8bb03504-1fa2-4fee-8616-2ddcf716c417', 'ddc6ddae-d509-4bd8-ac71-089f609c627f', 'older');
# ================ #
INSERT INTO object VALUES (780.0, 140.0, '2d721842-d483-4e9b-863a-683e84240488', 'FROM', 'relationship', false, 'older');
INSERT INTO relates VALUES ('', false, '1', '2d721842-d483-4e9b-863a-683e84240488', 'ddc6ddae-d509-4bd8-ac71-089f609c627f', 'older');
INSERT INTO relates VALUES ('', true, 'N', '2d721842-d483-4e9b-863a-683e84240488', 'bfba50ef-4a00-4908-9369-e8a25065cf1f', 'older');
# ================ #
INSERT INTO object VALUES (920.0, 360.0, '0d7f8736-219f-4bad-bce4-1fa4e0da4951', 'CAN_VIEW', 'relationship', false, 'older');
INSERT INTO relates VALUES ('', false, '', '0d7f8736-219f-4bad-bce4-1fa4e0da4951', 'a8d4a86d-d6a4-4ac9-ab3f-be643bc003bf', 'older');
INSERT INTO relates VALUES ('', false, '', '0d7f8736-219f-4bad-bce4-1fa4e0da4951', 'ddc6ddae-d509-4bd8-ac71-089f609c627f', 'older');
INSERT INTO object VALUES (820.0, 360.0, 'f6c07831-d08d-44e3-aa93-e88516e4f8ca', 'start_time', 'attribute', false, 'older');
INSERT INTO attribute VALUES (false, false, '0d7f8736-219f-4bad-bce4-1fa4e0da4951', 'f6c07831-d08d-44e3-aa93-e88516e4f8ca', 'older');
# ================ #
# ================ #
INSERT INTO object VALUES (380.0, 280.0, '05e28772-b226-428c-9335-c23e2c4fd8b2', 'ATTR_OF', 'relationship', false, 'older');
INSERT INTO relates VALUES ('', false, '1', '05e28772-b226-428c-9335-c23e2c4fd8b2', '1fb260ba-2a18-450d-86f6-86d0f17a689a', 'older');
INSERT INTO relates VALUES ('', true, 'N', '05e28772-b226-428c-9335-c23e2c4fd8b2', 'c3565943-acb7-4200-8b44-5dbefe6acb82', 'older');
# ================ #
INSERT INTO object VALUES (500.0, 440.0, '6cb050b0-7f0e-4ea3-8a75-86e75565a07d', 'RELATES', 'relationship', false, 'older');
INSERT INTO relates VALUES ('', false, 'N', '6cb050b0-7f0e-4ea3-8a75-86e75565a07d', '0ec8a9c2-fdf8-4cbd-8d7b-529115cc2a77', 'older');
INSERT INTO relates VALUES ('', true, 'M', '6cb050b0-7f0e-4ea3-8a75-86e75565a07d', '1f1596cb-5dcf-47b9-9b74-70065a628a6c', 'older');
INSERT INTO object VALUES (360.0, 480.0, '8d5266b8-297f-4e78-b70b-9e65a3a3c957', 'role', 'attribute', false, 'older');
INSERT INTO attribute VALUES (false, false, '6cb050b0-7f0e-4ea3-8a75-86e75565a07d', '8d5266b8-297f-4e78-b70b-9e65a3a3c957', 'older');
# ================ #
INSERT INTO object VALUES (440.0, 480.0, 'ffc48cab-6dfb-4487-b5af-37212f3973c5', 'total', 'attribute', false, 'older');
INSERT INTO attribute VALUES (false, false, '6cb050b0-7f0e-4ea3-8a75-86e75565a07d', 'ffc48cab-6dfb-4487-b5af-37212f3973c5', 'older');
# ================ #
INSERT INTO object VALUES (520.0, 480.0, '1008daf7-a980-41ce-b0a4-aec73d59d2b7', 'cardinality', 'attribute', false, 'older');
INSERT INTO attribute VALUES (false, false, '6cb050b0-7f0e-4ea3-8a75-86e75565a07d', '1008daf7-a980-41ce-b0a4-aec73d59d2b7', 'older');
# ================ #
# ================ #
INSERT INTO object VALUES (640.0, 80.0, 'e007b4b8-9ba7-4230-9190-cda0b9356537', 'o', 'specialization', false, 'older');
INSERT INTO specialization VALUES (false, 'e007b4b8-9ba7-4230-9190-cda0b9356537', 'older');
INSERT INTO relates VALUES ('', true, '', 'e007b4b8-9ba7-4230-9190-cda0b9356537', 'bfba50ef-4a00-4908-9369-e8a25065cf1f', 'older');
INSERT INTO relates VALUES ('', false, '', 'e007b4b8-9ba7-4230-9190-cda0b9356537', 'c7c8d794-1e28-460a-be37-42dc2a1c8eb1', 'older');
INSERT INTO relates VALUES ('', false, '', 'e007b4b8-9ba7-4230-9190-cda0b9356537', '919bcc29-5124-4e1d-b42b-8a1f22f0b2d8', 'older');
INSERT INTO relates VALUES ('', false, '', 'e007b4b8-9ba7-4230-9190-cda0b9356537', '64930b6b-c482-4576-95cf-683ef80ea298', 'older');
# ================ #
INSERT INTO object VALUES (1200.0, 280.0, '75782152-7c20-46a5-9ca9-a4f0e7cf3508', 'o', 'specialization', false, 'older');
INSERT INTO specialization VALUES (false, '75782152-7c20-46a5-9ca9-a4f0e7cf3508', 'older');
INSERT INTO relates VALUES ('', false, '', '75782152-7c20-46a5-9ca9-a4f0e7cf3508', '8ca9253e-5bef-4c5a-a4cc-e05274ab1966', 'older');
INSERT INTO relates VALUES ('', false, '', '75782152-7c20-46a5-9ca9-a4f0e7cf3508', '9b805910-b8f4-4b6e-a91b-604dc639bbdf', 'older');
INSERT INTO relates VALUES ('', false, '', '75782152-7c20-46a5-9ca9-a4f0e7cf3508', 'c161fa1e-da01-4411-90dc-73f0b6c53798', 'older');
INSERT INTO relates VALUES ('', false, '', '75782152-7c20-46a5-9ca9-a4f0e7cf3508', 'a8d4a86d-d6a4-4ac9-ab3f-be643bc003bf', 'older');
# ================ #
INSERT INTO object VALUES (560.0, 340.0, '5cdca302-b4d2-4cc6-a1c2-4a110ca4f4cc', 'd', 'specialization', false, 'older');
INSERT INTO specialization VALUES (true, '5cdca302-b4d2-4cc6-a1c2-4a110ca4f4cc', 'older');
INSERT INTO relates VALUES ('', true, '', '5cdca302-b4d2-4cc6-a1c2-4a110ca4f4cc', '1fb260ba-2a18-450d-86f6-86d0f17a689a', 'older');
INSERT INTO relates VALUES ('', false, '', '5cdca302-b4d2-4cc6-a1c2-4a110ca4f4cc', 'c3565943-acb7-4200-8b44-5dbefe6acb82', 'older');
INSERT INTO relates VALUES ('', false, '', '5cdca302-b4d2-4cc6-a1c2-4a110ca4f4cc', '0ec8a9c2-fdf8-4cbd-8d7b-529115cc2a77', 'older');
INSERT INTO relates VALUES ('', false, '', '5cdca302-b4d2-4cc6-a1c2-4a110ca4f4cc', '1f1596cb-5dcf-47b9-9b74-70065a628a6c', 'older');
# ================ #
INSERT INTO object VALUES (700.0, 400.0, '5479e3cb-d045-4560-8d9f-928ecccf21b7', 'o', 'specialization', false, 'older');
INSERT INTO specialization VALUES (false, '5479e3cb-d045-4560-8d9f-928ecccf21b7', 'older');
INSERT INTO relates VALUES ('', false, '', '5479e3cb-d045-4560-8d9f-928ecccf21b7', '1f1596cb-5dcf-47b9-9b74-70065a628a6c', 'older');
INSERT INTO relates VALUES ('', false, '', '5479e3cb-d045-4560-8d9f-928ecccf21b7', '71dc6ba2-c6d4-4ec8-bb7b-20527b68aa3e', 'older');
# ================ #
