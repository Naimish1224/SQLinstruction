SELECT * from class;
select * from student;
select * from studentclass;

-- 3 table join 
select firstname, lastname, code, subject, ClassGradeValue from student
join studentclass on studentid = student.id 
join class on classid = class.id;

select * from class;
select * from major;
select * from majorclass;

-- 3 table join with narrow to discription
select class.code, description, subject from major
join majorclass on majorid = major.id
join class on classid = class.id
where Description = 'general business';


select firstname, lastname, majorid, description from student
left outer join major on majorid = major.id;










