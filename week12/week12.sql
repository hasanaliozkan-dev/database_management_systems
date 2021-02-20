load data
infile "/usr/local/mysql8/files/denormalized_movie_db.csv"
into table denormalized
columns terminated by ';';


show variables like "secure_file_priv";
show variables like "%secu%";
set @@secure_file_priv = '';
select movie_id,title,ranking,rating,year,votes,duration,oscars,budget from denormalized;


insert into movies(movie_id,title,ranking,rating,year,votes,duration,oscars,budget)
select distinct movie_id,title,ranking,rating,year,votes,duration,oscars,budget from denormalized;

select * from movies;

insert into languages(movie_id,language_name)
select distinct movie_id,language_name from denormalized;

insert into genres(movie_id,genre_name)
select distinct movie_id,genre_name from denormalized;

insert into producer_countries
select distinct movie_id country_id from denormalized;

insert into countries
select distinct country_id,country_name from denormalized;

insert into directors
select distinct director_id,country_id,director_name from denormalized;

insert into movie_directors
select distinct movie_id,director_id from denormalized;

insert into stars
select distinct star_id,country_id,star_name from denormalized;

insert into movie_stars
select distinct movie_id,star_id from denormalized;

















