--Create a query that returns a list of all movies from the movies table and their actors from the actors table.
SELECT m.title AS movie_title,
a.name AS actor_name
FROM movies m
INNER JOIN actors a
ON a.movie_id = m.id;

/*Create a query that returns a list of all movies from the movies table and their actors from the actors table. 
Group the movies by movie id and return a comma separated list of actors for each movie*/
SELECT m.title, 
GROUP_CONCAT(a.name) AS actors 
FROM movies m
JOIN actors a
ON a.movie_id = m.id
GROUP BY m.id;

/*Create a query that returns a list of all movies released after 1990 from the movies table and their actors from the actors table. 
Group the movies by movie id and return a comma separated list of actors for each movie using the GROUP_CONCAT function.*/
SELECT m.title, 
GROUP_CONCAT(a.name) AS actors 
FROM movies m
JOIN actors a
ON a.movie_id = m.id
WHERE m.release_year >= 1990
GROUP BY m.id;

--Get a list of all movies from the movies table and their actors from the actors table , including movies for which no actors are specified.
SELECT m.title, a.name    
FROM movies m
LEFT JOIN actors a
ON m.id = a.movie_id;

--Get a list of all movies from the movies table and their actors from the actors table, including actors that may not have entries in the movies table.
SELECT m.title, a.name    
FROM movies m
RIGHT JOIN actors a
ON m.id = a.movie_id;

--Create a query that returns all possible combinations of rows from the movies and actors table.
SELECT movies.title, actors.name
FROM movies
CROSS JOIN actors
ORDER BY title DESC;

--Get the list of movies from the movies table of Action genre and reviews for these movies from the reviews table. Output only those movies that have reviews in the reviews table.
SELECT m.title, r.comment AS review
FROM movies m
JOIN reviews r
ON m.id = r.movie_id
WHERE m.genre = 'Action';

/*Get a list of movies from the movies table of Action genre and reviews for these movies from the reviews table. 
Output all movies even if they have no reviews in the reviews table.
Use COALESCE to replace NULL values with the message "No review" in the new reviews field*/
SELECT m.title AS movie, 
COALESCE(r.comment, 'No review')
AS review
FROM movies m
LEFT JOIN reviews r
ON m.id = r.movie_id
WHERE m.genre = 'Action';

/*Create a query that returns a list of all movies from the movies table and their associated genres and directors from the genres and directors tables.
The result should be sorted by the title field from the movies table in descending order.*/
SELECT m.title, d.name, g.name
FROM movies m
JOIN directors d
ON m.director_id = d.id
JOIN genres g
ON m.genre_id = g.id
ORDER BY m.title DESC;

/*Create a query that returns a list of all movies from the movies table and their associated genres and directors from the genres and directors tables. 
And also your query should select and count the number of reviews for each movie and write the result to the new reviews_count field, 
if the movie has no reviews, then the new reviews_count field should have a value of 0.*/
SELECT m.title, 
d.name AS director, 
g.name AS genre,
COALESCE(COUNT(r.id), 0) AS reviews_count
FROM movies m
JOIN directors d
ON m.director_id = d.id
JOIN genres g
ON m.genre_id = g.id
LEFT JOIN reviews r
ON m.id = r.movie_id
GROUP BY m.id
ORDER BY m.title DESC;

/*Create a query that returns a list of all movies from the movies table and their associated genres and directors from the genres and directors tables. 
And also your query should determine if there are reviews for each movie and write the result to the new reviews field, 
if there are reviews for the movie then write the value 'is' , otherwise write the value 'is not'.
The result should be sorted by the title field from the movies table in descending order.*/
SELECT m.title, 
d.name AS director, 
g.name AS genre,
IF(COUNT(r.id) > 0, 'is', 'is not') AS reviews
FROM movies m
JOIN directors d
ON m.director_id = d.id
JOIN genres 
ON m.genre_id = g.id
LEFT JOIN reviews 
ON m.id = r.movie_id
GROUP BY m.id
ORDER BY m.title DESC;

/*A query that will return a list of movies from the movies table and their associated genres and directors from the genres and directors tables. 
Your query should select and count the number of reviews for each movie and write the result to the new reviews field. Round the average rating to an integer.
The query should return the average rating of each movie based on the reviews in the reviews table, 
if a movie has no reviews (with a rating) then the rating for that movie should be 0. The result should be sorted by the title field from the movies table in descending order.*/
SELECT m.title, d.name AS director, g.name AS genre,
IF ((ROUND(AVG(r.rating),0)) IS NULL, 0,(ROUND(AVG(r.rating),0))) AS rating,
COUNT(r.movie_id) AS reviews
FROM movies m
LEFT JOIN reviews r
ON m.id = r.movie_id
LEFT JOIN directors d
ON m.director_id = d.id
LEFT JOIN genres g
ON m.genre_id = g.id
GROUP BY m.id
ORDER BY m.title DESC;
