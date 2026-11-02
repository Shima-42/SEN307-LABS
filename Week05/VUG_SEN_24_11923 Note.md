VUG/SEN/24/11923  
TYAGHER MSURSHIMA’s Note

\-- Test 1: NOT NULL (should fail: dept\_name is required) INSERT INTO Department (dept\_name) VALUES (NULL);

Error Code: 1048\. Column 'dept\_name' cannot be null

 \-- Test 2: CHECK (should fail: credit\_units must be 1 to 6\)   
INSERT INTO Course (course\_code, course\_title, credit\_units) VALUES ('TST101', 'Test', 9); \--   
   
Error Code: 3819\. Check constraint 'chk\_credit\_units' is violated.

Test 3: FOREIGN KEY (should fail: department 999 does not exist) INSERT INTO Student (matric\_no, full\_name, dept\_id) VALUES ('TEST001', 'Test', 999); 

Error Code: 1452\. Cannot add or update a child row: a foreign key constraint fails (\`sen307\_11923\`.\`student\`, CONSTRAINT \`student\_ibfk\_1\` FOREIGN KEY (\`dept\_id\`) REFERENCES \`department\` (\`dept\_id\`))

\-- Test 4: ENUM (should fail: gender must be 'M' or 'F') INSERT INTO Student (matric\_no, full\_name, gender) VALUES ('TEST002', 'Test', 'X'); 

Error Code: 1265\. Data truncated for column 'gender' at row 1

UNQUE Test: INSERT INTO Department (dept\_name) VALUES ('Software Engineering'); 

Error Code: 1062\. Duplicate entry 'Software Engineering' for key 'department.dept\_name'

\-- Confirm every table is still empty SELECT COUNT(\*) FROM Department; SELECT COUNT(\*) FROM Course; SELECT COUNT(\*) FROM Student; 

 2\. Write 2–3 sentences in your notes comparing the generated ERD with your Week 4 model. 

The Week 5 diagram simplifies all table relationships by using clean integer primary keys (like course\_id) instead of natural keys like course\_code. It renames the teaching junction table to courseallocation and connects department directly to students, lecturers, and courses. Lastly, it adds new required fields like the student phone column and strict data constraints. 