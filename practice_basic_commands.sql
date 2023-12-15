--Create a query that fetches all data from the movies table. The result should be sorted by the release_year field in descending order.
SELECT * 
FROM movies
ORDER BY release_year DESC;

--Create a query that selects unique genres from the movies table. The result should be sorted by the genre field in descending order.
SELECT DISTINCT(genre) 
FROM movies
ORDER BY genre DESC;

--Create a query that fetches all rows and fields from the movies table and returns the next 2 rows, skipping the first 3.
SELECT * FROM movies
LIMIT 2
OFFSET 3;

--Create a query that selects all movies from the movies table that were released after the year 2000
SELECT * 
FROM movies
WHERE release_year > 2000;

--Create a query that selects all movies from the movies table that are not released in 2003 and 2008. The result should be sorted by the release_year field in descending order.
SELECT * 
FROM movies
WHERE release_year NOT IN (2003, 2008)
ORDER BY release_year DESC;

--Create a query that will select all movies from the movies table with a rating between 7 and 10. The result should be sorted by the rating field in descending order.
SELECT * 
FROM movies
WHERE rating BETWEEN 7 AND 10
ORDER BY rating DESC;

--Create a query that will select all movies from the movies table with genre that is not Drama. The result should be sorted by the rating field in descending order.
SELECT * 
FROM movies
WHERE genre NOT IN ("Drama")
ORDER BY rating DESC;

/*Create a query that will return records from the movies table and group movies by genre and calculate the average rating for each genre.
The result should be sorted by genre field in descending order.*/
SELECT genre, AVG(rating) AS avg_rating
FROM movies
GROUP BY genre
ORDER BY genre DESC;

/*Create a query that will return all movies from the movies table and group the movies by genre and calculate the average rating for each genre. 
Also round the average rating to one decimal place.*/
SELECT genre, ROUND(AVG(rating),1) 
AS avg_rating
FROM movies
GROUP BY genre
ORDER BY genre DESC;

--Create a query that will return rows from the movies table. The query should return the number of movies in each genre.
SELECT genre, COUNT(genre) 
AS count_genre
FROM movies
GROUP BY genre
ORDER BY COUNT(genre) DESC;

/*Create a query that will return rows from the movies table The query should return the number of movies in each genre, provided that there are more than 1 movie in each genre.
The result should be sorted by the genre field in descending order.*/
SELECT genre, COUNT(genre) 
AS count
FROM movies
GROUP BY genre
HAVING count > 1
ORDER BY genre DESC;

--Create a query that will return rows from the movies table. The query should return the maximum rating of movies in each genre.
SELECT genre, MAX(rating) 
AS max_rating
FROM movies
GROUP BY genre
ORDER BY MAX(rating) DESC;

--Create a query that will return rows from the movies table. The query should return the minimum rating of movies in each genre.
SELECT genre, MIN(rating) 
AS min_rating
FROM movies
GROUP BY genre
ORDER BY MIN(rating) DESC;

--The query should return the number of movies in each genre and the maximum rating of movies in that genre. The result should be sorted by the count field in descending order.
SELECT genre, COUNT(id) AS count, 
MAX(rating) AS max_rating
FROM movies
GROUP BY genre
ORDER BY COUNT(id) DESC;

--The query should return the number of movies for each combination of release year and genre. The result should be sorted by the release_year field in descending order.
SELECT release_year, genre, 
COUNT(id) AS count
FROM movies
GROUP BY release_year, genre
ORDER BY release_year DESC;

--Create a query on the movies table with a subquery on the same table to select only those movies that have a rating higher than the average rating of all movies in the table.
SELECT * FROM movies
WHERE rating > (SELECT AVG(rating) 
                FROM movies);

/*Create a query on the movies table with a subquery on the same table to retrieve all movies from the movies table 
where the release year matches the minimum release year in the movies table*/
SELECT * FROM movies
WHERE release_year = ALL (SELECT MIN(release_year) 
                          FROM movies);

/*Create a query on the movies table with a subquery on the same table to retrieve all movies from the movies table 
where the release year matches the minimum release year in the movies table*/
SELECT * FROM movies
WHERE rating >= ALL (SELECT rating 
                     FROM top_rated_movies);

--query to the table movies that selects all movies provided that the title field contains the father text.
SELECT * 
FROM movies
WHERE title LIKE '%father%';

--Create a high_rated_movies view that displays only movies with a rating greater than 8 from the movies table
CREATE VIEW high_rated_movies
AS
SELECT title, rating FROM movies
WHERE rating > 8;

--Create an action_movies view that displays only movies with the Action genre from the movies table
CREATE VIEW action_movies
AS
SELECT title, rating
FROM movies
WHERE genre = 'Action';

--Create a query on the movies table that selects all movies released in the 1990s, provided that the title field starts with The
SELECT * 
FROM movies
WHERE title LIKE 'The%' 
AND release_year BETWEEN 1990 AND 2000; 

--Create a query on the movies table that selects all movies released in the 1990s, provided that the title field does not start with The and the rating is not equal to 9.
SELECT * 
FROM movies
WHERE title NOT LIKE 'The%' 
AND rating != 9 
AND release_year BETWEEN 1990 AND 1999;

--Create a query that selects movies from the movies table that were released in an even-numbered year. The result should be sorted by the title field in descending order.
SELECT title, release_year 
FROM movies
WHERE release_year % 2 = 0
ORDER BY title DESC;

--Create a query on the directors table that selects all producers provided that the text in the name field starts with C
SELECT name
FROM directors
WHERE name LIKE 'C%'
ORDER BY name DESC;

--Create a query that fetches every third movie from the movies table. The result should be sorted by the id field in descending order.
SELECT id, title, release_year
FROM movies
WHERE id % 3 = 0
ORDER BY id DESC;

--Create a query that selects every second movie from the movies table released after 2000. The result should be sorted by the release_year field in descending order.
SELECT id, title, release_year
FROM movies
WHERE release_year > 2000 AND id % 2 = 0
ORDER BY release_year DESC;

--Create a query that selects movies from the table movies in the genre Crime, Drama and duration more than 140 and less than 200 minutes.
SELECT id, title, genre, duration
FROM movies
WHERE genre IN ('Crime', 'Drama') 
AND duration BETWEEN 140 AND 200
ORDER BY duration DESC;
