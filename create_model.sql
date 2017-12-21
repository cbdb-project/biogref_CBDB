CREATE TABLE biog_ref (primary_id integer primary key autoincrement, person_id,person_name,gender,born_year, died_year, jiguan);
INSERT INTO biog_ref(person_id, person_name, gender, born_year, died_year, jiguan)
SELECT BIOG_MAIN.c_personid, BIOG_MAIN.c_name_chn, 
CASE
    WHEN BIOG_MAIN.c_female= 0 THEN "男"
    WHEN BIOG_MAIN.c_female<> 0 THEN "女"
END,
BIOG_MAIN.c_birthyear, BIOG_MAIN.c_deathyear, ADDR_CODES.c_name_chn
FROM (BIOG_MAIN LEFT JOIN BIOG_ADDR_DATA ON BIOG_MAIN.c_personid = BIOG_ADDR_DATA.c_personid) LEFT JOIN ADDR_CODES ON BIOG_ADDR_DATA.c_addr_id = ADDR_CODES.c_addr_id
WHERE 
(BIOG_ADDR_DATA.tts_sysno in (SELECT min(BIOG_ADDR_DATA.tts_sysno) FROM BIOG_ADDR_DATA GROUP BY BIOG_ADDR_DATA.c_personid))
OR
(BIOG_MAIN.c_personid NOT IN (SELECT BIOG_ADDR_DATA.c_personid FROM BIOG_ADDR_DATA))