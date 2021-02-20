use movie_db;
# 1. Show the films whose budget is greater than 10 million$ and ranking is less than 6.
select title 
from movies 
where budget>10000000 and ranking<6;
# 2. Show the action films whose rating is greater than 8.8 and produced after 2009.
select title 
from movies as m join genres as g on m.movie_id= g.movie_id 
where genre_name = "Action" and m.rating > 8.8 and year > 2009;
# 3. Show the drama films whose duration is more than 150 minutes and oscars is more than 2.
select title 
from movies
where duration > 150 and oscars > 2 and movie_id in (
	select movie_id
	from genres
	where genre_name = "Drama");
#with join operator
select title 
from movies as m join genres as g  on m.movie_id= g.movie_id 
where g.genre_name = "Drama" and m.duration>150 and oscars >2;
# 4. Show the films that Orlando Bloom and Ian McKellen have act together and has more than 2 Oscars.
select *
from movies 
where oscars > 2 and movie_id in
(select movie_id
from movie_stars
where star_id in 
(select star_id
from stars
where star_name = "Orlando Bloom" or star_name = "Ian McKellen"));

# 5. Show the Quentin Tarantino films which have more than 500000 votes and produced before 2000.	 
select title 
from movies 
where votes > 500000 and year<2000 and movie_id in (
select movie_id
from movie_directors
where director_id in(
select director_id
from directors
where director_name = "Quentin Tarantino"));

# 6. Show the thriller films whose budget is greater than 25 million$.
select title
from movies join genres on movies.movie_id = genres.movie_id
where genre_name = "Thriller" and budget > 25000000;
# with nested query
select title
from movies 
where  budget>25000000 and movie_id in (
select movie_id
from genres
where genre_name= "Thriller");

# 7. Show the drama films whose language is Italian and produced between 1990-2000.
# with join
select title
from movies 
join languages on languages.movie_id = movies.movie_id
join genres on movies.movie_id = genres.movie_id
where language_name = "Italian" and year >= 1990 and year<=2000 and genre_name = "Drama";
#half of nested query half of join
select title
from movies join languages on languages.movie_id = movies.movie_id 
where language_name = "Italian" and year >= 1990 and year<=2000 and movies.movie_id in (
select movie_id
from genres
where genre_name= "Drama");
# full nested query
select title
from movies
where movie_id in (
select movie_id
from genres
where genre_name= "Drama")
 and movie_id in (
select movie_id
from languages
where language_name="Italian") and year >= 1990 and year<=2000;
# 8. Show the films that Tom Hanks has act and have won more than 3 Oscars.	 
select title
from movies
where oscars > 3 and movie_id in(
select movie_id
from movie_stars 
where star_id in (
select star_id
from stars
where star_name = "Tom Hanks"));
# 9. Show the history films produced in USA and whose duration is between 100-200 minutes.
select title
from movies 
where duration> 100 and duration < 200 and movie_id in (
select movie_id
from genres
where genre_name = "History")
and movie_id in(select movie_id
from producer_countries
where country_id in (
select country_id
from countries
where country_name ="USA"));

# 10.Compute the average budget of the films directed by Peter Jackson.
select avg(budget)
from movies
where movie_id in(
select movie_id
from movie_directors
where director_id in(
select director_id
from directors
where director_name = "Peter Jackson"));
# 11.Show the Francis Ford Coppola film that has the minimum budget.
select title,budget
from movies
where budget = (select min(budget)
from movies
where movie_id in(
select movie_id
from movie_directors
where director_id in(
select director_id
from directors
where director_name = "Francis Ford Coppola")));

# 12.Show the film that has the most vote and has been produced in USA.
select title,votes
from movies
where votes =(select max(votes)
from movies 
where movie_id in(
select movie_id
from producer_countries
where country_id in(
select country_id
from countries
where country_name = "USA"))); 

