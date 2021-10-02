-- Task 1. A.
SELECT course_id, credits
FROM course
WHERE credits > 3;

-- Task 1. B.
SELECT room_number, building
FROM classroom
WHERE building = 'Packard'
OR building = 'Watson';

-- Task 1. C.
SELECT course_id, title
FROM course
WHERE dept_name = 'Comp. Sci.';

-- Task 1. D.
SELECT course_id, semester
FROM section
WHERE semester = 'Fall';

--Task 1. E.
SELECT id, name, tot_cred
FROM student
WHERE tot_cred > 45 AND tot_cred < 90;

-- Task 1. F.
SELECT  id, name
FROM student
WHERE name LIKE '%a'
OR name LIKE '%e'
OR name LIKE '%i'
OR name LIKE '%o'
OR name LIKE '%u';

-- Task 1. G.
SELECT course_id
FROM prereq
WHERE prereq_id = 'CS-101';

-- Task 2. A.
SELECT dept_name, AVG(salary) AS AverageSalary
FROM instructor
GROUP BY dept_name
ORDER BY AverageSalary ASC;

-- -- Task 2. B. ???
-- SELECT min(building) AS BiggestBuilding
-- FROM classroom;
--
-- -- Task 2. C. ???
-- SELECT  count(dept_name) AS CntDept
-- FROM course
-- GROUP BY

-- Task 2. D. ???
-- SELECT id, name
-- FROM student

-- Task 2. E.
SELECT id, name
FROM instructor
WHERE dept_name = 'Biology'
OR dept_name = 'Music'
OR dept_name = 'Phylosophy';

-- -- Task 2. F.
SELECT name
FROM instructor
WHERE id IN (SELECT id FROM teaches WHERE year = 2018 AND year != 2017);

-- Task 3. A.
SELECT name
FROM student
WHERE dept_name = 'Comp. Sci.'
AND id IN
(
    SELECT  id FROM takes
    WHERE grade = 'A' OR grade = 'A-'
    AND course_id = 'CS-101'
)
ORDER BY name ASC;

-- Task 3. B.
SELECT DISTINCT instructor.name
FROM student, takes, advisor, instructor
WHERE advisor.i_id = instructor.id
AND student.id = advisor.s_id
AND student.id IN
(
    SELECT takes.id
    WHERE grade != 'A'
    OR grade != 'A-'
    OR grade != 'B+'
    OR grade != 'B'
);

-- Task 3. C.
SELECT DISTINCT dept_name
FROM course
WHERE dept_name NOT IN
(
    SELECT DISTINCT course.dept_name
    FROM course, takes
    WHERE takes.course_id = course.course_id
    AND takes.course_id IN
    (
        SELECT takes.course_id
        WHERE grade = 'F' OR grade = 'C'
    )
);

-- Task 3. D.
SELECT name
FROM instructor
WHERE dept_name NOT IN
(
    SELECT DISTINCT course.dept_name
    FROM course, takes
    WHERE takes.course_id = course.course_id
    AND takes.course_id IN
    (
        SELECT takes.course_id
        WHERE grade = 'A'
    )
);

--Task 3. E.
SELECT DISTINCT title
FROM course, section
WHERE section.course_id = course.course_id
AND time_slot_id = 'A'
OR time_slot_id = 'B'
OR time_slot_id = 'C'
OR time_slot_id = 'E'
OR time_slot_id = 'H'