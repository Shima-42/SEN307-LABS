-- =========================================================================
-- VUA-SEN307 Lab 6: Aggregate, Grouping and Subqueries".
-- Name: Tyagher Msurshima
-- Matric: VUG/SEN/24/11923
-- =========================================================================

USE sen307_11923;

-- -------------------------------------------------------------------------
-- Task 1: Count the students enrolled in each course, grouped by course. Include courses with zero students.
-- -------------------------------------------------------------------------
SELECT c.course_id, c.course_title, COUNT(e.student_id) AS total_students FROM Course c LEFT JOIN Enrolment e
ON c.course_id = e.course_id GROUP BY c.course_id, c.course_title ORDER BY total_students DESC, c.course_title ASC;


-- -------------------------------------------------------------------------
-- Task 2: Find the courses with more than a given number of students, using HAVING. Try thresholds of 3, 5 and 7.
-- -------------------------------------------------------------------------
SELECT c.course_id, c.course_title, COUNT(e.student_id) AS total_students FROM Course c LEFT JOIN Enrolment e 
ON c.course_id = e.course_id GROUP BY c.course_id, c.course_title HAVING COUNT(e.student_id) > 3 ORDER BY total_students DESC;

SELECT c.course_id, c.course_title, COUNT(e.student_id) AS total_students FROM Course c LEFT JOIN Enrolment e
ON c.course_id = e.course_id GROUP BY c.course_id, c.course_title HAVING COUNT(e.student_id) > 5 ORDER BY total_students DESC;

SELECT c.course_id, c.course_title, COUNT(e.student_id) AS total_students FROM Course c LEFT JOIN Enrolment e
ON c.course_id = e.course_id GROUP BY c.course_id, c.course_title HAVING COUNT(e.student_id) > 7 ORDER BY total_students DESC;

-- -------------------------------------------------------------------------
-- Task 3:Calculate the average number of courses taken per student, including students with zero courses.
-- -------------------------------------------------------------------------
SELECT
    ROUND(AVG(course_count), 2) AS avg_courses_per_student
FROM ( SELECT s.student_id, COUNT(e.course_id) AS course_count FROM Student s LEFT JOIN Enrolment e
       ON s.student_id = e.student_id GROUP BY s.student_id) AS per_student;
       
-- -------------------------------------------------------------------------
-- Task 4 (non-correlated subquery): Find the students who are not enrolled in any course.
-- -------------------------------------------------------------------------
SELECT s.student_id, s.full_name, s.dept_id FROM Student s
WHERE s.student_id NOT IN ( SELECT DISTINCT e.student_id FROM Enrolment e WHERE e.student_id IS NOT NULL);

-- -------------------------------------------------------------------------
-- Task 5 (correlated subquery). For each department, find the student with the highest number of enrolments. Ties are allowed.
-- -------------------------------------------------------------------------
SELECT d.dept_name, s.full_name,( SELECT COUNT(*) FROM Enrolment e WHERE e.student_id = s.student_id) AS courses
FROM Student s JOIN Department d ON s.dept_id = d.dept_id
WHERE ( SELECT COUNT(*) FROM Enrolment e WHERE e.student_id = s.student_id) = (SELECT MAX(dept_student_counts.cnt)
        FROM ( SELECT COUNT(*) AS cnt FROM Student s2 LEFT JOIN Enrolment e2 ON s2.student_id = e2.student_id WHERE s2.dept_id = s.dept_id
        GROUP BY s2.student_id) AS dept_student_counts) ORDER BY d.dept_name, s.full_name;
