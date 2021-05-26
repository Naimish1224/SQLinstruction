select * from student where statecode = 'oh';
SELECT * from student where firstname = 'eric';

select * from student
where statecode = 'ky' or statecode = 'in' ;

select * from student where sat < 1000 and gpa = 2; 

select * from student where gpa between 2 and 3 order by lastname;

select * from student where lastname like 'b%s';

-- underscore state starting with I
select * from student
where statecode like "I_";






