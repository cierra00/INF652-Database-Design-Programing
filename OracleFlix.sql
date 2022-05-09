/*
Cierra Ray
OracleFlix
05-May-2022
*/


/* Create Tables */

CREATE TABLE customers
(customer_id NUMBER(10) CONSTRAINT customer_id_pk PRIMARY KEY, 
last_name VARCHAR2(25) NOT NULL, 
first_name VARCHAR2(25) NOT NULL,
home_phone VARCHAR2(12) NOT NULL,
address VARCHAR2(100) NOT NULL,
city VARCHAR2(30) NOT NULL,
state VARCHAR2(2) NOT NULL,
email VARCHAR2(25),
cell_phone VARCHAR2(12) );

CREATE TABLE movies
(title_id NUMBER(10) CONSTRAINT title_id_pk PRIMARY KEY, 
title VARCHAR2(60) NOT NULL, 
description VARCHAR2(400) NOT NULL,
rating VARCHAR2(4) CONSTRAINT movies_rating CHECK (rating IN ('G', 'PG','R','PG13')),
category VARCHAR2(20) CHECK (category IN ('DRAMA', 'COMEDY', 'ACTION', 'CHILD', 'SCIFI',
'DOCUMENTARY')),
release_date date NOT NULL);

CREATE TABLE media
(media_id NUMBER(10) CONSTRAINT media_id_pk PRIMARY KEY,
format VARCHAR2(3) NOT NULL,
title_id NUMBER(10) NOT NULL CONSTRAINT media_titleid_fk REFERENCES movies(title_id));


CREATE TABLE rental_history
(media_id NUMBER(10) CONSTRAINT media_id_fk REFERENCES media(media_id),
rental_date date default SYSDATE NOT NULL,
customer_id NUMBER(10) NOT NULL CONSTRAINT customer_id_fk REFERENCES 
customers(customer_id),
return_date date,
CONSTRAINT rental_history_pk PRIMARY KEY (media_id, rental_date));

CREATE TABLE actors
(actor_id NUMBER(10) CONSTRAINT actor_id_pk PRIMARY KEY, 
stage_name VARCHAR2(40) NOT NULL,
last_name VARCHAR2(25) NOT NULL, 
first_name VARCHAR2(25) NOT NULL,
birth_date date NOT NULL);

CREATE TABLE star_billings
(actor_id NUMBER(10) CONSTRAINT actor_id_fk REFERENCES actors(actor_id),
title_id NUMBER(10) CONSTRAINT title_id_fk REFERENCES movies(title_id),
comments VARCHAR2(40), 
CONSTRAINT star_billings_pk PRIMARY KEY (actor_id, title_id));




/* Customer data */
INSERT INTO customers(customer_id,last_name,first_name,home_phone,address, city, state, email,cell_phone)
VALUES (customer_id_seq.NEXTVAL,'Wallace', 'Manny','404-270-1234','0000 Peachtree St.','Atlanta','GA','mwallace@university.edu','202-333-7286');
INSERT INTO customers(customer_id,last_name,first_name,home_phone,address, city, state, email,cell_phone)
VALUES(customer_id_seq.NEXTVAL,'Lewis', 'john','404-720-9898','9900 Freedom Pkwy','Atlanta','GA','jlewis@econgress.org','716-555-1212');
INSERT INTO customers(customer_id,last_name,first_name,home_phone,address, city, state, email,cell_phone)
VALUES(customer_id_seq.NEXTVAL,'Mouse', 'Mickey','716-270-2669','1501 Buena Vista Drive','Lake Buena Vista','FL','magic@disney.com','407-939-7286');
INSERT INTO customers(customer_id,last_name,first_name,home_phone,address, city, state, email,cell_phone)
VALUES (customer_id_seq.NEXTVAL,'Muir', 'David','800-230-0229','47 West 66th Street','New York','NY','dmuir@abcnews.com','212-999-3456');
INSERT INTO customers(customer_id,last_name,first_name,home_phone,address, city, state, email,cell_phone)
VALUES (customer_id_seq.NEXTVAL,'Dyer', 'Buddy','407-246-2221','400 S Orange AVE,','Orlando','FL','buddy.dyer@orlando.gov','444-555-0000');
INSERT INTO customers(customer_id,last_name,first_name,home_phone,address, city, state, email,cell_phone)
VALUES (customer_id_seq.NEXTVAL,'Jobs', 'Stephen','877-412-7753','One Apple Park Way','Cupertino','CA','steve.jobs@apple.com','408-996-1010');


