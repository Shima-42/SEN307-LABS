In the Part 4, I tried to delete the 'Library and Information Science' department and it gave me the error, Error 1451: Cannot delete or update a parent row: a foreign key constraint fails. 

MySQL refused to execute this statement because a record in the child table (Student) references the dept_id of the parent row in Department; deleting the parent row directly would create an orphaned record and disobey the referential integrity. 

I fixed the error by first running an UPDATE statement to reassign the dependent student (matric_no = '20239999') to an existing department ('Software Engineering'), allowing the DELETE query to execute successfully without losing student data. 
