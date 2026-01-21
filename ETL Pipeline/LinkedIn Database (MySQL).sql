CREATE DATABASE ijmrs;
USE ijmrs;

CREATE TABLE Companies (
	company_id INT PRIMARY KEY NOT NULL,
    company_name VARCHAR(100),
    company_description LONGTEXT,
    company_size INT,
    state VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    zip_code VARCHAR(50),
    address TEXT,
    url TEXT
);

CREATE TABLE Company_Industries (
	industry VARCHAR(100),
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES Companies(company_id)
);

CREATE TABLE Company_Specialities (
	specialty VARCHAR(100),
	company_id INT,
    FOREIGN KEY (company_id) REFERENCES Companies(company_id) 
);

CREATE TABLE Employee_Counts (
	employee_count INT,
    follower_count INT,
    time_recorded VARCHAR(100), -- E.g. 1712346173, 1712346248
	company_id INT,
    FOREIGN KEY (company_id) REFERENCES Companies(company_id) 
);

CREATE TABLE Jobs (
	job_id VARCHAR(50) PRIMARY KEY NOT NULL,
    title LONGTEXT,
    job_description LONGTEXT,
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES Companies(company_id)
);

CREATE TABLE Benefits (
	job_id VARCHAR(50),
    FOREIGN KEY (job_id) REFERENCES Jobs(job_id),
    inferred INT,
    type VARCHAR(50)
);

CREATE TABLE Skills (
	skill_abr VARCHAR(50) PRIMARY KEY NOT NULL,
    skill_name VARCHAR(100)
);

CREATE TABLE Industries (
	industry_id INT PRIMARY KEY NOT NULL,
    industry_name VARCHAR(100)
);

CREATE TABLE Job_Skills (
	skill_abr VARCHAR(50),
	job_id VARCHAR(50),
    FOREIGN KEY (job_id) REFERENCES Jobs(job_id)
);

CREATE TABLE Job_Industries (
	industry_id INT,
	job_id VARCHAR(50),
    FOREIGN KEY (job_id) REFERENCES Jobs(job_id),
    FOREIGN KEY (industry_id) REFERENCES Industries(industry_id)
);

CREATE TABLE Salaries (
	salary_id INT PRIMARY KEY NOT NULL,
    max_salary FLOAT(20, 1),
    median_salary FLOAT(20, 1),
    min_salary FLOAT(20, 1),
    pay_period VARCHAR(50),
    currency VARCHAR(50),
    compensation_type VARCHAR(50),
    job_id VARCHAR(50),
    FOREIGN KEY (job_id) REFERENCES Jobs(job_id)
);

