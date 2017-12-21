{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf200
{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\fnil\fcharset134 PingFangSC-Regular;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 CREATE TABLE biog_ref (primary_id integer primary key autoincrement, person_id,person_name,gender,born_year, died_year, jiguan);\
INSERT INTO biog_ref(person_id, person_name, gender, born_year, died_year, jiguan)\
SELECT BIOG_MAIN.c_personid, BIOG_MAIN.c_name_chn, \
CASE\
    WHEN BIOG_MAIN.c_female= 0 THEN "
\f1 \'c4\'d0
\f0 "\
    WHEN BIOG_MAIN.c_female<> 0 THEN "
\f1 \'c5\'ae
\f0 "\
END,\
BIOG_MAIN.c_birthyear, BIOG_MAIN.c_deathyear, ADDR_CODES.c_name_chn\
FROM (BIOG_MAIN LEFT JOIN BIOG_ADDR_DATA ON BIOG_MAIN.c_personid = BIOG_ADDR_DATA.c_personid) LEFT JOIN ADDR_CODES ON BIOG_ADDR_DATA.c_addr_id = ADDR_CODES.c_addr_id\
WHERE \
(BIOG_ADDR_DATA.tts_sysno in (SELECT min(BIOG_ADDR_DATA.tts_sysno) FROM BIOG_ADDR_DATA GROUP BY BIOG_ADDR_DATA.c_personid))\
OR\
(BIOG_MAIN.c_personid NOT IN (SELECT BIOG_ADDR_DATA.c_personid FROM BIOG_ADDR_DATA))}