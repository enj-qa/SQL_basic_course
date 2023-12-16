--Create a query where the title and release_year fields should be merged to this form, for example: The Shawshank Redemption (1994)
SELECT CONCAT (title, ' (', release_year,')') 
AS movie
FROM movies;

--The values of the title column must be converted to lower case.
SELECT LOWER(title) 
AS title 
FROM movies;

--The values of the title column must be converted to uppercase.
SELECT UPPER(title) 
AS title 
FROM movies;

--The values of the title column should be trimmed after the beginning of the string 5 characters .
SELECT LEFT(title, 5) 
AS title 
FROM movies;

--In all values in the title column, replace The with THE.
SELECT REPLACE(title, 'The', 'THE') 
AS title
FROM movies;

--Select the title column from the table and in the new column title_length, it is necessary to place the length of each movie title.
SELECT title, LENGTH(title) 
AS title_length
FROM movies;

--Compose a new movie field whose values will contain the values of the id and title fields. The result should be converted to uppercase
SELECT UPPER(CONCAT('#', id, ' ', title)) 
AS movie
FROM movies;

--Compose a new field stars whose values will contain the number of stars from 1 to 5 for each movie.
SELECT title, ELT(rating/2,
                 '★☆☆☆☆',
                 '★★☆☆☆',
                 '★★★☆☆',
                 '★★★★☆',
                 '★★★★★') AS stars 
                 FROM movies
                 ORDER BY rating DESC;

--Create a query that returns a list of all movies from the movies table that have a title field length value less than 20 characters.
SELECT title 
FROM movies
WHERE LENGTH(title) < 20;

--Create a query that returns the number of movies from the movies table that have a title field length greater than 17 characters.
SELECT COUNT(title)
AS count
FROM movies
WHERE LENGTH(title) > 17;

--Create a query that returns the number of reviews from the reviews table that have a comment field length value greater than 20 characters and do not begin with The.
SELECT COUNT(*)
FROM reviews
WHERE LENGTH(comment) > 20 
AND comment NOT LIKE 'The%'; 

--Group the result by genre field and calculate the average rating for each genre, rounding it using the ROUND function to 2 decimal places.
SELECT genre, ROUND(AVG(rating), 2) 
AS rating
FROM movies
GROUP BY genre;

--Group the result by the genre field and calculate the average rating for each genre, and convert the value of the rating field to the smallest integer possible
SELECT genre, CEILING(AVG(rating)) 
AS rating
FROM movies
GROUP BY genre;

--Select the title and rating fields. Write the result of the RAND function execution for each movie into the new random field
SELECT title, rating, RAND() 
AS random
FROM movies;

/*Create a query that returns a list of all movies from the movies table released after 1990. Convert the values of the title field to uppercase.
The new publish_time field should store the new time: 9:49:00 for all movies*/
SELECT UPPER(title) AS title, rating, release_year, 
MAKETIME (09, 49, 00) AS publish_time
FROM movies
WHERE release_year > 1990;

/*Select the title , rating and release_year fields Convert the values of the title field to lower case.
In the new month field for each movie, display the release month based on the release_date field and convert the month field to lower case.*/
SELECT LOWER(title) AS title, 
rating, release_year,
LOWER(MONTHNAME (release_date)) AS month
FROM movies
ORDER By release_year DESC;

/*Create a query that returns a list of all movies from the movies table
Use CASE construct to fulfill the following conditions: 
If rating > 8 then return the value of the title field + text: is Highly Rated in the new movie field.
If rating > 6 then return to the new movie field the value of the title field + text: is Rated Average.
Otherwise, return to the new movie field the value of the title field + text: is Low Rated*/
SELECT CONCAT(title,
CASE
WHEN rating > 8 THEN ' is Highly Rated'
WHEN rating > 8 THEN ' is Rated Average'
ELSE ' is Low Rated'
              END) AS movie 
              FROM movies;

/*Use the IF function to fulfill the following conditions:
If rating > 8 then return to the new movie field the value of the title field + text: is Highly Rated
Otherwise, return to the new movie field the value of the title field + text: is Low Rated*/
SELECT CONCAT(title, 
             IF (rating > 8, ' is Highly Rated', ' is Low Rated'))
             AS movie
             FROM movies;





