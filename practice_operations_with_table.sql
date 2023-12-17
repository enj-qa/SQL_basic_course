/*Create a table movies with fields:
id of INT type with PRIMARY KEY AUTO_INCREMENT key
title of type VARCHAR(255) NOT NULL
release_year type INT
genre type VARCHAR(255)
rating type INT
budget type INT*/
CREATE TABLE movies (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    release_year INT,
    genre VARCHAR(255),
    rating INT,
    budget INT);

--Create a query that adds a new column named box_office with type INT to the movies table.
ALTER TABLE movies
ADD COLUMN box_office INT;

--Create a query that changes the data type of the budget column to BIGINT
ALTER TABLE movies
MODIFY COLUMN budget BIGINT;

--Create a query that removes the release_year column from the movies table
ALTER TABLE movies
DROP COLUMN release_year;

--Create a query that renames the box_office column to revenue in the movies table
ALTER TABLE movies
RENAME COLUMN box_office TO revenue;

--Create a query that deletes the movies table
DROP TABLE movies;

--Create a query that adds three new rows to the movies table
INSERT INTO movies (title, release_year, genre, rating, budget)
VALUES ('Inception', 2010, 'Thriller', 8, 160000000),
       ('Pulp Fiction', 1994, 'Crime', 8, 31500000),
       ('Fight Club', 1999, 'Drama', 8, 63000000);

--Create a query that updates the value in the rating column for a record with the title "The Lion King" to 9
UPDATE movies
SET rating = 9
WHERE title = 'The Lion King';

--Create a query that updates the value in the rating column for the record titled "The Lion King" to 9 and the value in the budget column to 50000000.
UPDATE movies
SET rating = 9, budget = 50000000
WHERE title = 'The Lion King';

--Create a query that removes rows from the movies table where the id column value is 5.
DELETE FROM movies
WHERE id = 5;

--Create a query that removes rows from the movies table where the id column value is 2, 4, 8.
DELETE FROM movies
WHERE id IN (2,4,8);

--Create a query to clear the movies table in the database.
TRUNCATE TABLE movies;

--Create a query that removes rows from the movies table where the value of the genre column is Drama or Crime.
DELETE FROM movies
WHERE genre IN ('Drama','Crime');

--Create a query that removes rows from the movies table where the value of the release_year column is less than the year 2000.
DELETE FROM movies
WHERE release_year < 2000;

--Create a query that outputs a list of all tables from the current database.
SHOW TABLES;
