SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT first_name, 
last_name, 
birth_date,
age,
(age + 10) * 10 + 10
FROM parks_and_recreation.employee_demographics;
# PEMDAS (p = parenthesis, E = exponent, M = multiplication, D = division, A = addition, S = subtraction)

SELECT DISTINCT first_name, gender
FROM parks_and_recreation.employee_demographics;

-- WHERE CLAUSE --
SELECT *
FROM employee_salary
WHERE first_name = 'leslie'
;

SELECT *
FROM employee_salary
WHERE salary <= 50000
;

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
;

-- AND OR NOT -- Logical Operators
SELECT *
FROM employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age > 55
;

-- LIKE STATEMENT 
-- % and __
SELECT *
FROM employee_demographics
WHERE birth_date LIKE '1989%'
;

-- GROUP BY 

SELECT *
FROM employee_demographics;


SELECT gender, AVG (age), max(age), min(age), count(age) 
FROM employee_demographics
GROUP BY gender
;

SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary
;

-- ORDER BY
SELECT *
FROM employee_demographics
ORDER BY  gender, age
;

-- HAVING VS WHERE 

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;

SELECT 
    occupation, AVG(salary)
FROM
    employee_salary
WHERE
    occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000
;

-- Limit & Aliasing
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 1
;

-- Aliasing
SELECT gender, avg(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40
;


-- Joins 

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;


SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- Outter Join

SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- Self Join
SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_name,
emp2.first_name AS first_name_emp,
emp2.last_name AS last_name_emp
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id
;

-- Joining Multiple Table Together
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
    INNER JOIN parks_departments pd
		ON sal.dept_id = pd.department_id
;

SELECT *
FROM parks_departments;


-- UNIONS 

SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary
;

SELECT first_name, last_name, 'old Man' AS label
FROM employee_demographics
WHERE age > 40 AND gender = 'male'
UNION

SELECT first_name, last_name, 'old Lady' AS label
FROM employee_demographics
WHERE age > 40 AND gender = 'female'
UNION

SELECT first_name, last_name, 'highly paid employee' AS label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
; 

-- String Function

SELECT length('skyfall') ;

SELECT first_name, length(first_name)
FROM employee_demographics 
ORDER BY 2
;

SELECT upper('sky');
SELECT lower('SKY');

SELECT first_name, upper(first_name)
FROM employee_demographics
;

SELECT Rtrim('         sky       ');

SELECT first_name, 
left(first_name, 4),
right(first_name, 4),
substring(first_name,3,2),
birth_date,
substring(birth_date,6,2) as birth_month
FROM employee_demographics 
;

SELECT  first_name, replace(first_name, 'a', 'z')
FROM employee_demographics;

SELECT locate('x','Alexander');

SELECT  first_name, last_name,
concat(first_name, ' ', last_name) as full_name
FROM employee_demographics;