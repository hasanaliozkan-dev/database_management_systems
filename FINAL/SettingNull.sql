use human_resources;
update Employee 
set zip = null
where zip = 'null';

update Employee 
set last_performance_review_date = null
where last_performance_review_date = 'null';

update TermReason 
set  term_reason = null
where term_reason = 'null';

update PositionHistory
set  date_of_termination = null
where date_of_termination = 'null';

