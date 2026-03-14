-- Temparary table

CREATE TEMPORARY TABLE temp_table(
first_name varchar(50),
last_name varchar(50),
favoroute_film varchar(100)
);

INSERT INTO temp_table(first_name,last_name,favoroute_film)
VALUES
('Dhanush','nayak','SDE');

select * from temp_table;


CREATE temporary TABLE salary_greater_than_50k
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary>50000;

SELECT *
FROM salary_greater_than_50k;

CREATE PROCEDURE large_salary()
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary>=50000;

CALL large_salary();

DELIMITER $$
CREATE PROCEDURE large_salary2()
BEGIN
	SELECT *
	FROM parks_and_recreation.employee_salary
	WHERE salary>=50000;
	SELECT *
	FROM parks_and_recreation.employee_salary
	WHERE salary>=10000;
END $$
DELIMITER ;

call large_salary2();

DELIMITER $$
CREATE PROCEDURE large_salary6(employee_id INT)
BEGIN
	SELECT salary
	FROM parks_and_recreation.employee_salary 
    WHERE employee_id=emp_id;
END $$
DELIMITER ;

CALL large_salary6(1);

DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    for each row
BEGIN
	INSERT INTO employee_demographics(employee_id,first_name,last_name)
    VALUES(NEW.employee_id, NEW.first_name,NEW.last_name);
END $$

delimiter ;

