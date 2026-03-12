SELECT * FROM parks_and_recreation.employee_demographics;

SELECT first_name FROM parks_and_recreation.employee_demographics;

SELECT first_name,
last_name,
birth_date ,
age,
age+10
FROM parks_and_recreation.employee_demographics;

SELECT DISTINCT first_name
FROM parks_and_recreation.employee_demographics;

SELECT DISTINCT gender
FROM parks_and_recreation.employee_demographics;

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE first_name = 'April';

SELECT * 
FROM parks_and_recreation.employee_salary;

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary > 50000;

#Logical Operators -> AND OR NOT

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01' AND gender= 'Male';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE (first_name = 'April' AND age =29) OR age>55;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE '%r%';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'L__%';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date LIKE '1989%';

SELECT gender
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

SELECT first_name
FROM parks_and_recreation.employee_demographics
GROUP BY first_name;

SELECT gender ,AVG(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender;


SELECT occupation,AVG(salary)
FROM parks_and_recreation.employee_salary
GROUP BY occupation;

SELECT occupation,salary
FROM parks_and_recreation.employee_salary
GROUP BY occupation,salary;


SELECT gender ,AVG(age),MAX(age),MIN(age),count(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

SELECT *
FROM parks_and_recreation.employee_demographics
order by first_name ASC;

SELECT *
FROM parks_and_recreation.employee_demographics
order by first_name desc;

SELECT *
FROM parks_and_recreation.employee_demographics
order by gender,age DESC;





