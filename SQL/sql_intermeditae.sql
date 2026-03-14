SELECT gender, AVG(salary) as avg_salary
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id=sal.employee_id
group by gender;

-- Windows function

SELECT gender, AVG(salary) OVER(partition by GENDER)
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id=sal.employee_id;
    
SELECT dem.first_name,dem.last_name, gender, SUM(salary) OVER(partition by GENDER)
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id=sal.employee_id;
    
SELECT dem.first_name,dem.last_name, gender,salary,
row_number() OVER()
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id=sal.employee_id;



	