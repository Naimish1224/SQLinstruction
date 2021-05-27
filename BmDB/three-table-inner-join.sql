-- three table join question

select * from movie
join credit on movieid  = movie.id
join actor on actorid = actor.id;
