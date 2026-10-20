USE student_performance_db;
SELECT 
    s.student_number,
    CONCAT(s.first_name, ' ', s.middle_name, ' ', s.last_name) AS full_name,
    s.course,
    s.year_level,
    sub.subject_code,
    sub.subject_name,
    sub.units,
    g.grades
FROM grades g
JOIN students s ON g.student_id = s.student_id
JOIN subjects sub ON g.subject_id = sub.subject_id
WHERE s.student_id = 1;