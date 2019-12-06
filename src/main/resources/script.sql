INSERT INTO movies (title, runtime, genre, imdb_score, rating)
values ( 'Howard the Duck', '110', 'Sci-Fi', '4.6', 'PG' );
INSERT INTO movies (title, runtime, genre, imdb_score, rating)
values ( 'Lavalantula', '83', 'Horror', '4.7', 'TV-14' );
INSERT INTO movies (title, runtime, genre, imdb_score, rating)
values ( 'Starship Troopers', '129', 'Sci-Fi', '7.2', 'PG-13' );
INSERT INTO movies (title, runtime, genre, imdb_score, rating)
values ( 'Waltz With Bashir', '90', 'Documentary', '8.0', 'R' );
INSERT INTO movies (title, runtime, genre, imdb_score, rating)
values ( 'Spaceballs', '96', 'Comedy', '7.1', 'PG' );
INSERT INTO movies (title, runtime, genre, imdb_score, rating)
values ( 'Monsters Inc', '92', 'Animations', '8.1', 'G' );
INSERT INTO movies (title, runtime, genre, imdb_score, rating)
values ( 'Avengers Endgame', '182', 'Fantasy', '8.5', 'PG-13' );
INSERT INTO movies (title, runtime, genre, imdb_score, rating)
values ( 'Frozen', '109', 'Animation', '7.3', 'PG' );
INSERT INTO movies (title, runtime, genre, imdb_score, rating)
values ( 'Lion King', '118', 'Drama', '7', 'PG' );
INSERT INTO movies (title, runtime, genre, imdb_score, rating)
values ( 'Toy Story 4', '100', 'Fantasy', '7.9', 'G' );

SELECT * FROM movies WHERE genre = 'Sci-Fi';

SELECT * FROM movies WHERE imdb_score >= 6.5;

SELECT * FROM movies  WHERE rating = 'G' or rating = 'PG' and runtime < 100;

SELECT AVG (runtime) FROM movies WHERE imdb_score < 7.5 GROUP BY genre;

UPDATE movies SET rating = 'R' WHERE title = 'Starship Troopers';

SELECT id, rating FROM movies WHERE genre = 'Horror' or genre = 'Documentary';

SELECT AVG (imdb_score) FROM movies GROUP BY rating;
SELECT MAX (imdb_score) FROM movies GROUP BY rating;
SELECT MIN (imdb_score) FROM movies GROUP BY rating;

SELECT AVG (imdb_score) FROM movies GROUP BY rating HAVING COUNT(*) > 1;
SELECT MAX (imdb_score) FROM movies GROUP BY rating HAVING COUNT(*) > 1;
SELECT MIN (imdb_score) FROM movies GROUP BY rating HAVING COUNT(*) > 1;

DELETE FROM movies WHERE rating = 'R';

