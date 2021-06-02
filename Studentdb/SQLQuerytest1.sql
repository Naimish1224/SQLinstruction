select * from Major;

select * from Student where SAT < 1000;

select Firstname, Lastname, YearsExperience from Instructor
order by Lastname desc;

select * from Student
join major on majorId = major.id;


-- list of student grades

Select firstname, lastname, ClassGradeValue, Subject from StudentClass
join student on studentid = student.id
join class on classid = class.id;


-- list of student class enrolled, grade, instructor

select student.firstname, student.lastname, Instructor.firstname, Instructor.lastname, ClassGradeValue, Subject from StudentClass
join Class on ClassId = Class.Id
join student on studentid = student.Id
join Instructor on InstructorId = Instructor.Id

-- list of student class enrollment
select student.firstname, student.lastname, Subject from StudentClass
join Class on ClassId = Class.Id
join student on studentid = student.Id
join Instructor on InstructorId = Instructor.Id;

--outer join report all student, class enrollment includ student with no class enrolled

select student.firstname, student.lastname, ClassId from Student
left outer join studentclass on StudentId = student.id;



select * from StudentClass;