/*  Movie Data */
INSERT INTO movies (title_id,title,description,rating,category,release_date)
VALUES (title_id_seq.NEXTVAL,'The Batman','Batman is forced to investigate the city''s hidden corruption ', 'PG13','DRAMA','04-MAR-2022');
INSERT INTO movies (title_id,title,description,rating,category,release_date)
VALUES (title_id_seq.NEXTVAL,'O Brother Where Art Thou','Three escaped convicts search for hidden treasure while a relentless lawman pursues them.', 'PG13','COMEDY','22-Dec-2000');
INSERT INTO movies (title_id,title,description,rating,category,release_date)
VALUES (title_id_seq.NEXTVAL,'Star Wars: A New Hope','Rebel spaceships, striking from a hidden base, have won their first victory against the evil Galactic Empire.', 'PG','DRAMA','04-May-1977');
INSERT INTO movies (title_id,title,description,rating,category,release_date)
VALUES (title_id_seq.NEXTVAL,'Iron Man','After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil.', 'PG13','DRAMA','02-May-2008');
INSERT INTO movies (title_id,title,description,rating,category,release_date)
VALUES (title_id_seq.NEXTVAL,'Mean Girls','a naïve teenage girl navigating her way through the social hierarchy', 'PG13','DRAMA','30-Apr-2004');
INSERT INTO movies (title_id,title,description,rating,category,release_date)
VALUES (title_id_seq.NEXTVAL,'Dirty Dancing','Spending the summer at a Catskills resort with her family, Frances "Baby" Houseman falls in love with the camp''s dance instructor, Johnny Castle.', 'PG13','DRAMA','21-Aug-1987');





/* Media Format Data */
INSERT INTO media (media_id, format, title_id)
    VALUES (media_id_seq.NEXTVAL,'DVD',1);
INSERT INTO media (media_id, format, title_id)
    VALUES (media_id_seq.NEXTVAL,'VHS',1);
INSERT INTO media (media_id, format, title_id)
    VALUES (media_id_seq.NEXTVAL,'SRM',1);
INSERT INTO media (media_id, format, title_id)
    VALUES (media_id_seq.NEXTVAL,'SRM',2);
INSERT INTO media (media_id, format, title_id)
    VALUES (media_id_seq.NEXTVAL,'VHS',2);
INSERT INTO media (media_id, format, title_id)
    VALUES (media_id_seq.NEXTVAL,'DVD',2);
INSERT INTO media (media_id, format, title_id)
    VALUES (media_id_seq.NEXTVAL,'SRM',3);
INSERT INTO media (media_id, format, title_id)
    VALUES (media_id_seq.NEXTVAL,'DVD',3);
INSERT INTO media (media_id, format, title_id)
    VALUES (media_id_seq.NEXTVAL,'VHS',3);
INSERT INTO media (media_id, format, title_id)
    VALUES (media_id_seq.NEXTVAL,'SRM',4);
INSERT INTO media (media_id, format, title_id)
    VALUES (media_id_seq.NEXTVAL,'DVD',4);
INSERT INTO media (media_id, format, title_id)
    VALUES (media_id_seq.NEXTVAL,'VHS',4);
INSERT INTO media (media_id, format, title_id)
    VALUES (media_id_seq.NEXTVAL,'SRM',5);
INSERT INTO media (media_id, format, title_id)
    VALUES (media_id_seq.NEXTVAL,'DVD',5);
INSERT INTO media (media_id, format, title_id)
    VALUES (media_id_seq.NEXTVAL,'VHS',5);
