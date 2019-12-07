DROP TABLE IF EXISTS PERSON;

CREATE TABLE PERSON (
  ID INT NOT NULL AUTO_INCREMENT,
  FIRST_NAME VARCHAR2(255) NOT NULL DEFAULT '',
  LAST_NAME VARCHAR2(255) NOT NULL DEFAULT '',
  MOBILE VARCHAR2(20) NOT NULL DEFAULT '',
  BIRTHDAY DATE DEFAULT NULL,
  HOME_ID SMALLINT DEFAULT NULL,
  PRIMARY KEY (ID));

  ALTER TABLE PERSON
  ADD FOREIGN KEY (HOME_ID)
  REFERENCES HOME(ID);


DROP TABLE IF EXISTS HOME;

CREATE TABLE HOME (
  ID INT NOT NULL AUTO_INCREMENT,
  ADDRESS VARCHAR2(255) not null default '',
  HOMENUMBER varchar2(255) NOT NULL DEFAULT '',
  PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS movies;

CREATE TABLE movies (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR2(100) NOT NULL UNIQUE,
  runtime SMALLINT NOT NULL,
  genre VARCHAR2(50),
  imdb_score NUMBER(10,1),
  rating VARCHAR2(10)
);

-- Tables for in-class example

DROP TABLE IF EXISTS cars;

CREATE TABLE cars (
  id INT NOT NULL AUTO_INCREMENT,
  make VARCHAR2(50) NOT NULL DEFAULT '',
  model VARCHAR2(50) NOT NULL DEFAULT '',
  year VARCHAR2(5) NOT NULL DEFAULT '01907',
  PRIMARY KEY (id),
  CONSTRAINT unique_make_model_year UNIQUE (make, model, year)

);

DROP TABLE IF EXISTS auto_prices;

CREATE TABLE auto_prices (
  id INT PRIMARY KEY AUTO_INCREMENT,
  car_id INT REFERENCES cars(id),
  package VARCHAR2(15) NOT NULL,
  price NUMBER(10,2) NOT NULL CHECK(price > 0),
  CONSTRAINT unique_package_per_car UNIQUE (car_id, package)


);


DROP SEQUENCE hibernate_sequence;

CREATE SEQUENCE hibernate_sequence;

INSERT INTO PERSON (FIRST_NAME, LAST_NAME, MOBILE, BIRTHDAY, HOME_ID)
VALUES ('John', 'Doe', '609-555-1234', '1993-8-28', 1 ),
       ('Jane', 'Doe', '302-123-456', '1988-1-20', 1),
       ('Jack', 'Hill', '410-908-5467', '1990-8-30', 2),
       ('Jill', 'Hill', '543-098-9403', '1995-12-25', 2),
       ('Harry', 'Brown', '234-908-6547', '2000-11-27', 3),
       ('Glenda', 'White', '856-546-1243', '1992-3-6', 4);

INSERT INTO HOME (ADDRESS, HOMENUMBER) VALUES ( '36.  Bayberry Rd. Savannah, GA 31404', '565-6895'),
                                              ('11 Essex Dr. Farmingdale, NY 11735', '454-4544'),
                                              ('920 Arlington Street, Clifton, NJ 07011', '985-4515'),
                                              ('234 High Street, PA 19159', '267-3940');
