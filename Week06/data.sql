USE sen307_11923;

INSERT INTO Department (dept_name) VALUES
('Software Engineering'),
('Computer Science'),
('Artificial Intelligence'),
('Data Science'),
('Cybersecurity');

INSERT INTO Course (course_code, course_title, credit_units, description, dept_id) VALUES
('SEN307', 'Database Systems', 3,
'Relational database design, SQL queries, normalization, transactions and indexing using MySQL.',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('SEN301', 'Software Architecture', 3,
'Architectural styles, design patterns, microservices and how to structure large software systems.',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('COS301', 'Operating Systems', 3,
'Processes, threads, CPU scheduling, memory management and file systems.',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('COS305', 'Computer Networks', 3,
'TCP/IP, routing, switching, LAN and WAN design and network protocols.',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('AIN301', 'Introduction to Artificial Intelligence', 3,
'Intelligent agents, search algorithms, knowledge representation and reasoning.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN305', 'Machine Learning', 3,
'Supervised and unsupervised learning, neural networks, deep learning and model evaluation.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN307', 'Natural Language Processing', 3,
'Text processing, word embeddings, language models, sentiment analysis and chatbots.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('DTS301', 'Data Visualization and Analytics', 2,
'Exploratory data analysis, charts, dashboards and telling stories with data.',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('DTS305', 'Big Data Technologies', 3,
'Distributed storage and processing of very large datasets with Hadoop and Spark.',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('CYB301', 'Network Security', 3,
'Firewalls, cryptography, intrusion detection and protecting networks from attacks.',
(SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));

SELECT d.dept_name, COUNT(c.course_id) AS courses
FROM Department d 
LEFT JOIN Course c ON d.dept_id = c.dept_id
GROUP BY d.dept_name;

INSERT INTO Lecturer (staff_no, full_name, email, dept_id) VALUES
('VUA/ST/101', 'Dr Amaka Okafor', 'a.okafor@vua.edu.ng', 1),
('VUA/ST/102', 'Dr Musa Bello', 'm.bello@vua.edu.ng', 1),
('VUA/ST/103', 'Mr Goodluck Isioma', 'g.isioma@vua.edu.ng', 2),
('VUA/ST/104', 'Dr Charles Nnamdi', 'c.nnamdi@vua.edu.ng', 2),
('VUA/ST/105', 'Dr Richard Emoche', 'r.emoche@vua.edu.ng', 3),
('VUA/ST/106', 'Mr Victor Ayamba', 'v.ayamba@vua.edu.ng', 3),
('VUA/ST/107', 'Dr Julius Olajire', 'j.olajire@vua.edu.ng', 4),
('VUA/ST/108', 'Mrs Mary Karma', 'm.karma@vua.edu.ng', 4),
('VUA/ST/109', 'Dr Yakubu Gowon', 'y.gowon@vua.edu.ng', 5),
('VUA/ST/110', 'Mr Alfred Audu', 'a.audu@vua.edu.ng', 5);

INSERT INTO Student (matric_no, full_name, gender, date_of_birth, dept_id) VALUES
('11923', 'Tyagher Msurshima', 'F', '2004-05-12', 1), -- My Record
('20231234', 'Ada Obi', 'F', '2005-03-14', 1),
('20231235', 'John Musa', 'M', '2004-11-02', 2),
('20231236', 'Chisom Ceejay', 'M', '2003-08-19', 1),
('20231237', 'Helena Bassey', 'F', '2005-01-25', 1),
('20231238', 'Christopher Eke', 'M', '2004-06-30', 2),
('20231239', 'Emeka Nwosu', 'M', '2006-02-14', 3),
('20231240', 'Fatima Abubakar', 'F', '2005-07-11', 3),
('20231241', 'Ibrahim Garba', 'M', '2003-12-05', 4),
('20231242', 'Zainab Usman', 'F', '2006-04-18', 4),
('20231243', 'David Adebayo', 'M', '2005-09-09', 5),
('20231244', 'Nkechi Egwu', 'F', '2004-10-21', 5),
('20231245', 'Tunde Bakare', 'M', '2007-03-03', 1),
('20231246', 'Amina Idris', 'F', '2005-11-15', 2),
('20231247', 'Samuel Chukwu', 'M', '2004-02-28', 3),
('20231248', 'Grace Danjuma', 'F', '2006-08-07', 4),
('20231249', 'Usman Aliyu', 'M', '2003-05-19', 5),
('20231250', 'Funke Akindele', 'F', '2005-12-01', 1),
('20231251', 'Kelechi Okafor', 'M', '2004-07-04', 2),
('20231252', 'Bisi Akande', 'F', '2005-06-20', 3);

INSERT INTO Enrolment (student_id, course_id) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1),
(1, 2), (2, 2), (3, 2), (4, 2),
(3, 3), (4, 3), (8, 3), (9, 3),
(5, 4), (6, 4), (10, 4), (11, 4),
(7, 5), (8, 5), (12, 5), (13, 5),
(9, 6), (10, 6), (14, 6), (15, 6),
(11, 7), (12, 7), (16, 7), (17, 7),
(13, 8), (14, 8), (18, 8),
(15, 9), (16, 9), (1, 9),
(17, 10), (18, 10), (2, 10);

INSERT INTO CourseAllocation (course_id, lecturer_id) VALUES
(1, 1), (1, 2),
(2, 1),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

SET SQL_SAFE_UPDATES = 0;
SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '20231234';
UPDATE Student SET dept_id = 2 WHERE matric_no = '20231234';
SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '20231234';
SET SQL_SAFE_UPDATES = 1;

INSERT INTO Department (dept_name) VALUES ('Library and Information Science');

INSERT INTO Student (matric_no, full_name, dept_id)
VALUES ('20239999', 'Transfer Student', 
(SELECT dept_id FROM Department WHERE dept_name = 'Library and Information Science'));

-- DELETE FROM Department WHERE dept_name = 'Library and Information Science';

SET SQL_SAFE_UPDATES = 0;

UPDATE Student
SET dept_id = (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')
WHERE matric_no = '20239999';

DELETE FROM Department WHERE dept_name = 'Library and Information Science';

SET SQL_SAFE_UPDATES = 1;

SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL SELECT 'Lecturers', COUNT(*) FROM Lecturer
UNION ALL SELECT 'Students', COUNT(*) FROM Student
UNION ALL SELECT 'Courses', COUNT(*) FROM Course
UNION ALL SELECT 'Enrolments', COUNT(*) FROM Enrolment
UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;