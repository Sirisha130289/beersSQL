CREATE TABLE companies
(
    company_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name       varchar(50)
);

CREATE TABLE employees
(
    employee_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name        varchar(50),
    job_title   varchar(50),
    company_id  INTEGER ,
    FOREIGN KEY (`company_id`) REFERENCES  companies(`company_id`) ON DELETE CASCADE
);

SELECT *FROM companies;
SELECT *FROM employees;

