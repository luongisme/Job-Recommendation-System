CREATE TABLE companies (
    company_id INT PRIMARY KEY NOT NULL,
    company_name VARCHAR(100),
    company_description TEXT,
    company_size INT,
    state VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    zip_code VARCHAR(50),
    address TEXT,
    url TEXT
);

CREATE TABLE company_industries (
    industry VARCHAR(100),
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

CREATE TABLE company_specialities (
    specialty VARCHAR(100),
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

CREATE TABLE employee_counts (
    employee_count INT,
    follower_count INT,
    time_recorded VARCHAR(100), -- e.g. Unix timestamp as string
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

CREATE TABLE jobs (
    job_id VARCHAR(50) PRIMARY KEY NOT NULL,
    title TEXT,
    job_description TEXT,
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

CREATE TABLE benefits (
    job_id VARCHAR(50),
    inferred INT,
    type VARCHAR(50),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

CREATE TABLE skills (
    skill_abr VARCHAR(50) PRIMARY KEY NOT NULL,
    skill_name VARCHAR(100)
);

CREATE TABLE industries (
    industry_id INT PRIMARY KEY NOT NULL,
    industry_name VARCHAR(100)
);

CREATE TABLE job_skills (
    skill_abr VARCHAR(50),
    job_id VARCHAR(50),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    FOREIGN KEY (skill_abr) REFERENCES skills(skill_abr)
);

CREATE TABLE job_industries (
    industry_id INT,
    job_id VARCHAR(50),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    FOREIGN KEY (industry_id) REFERENCES industries(industry_id)
);

CREATE TABLE salaries (
    salary_id INT PRIMARY KEY NOT NULL,
    max_salary NUMERIC(20,1),
    median_salary NUMERIC(20,1),
    min_salary NUMERIC(20,1),
    pay_period VARCHAR(50),
    currency VARCHAR(50),
    compensation_type VARCHAR(50),
    job_id VARCHAR(50),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);
