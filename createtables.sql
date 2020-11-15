-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE titles (
    title_id varchar(10)   NOT NULL,
    title varchar(30)   NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (
        title_id
     )
);


CREATE TABLE departments (
    dept_no varchar(10)   NOT NULL,
    dept_name varchar(20)   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL
);

CREATE TABLE deptemp (
    dept_no varchar(10)   NOT NULL,
    emp_no int   NOT NULL
);

CREATE TABLE deptmanagers (
    dept_no varchar(10)   NOT NULL,
    emp_no int   NOT NULL
);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE deptemp ADD CONSTRAINT fk_deptemp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE deptemp ADD CONSTRAINT fk_deptemp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE deptmanagers ADD CONSTRAINT fk_deptmanagers_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE deptmanagers ADD CONSTRAINT fk_deptmanagers_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