INSERT INTO media (media_id, format, title_id)
    VALUES (media_id_seq.NEXTVAL,'SRM',6);
INSERT INTO media (media_id, format, title_id)
    VALUES (media_id_seq.NEXTVAL,'DVD',6);
INSERT INTO media (media_id, format, title_id)
    VALUES (media_id_seq.NEXTVAL,'VHS',6);

/* Rental History Data */
INSERT INTO rental_history (media_id, rental_date,customer_id,return_date)
    VALUES (93,default,101,sysdate+1);
INSERT INTO rental_history (media_id, rental_date,customer_id,return_date)
    VALUES (95,default,101,sysdate+1);
INSERT INTO rental_history (media_id, rental_date,customer_id,return_date)
    VALUES (93,default,101,sysdate+1);
INSERT INTO rental_history (media_id, rental_date,customer_id,return_date)
    VALUES (95,default,101,sysdate+1);


    /* Actor Data */

INSERT INTO actors (actor_id,stage_name,first_name,last_name,birth_date)
    VALUES(actor_id_seq.NEXTVAL,'George Clooney','George','Clooney','06-May-1961');
INSERT INTO actors (actor_id,stage_name,first_name,last_name,birth_date)
    VALUES(actor_id_seq.NEXTVAL,'Patrick Swayze','Patrick','Swayze','18-Aug-1952');
INSERT INTO actors (actor_id,stage_name,first_name,last_name,birth_date)
    VALUES(actor_id_seq.NEXTVAL,'Robert Pattinson','Robert Douglas','Pattington','13-May-1986');
INSERT INTO actors (actor_id,stage_name,first_name,last_name,birth_date)
    VALUES(actor_id_seq.NEXTVAL,'Mark Hamil','Mark Richard','Hamill','25-Sep-1951');

/* Star Billings Data */

INSERT INTO star_billings (actor_id,title_id,comments)
    VALUES (1004,3,'Jedi Master');
INSERT INTO star_billings (actor_id,title_id,comments)
    VALUES (1001,2,'Comic Star');
INSERT INTO star_billings (actor_id,title_id,comments)
    VALUES (1003,1,'Dark Night Super Hero');
INSERT INTO star_billings (actor_id,title_id,comments)
    VALUES (1002,6,'Romantic Lead');


/* Select Table Data */
SELECT * FROM customers
ORDER BY customer_id DESC;

SELECT * FROM movies
ORDER BY title_id DESC;

SELECT * FROM media
ORDER BY media_id DESC;

SELECT * FROM rental_history
ORDER BY rental_date DESC;

SELECT * FROM actors;
ORDER BY actor_id DESC;

SELECT * FROM star_billings
ORDER BY actor_id DESC;

/* View Data */

CREATE VIEW title_unavail AS SELECT m.title, e.media_id, r.rental_date, r.return_date 
FROM movies m, media e, rental_history r
WHERE m.title_id = e.title_id 
and r.media_id = e.media_id
and return_date is null
with read only

SELECT * FROM title_unavail;


/* Sequences */

CREATE SEQUENCE media_id_seq INCREMENT BY 1 START WITH 92 MAXVALUE 50000 NOCACHE 
NOCYCLE;
CREATE SEQUENCE title_id_seq INCREMENT BY 1 START WITH 1 MAXVALUE 50000 NOCACHE 
NOCYCLE;
CREATE SEQUENCE customer_id_seq INCREMENT BY 1 START WITH 101 MAXVALUE 50000 
NOCACHE NOCYCLE;
CREATE SEQUENCE actor_id_seq INCREMENT BY 1 START WITH 1001 MAXVALUE 50000 NOCACHE 
NOCYCLE

/* Indexes */

CREATE INDEX customer_last_name_idx ON customers(last_name);

SELECT * FROM user_indexes
WHERE index_name = 'CUSTOMER_LAST_NAME_IDX';

/* Synonyms */

CREATE or REPLACE SYNONYM tu FOR title_unavail;
SELECT * FROM tu;
SELECT * FROM USER_SYNONYMS
WHERE synonym_name = 'tu'

