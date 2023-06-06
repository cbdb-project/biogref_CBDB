SELECT BIOG_MAIN.c_personid as person_id, BIOG_MAIN.c_name_chn as person_name, 
CASE
    WHEN BIOG_MAIN.c_female= 0 THEN '男'
    WHEN BIOG_MAIN.c_female<> 0 THEN '女'
END as gender,
BIOG_MAIN.c_birthyear as born_year, BIOG_MAIN.c_deathyear as died_year, DYNASTIES.c_dynasty_chn as dynasty, ADDR_CODES.c_name_chn as jiguan
FROM BIOG_MAIN LEFT JOIN ADDR_CODES ON BIOG_MAIN.c_index_addr_id = ADDR_CODES.c_addr_id LEFT JOIN DYNASTIES ON DYNASTIES.c_dy = BIOG_MAIN.c_dy
WHERE c_personid != 0