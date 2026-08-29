-- a

SELECT DISTINCT s.id, s.name
FROM student s
JOIN takes t ON s.id = t.id
WHERE t.course_id IN (
  SELECT c.course_id
  FROM course c
  WHERE c.dept_name LIKE 'Comp. Sci.'
)

SELECT DISTINCT student.ID, student.name
FROM student INNER JOIN takes  ON student.ID = takes.ID 
             INNER JOIN course ON takes.course_id = course.course_id
WHERE course.dept_name = 'Comp. Sci.';

-- b 
  
SELECT s.id, s.name
FROM student s
WHERE s.id NOT IN (
  SELECT t.id
  FROM takes t
  WHERE t.year < 2017
)

SELECT ID, name 
FROM student AS S
WHERE NOT EXISTS (
    SELECT * 
    FROM takes AS T
    WHERE year < 2017 AND T.ID = S.ID 
)

-- c

-- d
