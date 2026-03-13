#inner join

SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT *
FROM parks_and_recreation.employee_salary;


SELECT *
FROM parks_and_recreation.employee_demographics AS dam
JOIN parks_and_recreation.employee_salary AS sal
ON dam.employee_id=sal.employee_id;

SELECT dem.employee_id,age,occupation,salary
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
ON dem.employee_id=sal.employee_id;

#Outer join
#Left outer join
SELECT *
FROM parks_and_recreation.employee_demographics AS dem
LEFT JOIN parks_and_recreation.employee_salary AS sal
ON dem.employee_id=sal.employee_id;

#Right outer join
SELECT *
FROM parks_and_recreation.employee_demographics AS dem
RIGHT JOIN parks_and_recreation.employee_salary AS sal
ON dem.employee_id=sal.employee_id;

#Full outer join
-- SELECT *
-- FROM parks_and_recreation.employee_demographics AS dem
-- FULL OUTER JOIN parks_and_recreation.employee_salary AS sal
-- ON dem.employee_id=sal.employee_id

#Self join

SELECT *
FROM parks_and_recreation.employee_salary as emp1
JOIN parks_and_recreation.employee_salary as emp2
	ON emp1.employee_id+1=emp2.employee_id;


-- Joining multiple tables

SELECT *
FROM parks_and_recreation.employee_demographics AS dam
JOIN parks_and_recreation.employee_salary AS sal
	ON dam.employee_id=sal.employee_id
JOIN parks_and_recreation.parks_departments as pd
	ON pd.department_id=sal.dept_id;

SELECT *
FROM parks_and_recreation.employee_demographics;

-- Union
SELECT first_name,last_name
FROM parks_and_recreation.employee_demographics
UNION
SELECT first_name,last_name
FROM parks_and_recreation.employee_salary;


SELECT first_name,last_name,'Old Man' as Label
FROM parks_and_recreation.employee_demographics
WHERE age>40 and gender='Male'
UNION
SELECT first_name,last_name,'Old Lady' as Label
FROM parks_and_recreation.employee_demographics
WHERE age>40 and gender='Female'
UNION
SELECT first_name,last_name, 'Highly paid employees' As Lable
FROM parks_and_recreation.employee_salary
WHERE salary>70000;


SELECT LENGTH('Dhanush');

SELECT first_name,LENGTH(first_name)
FROM parks_and_recreation.employee_demographics
ORDER BY first_name DESC;

SELECT UPPER('sky');
select lower('SKY');

select trim('          Hello             ');
select ltrim('          Hello             ');
select rtrim('          Hello             ');

SELECT first_name, LEFT(first_name,4)
FROM parks_and_recreation.employee_demographics;

SELECT first_name, RIGHT(first_name,4),
SUBSTRING(first_name,1,4)
FROM parks_and_recreation.employee_demographics;

SELECT first_name,REPLACE(first_name,'A','z')
FROM parks_and_recreation.employee_demographics;


SELECT first_name, LOCATE('AN',first_name)
FROM parks_and_recreation.employee_demographics;

SELECT first_name,last_name,
CONCAT(first_name,' ',last_name) AS Full_Name
FROM parks_and_recreation.employee_demographics;


SELECT first_name,last_name,age,
CASE
	WHEN age<=30 THEN 'Young'
    WHEN age BETWEEN 31 and 51 THEN 'Old'
END AS age_bracket
FROM parks_and_recreation.employee_demographics;

select *
from parks_and_recreation.employee_salary;


SELECT first_name,last_name,salary,
CASE
	WHEN salary < 50000 THEN salary+(salary*0.05)
    WHEN salary > 50000 THEN salary+(salary*0.07)
END as BONUS,
CASE
	WHEN dept_id=6 THEN salary+(salary*0.10)
END as Finance_department
FROM parks_and_recreation.employee_salary;


-- SUB QUERIES
select *
FROM parks_and_recreation.employee_demographics
WHERE employee_id IN(
	SELECT employee_id FROM parks_and_recreation.employee_salary
    where dept_id=1)

















