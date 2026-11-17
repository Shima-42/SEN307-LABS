-- =========================================================================
-- VUA-SEN307 Lab 5: SELECT, Filtering and Joins
-- Name: Tyagher Msurshima
-- Matric: VUG/SEN/24/11923
-- =========================================================================

USE sen307_11923;

-- -------------------------------------------------------------------------
-- Task 1: Students in one department, sorted A-Z
-- -------------------------------------------------------------------------
SELECT s.student_id, s.full_name, s.gender, d.dept_name
FROM Student s INNER JOIN Department d ON s.dept_id = d.dept_id WHERE d.dept_name = 'Software Engineering'
ORDER BY s.full_name ASC;

-- Explanation: Joins the Student and Department tables on dept_id, filters the results to only show students in 'Software Engineering', and sorts 
-- them alphabetically from A to Z by their full name.[cite: 2]


-- -------------------------------------------------------------------------
-- Task 2: Courses with their lecturers using INNER JOIN
-- -------------------------------------------------------------------------
SELECT c.course_code, c.course_title, l.full_name AS lecturer_name
FROM Course c INNER JOIN CourseAllocation ca ON c.course_id = ca.course_id INNER JOIN Lecturer l ON ca.lecturer_id = l.lecturer_id
ORDER BY c.course_code ASC;

-- Explanation: Uses two INNER JOINs to link Course to Lecturer through the CourseAllocation junction table.
-- Only courses with assigned lecturers are returned, and courses co-taught by two lecturers appear twice.[cite: 2]


-- -------------------------------------------------------------------------
-- Task 3: Students and their courses using LEFT JOIN
-- -------------------------------------------------------------------------
-- Part a: every student and their courses (including those with none)[cite: 2]
SELECT s.full_name, c.course_title
FROM Student s LEFT JOIN Enrolment e ON s.student_id = e.student_id
LEFT JOIN Course c ON e.course_id = c.course_id ORDER BY s.full_name ASC;

-- Part b: only students with NO enrolled courses[cite: 2]
SELECT s.full_name, c.course_title
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
LEFT JOIN Course c ON e.course_id = c.course_id
WHERE c.course_title IS NULL
ORDER BY s.full_name ASC;

-- Explanation: LEFT JOIN keeps every row from the Student table even if there 
-- is no matching record in Enrolment or Course (displaying NULL for course_title).[cite: 1, 2]
-- Adding WHERE c.course_title IS NULL isolates only the unenrolled students.[cite: 2]


-- -------------------------------------------------------------------------
-- Task 4: Filtering with AND,OR,IN,BETWEEN
-- -------------------------------------------------------------------------
SELECT student_id, full_name, gender, dept_id, date_of_birth
FROM Student
WHERE gender = 'F' AND (dept_id IN (1, 3) OR dept_id = 2) AND date_of_birth BETWEEN '2004-01-01' AND '2005-12-31'
ORDER BY full_name ASC;

-- Explanation: Combines AND, OR, IN, and BETWEEN to find female students 
-- belonging to departments 1, 2, or 3 who were born between Jan 1, 2004 and 
-- Dec 31, 2005. Parentheses ensure the OR condition is evaluated properly 
-- alongside the AND filters.[cite: 2]


-- -------------------------------------------------------------------------
-- Task 5: Paginating enrolments with LIMIT and OFFSET
-- -------------------------------------------------------------------------
-- Page 1 (rows 1-10)
SELECT * FROM Enrolment ORDER BY enrolment_id ASC LIMIT 10 OFFSET 0;

-- Page 2 (rows 11-20)
SELECT * FROM Enrolment ORDER BY enrolment_id ASC LIMIT 10 OFFSET 10;

-- Explanation: Uses LIMIT 10 to restrict output to 10 rows per page, while 
-- OFFSET skips previous rows (0 for page 1, 10 for page 2). ORDER BY is 
-- complusory with LIMIT or OFFSET because mySQL tables have no guaranteed physical 
-- order; without it, rows could appear in random order across pages or duplicate.[cite: 3]


-- -------------------------------------------------------------------------
-- Challenge : Task 3 using RIGHT JOIN
-- -------------------------------------------------------------------------
SELECT s.full_name, c.course_title FROM Course c RIGHT JOIN Enrolment e ON c.course_id = e.course_id
RIGHT JOIN Student s ON e.student_id = s.student_id ORDER BY s.full_name ASC;

-- Explanation: Reverses the table order so Student is on the right, ensuring 
-- all students are preserved even without matching enrolments. The LEFT JOIN 
-- version is much easier to read because it follows natural left-to-right 
-- logic starting from the primary entity we care about (Student).[cite: 1, 2, 3]