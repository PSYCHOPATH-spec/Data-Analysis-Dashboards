use project_movie_database;

-- A.Can you get all data about movies?
-- Yes, But there are null values also
select * from movies;

-- B.How do you get all data about directors?
select * from directors;

-- C.Check how many movies are present in IMDB.
select count(*) from movies;

-- D.Find these 3 directors: James Cameron ; Luc Besson ; John Woo
select * from directors where name in ('James Cameron', 'Luc Besson', 'John Woo');

-- E.Find all directors with name starting with S.
select * from directors where name like 'S%';

-- F.Count female directors.
select count(*) from directors where gender='1';

-- G.Find the name of the 10th first women directors?
SELECT name
FROM directors
WHERE gender = '1'
ORDER BY id
LIMIT 1 OFFSET 9;

-- H.What are the 3 most popular movies?
SELECT original_title
FROM movies
ORDER BY popularity DESC
LIMIT 3;

-- I.What are the 3 most bankable movies?
SELECT original_title
FROM movies
ORDER BY revenue DESC
LIMIT 3;

-- J.What is the most awarded average vote since the January 1st, 2000?
SELECT original_title, vote_average
FROM movies
WHERE release_date >= '2000-01-01'
ORDER BY vote_average DESC
LIMIT 1;

-- K.Which movie(s) were directed by Brenda Chapman?
SELECT original_title
FROM movies
WHERE director_id = (
    SELECT id as director_id
    FROM directors
    WHERE name = 'Brenda Chapman'
);

-- L.Which director made the most movies?
SELECT id AS director_id, name
FROM directors
WHERE id = (
    SELECT director_id
    FROM movies
    GROUP BY director_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);
-- M.Which director is the most bankable?
SELECT id AS director_id, name
FROM directors
WHERE id =(
SELECT director_id
FROM movies
ORDER BY revenue DESC
LIMIT 1);

    





