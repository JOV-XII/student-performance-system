# Student Performance & Grade Management System Database

A relational MySQL database system designed to track student information, course subjects, and calculated academic grades across multiple programs and year levels.

## 📌 Project Overview
* **Database Name:** `student_performance_db`
* **Tables:** `students`, `subjects`, `grades`
* **Total Records:** 668+ student grade entries
* **Features:** Relational Foreign Keys, Computed/Generated Grade Columns, and Multi-Table SQL Queries.

## 🛠 Database Schema
* **`students`**: Contains `student_id`, `student_number`, `first_name`, `last_name`, `year_level`, `course`, and contact info.
* **`subjects`**: Contains `subject_id`, `subject_code`, `subject_name`, and `units`.
* **`grades`**: Contains foreign keys linking students and subjects, raw scores (`prelim_grade`, `midterm_grade`, `final_grade`), and an automated computed column for final transmuted grades (`grades`).

## 🔍 Sample SQL JOIN Query
This repository includes queries that combine data from all three tables to generate comprehensive student reports:

```sql
SELECT 
    s.student_number,
    CONCAT(s.first_name, ' ', s.last_name) AS full_name,
    s.course,
    sub.subject_code,
    sub.subject_name,
    g.prelim_grade,
    g.midterm_grade,
    g.final_grade,
    g.grades AS computed_grade
FROM grades g
INNER JOIN students s ON g.student_id = s.student_id
INNER JOIN subjects sub ON g.subject_id = sub.subject_id;
