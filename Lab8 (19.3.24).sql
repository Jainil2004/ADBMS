-- ADBMS Lab 8 (19.3.24)

-- question 1
-- create a sequence by name EMPID_SEQ starting with value 100 with an interval of 1

create sequence EMPID_SEQ
start with 100
increment by 1;

-- question 2
-- write a SQL command for finding the current and the next status of EMPID_SEQ

alter SEQUENCE EMPID_SEQ CACHE 20;
ALTER SEQUENCE EMPID_SEQ MAXVALUE 1000;

drop SEQUENCE EMPID_SEQ;

CREATE SEQUENCE REV
START WITH 10000
INCREMENT by -5
MINVALUE 1000
MAXVALUE 10000;

SELECT sequence_schema, REV 
FROM information_schema.sequences 
ORDER BY REV 

-- this is the test statements 
-- CREATE SEQUENCE sequence_name
-- START WITH initial_value
-- INCREMENT BY increment_value
-- MINVALUE minimum_value
-- MAXVALUE maximum_value
-- CACHE cache_value;

-- SELECT count(*) count FROM user_sequences WHERE sequence_name = 'SEQ_NAME'