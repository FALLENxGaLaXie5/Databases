/* Database Systems, Coronel/Morris */
/* Type of SQL : MySQL  */
create database largeco;
use largeco;

CREATE TABLE lgbrand (
  brand_id   NUMERIC(4,0)   NULL,
  brand_name VARCHAR(100) NULL,
  brand_type VARCHAR(20)  NULL
)ENGINE = InnoDB;

CREATE TABLE lgproduct (
  prod_sku      VARCHAR(15)  NOT NULL,
  prod_descript VARCHAR(255) NULL,
  prod_type     VARCHAR(255) NULL,
  prod_base     VARCHAR(255) NULL,
  prod_category VARCHAR(255) NULL,
  prod_price    NUMERIC(10,2)  NULL,
  prod_qoh      NUMERIC(10,0)  NULL,
  prod_min      NUMERIC(10,0)  NULL,
  brand_id      NUMERIC(4,0)   NULL
)ENGINE = InnoDB;

CREATE TABLE lgvendor (
  vend_id     NUMERIC(6,0)   NOT NULL,
  vend_name   VARCHAR(255) NULL,
  vend_street VARCHAR(50)  NULL,
  vend_city   VARCHAR(50)  NULL,
  vend_state  VARCHAR(2)   NULL,
  vend_zip    VARCHAR(5)   NULL
)ENGINE = InnoDB;

CREATE TABLE lgsupplies (
  prod_sku VARCHAR(15) NOT NULL,
  vend_id  NUMERIC(5,0)  NOT NULL
)ENGINE = InnoDB;

CREATE TABLE lgdepartment (
  dept_num      NUMERIC(5,0)  NOT NULL,
  dept_name     VARCHAR(50) NOT NULL,
  dept_mail_box VARCHAR(3)  NULL,
  dept_phone    VARCHAR(9)  NULL,
  emp_num       NUMERIC(6,0)  NULL
)ENGINE = InnoDB;

CREATE TABLE lgemployee (
  emp_num      NUMERIC(6,0)  NOT NULL,
  emp_fname    VARCHAR(20) NULL,
  emp_lname    VARCHAR(25) NOT NULL,
  emp_email    VARCHAR(25) NOT NULL,
  emp_phone    VARCHAR(20) NULL,
  emp_hiredate DATE         NOT NULL,
  emp_title    VARCHAR(45) NOT NULL,
  emp_comm     NUMERIC(2,2)  NULL,
  dept_num     NUMERIC(5,0)  NULL
)ENGINE = InnoDB;

CREATE TABLE lgsalary_history (
  emp_num    NUMERIC(6,0)  NULL,
  sal_from   DATE         NULL,
  sal_end    DATE         NULL,
  sal_amount NUMERIC(10,2) NULL
)ENGINE = InnoDB;

CREATE TABLE lgcustomer (
  cust_code    NUMERIC(38,0) NOT NULL,
  cust_fname   VARCHAR(20) NOT NULL,
  cust_lname   VARCHAR(20) NOT NULL,
  cust_street  VARCHAR(70) NULL,
  cust_city    VARCHAR(50) NULL,
  cust_state   CHAR(2)      NULL,
  cust_zip     CHAR(5)      NULL,
  cust_balance NUMERIC(8,2)  NULL
)ENGINE = InnoDB;

CREATE TABLE lginvoice (
  inv_num     NUMERIC(38,0) NOT NULL,
  inv_date    DATE         NULL,
  cust_code   NUMERIC       NULL,
  inv_total   NUMERIC(11,2) NULL,
  employee_id NUMERIC       NULL
)ENGINE = InnoDB;

CREATE TABLE lgline (
  inv_num    NUMERIC       NOT NULL,
  line_num   NUMERIC       NOT NULL,
  prod_sku   VARCHAR(15) NULL,
  line_qty   NUMERIC       NULL,
  line_price NUMERIC(8,2)  NULL
)ENGINE = InnoDB;

#NEW TABLE
CREATE TABLE lgmanager (
  emp_num NUMERIC(6,0) NOT NULL,
  dept_num NUMERIC(5,0) NOT NULL
) ENGINE = InnoDB;

ALTER TABLE lginvoice MODIFY COLUMN cust_code decimal(38,0);
ALTER TABLE lginvoice MODIFY COLUMN employee_id decimal(6,0);
ALTER TABLE lgline MODIFY COLUMN inv_num decimal(38,0);

ALTER TABLE lgbrand ADD PRIMARY KEY (brand_id);
ALTER TABLE lgproduct ADD PRIMARY KEY (prod_sku);
ALTER TABLE lgproduct ADD FOREIGN KEY (brand_id) REFERENCES lgbrand(brand_id);
ALTER TABLE lgvendor ADD PRIMARY KEY (vend_id);
ALTER TABLE lgsupplies ADD PRIMARY KEY (prod_sku, vend_id);
ALTER TABLE lgsupplies ADD FOREIGN KEY (prod_sku) REFERENCES lgproduct(prod_sku);
ALTER TABLE lgsupplies ADD FOREIGN KEY (vend_id) REFERENCES lgvendor(vend_id);
ALTER TABLE lgdepartment ADD PRIMARY KEY (dept_num);
ALTER TABLE lgemployee ADD PRIMARY KEY (emp_num);
ALTER TABLE lgemployee ADD FOREIGN KEY (dept_num) REFERENCES lgdepartment(dept_num);
ALTER TABLE lgsalary_history ADD PRIMARY KEY (emp_num, sal_amount);
ALTER TABLE lgsalary_history ADD FOREIGN KEY (emp_num) REFERENCES lgemployee(emp_num);
ALTER TABLE lgcustomer ADD PRIMARY KEY (cust_code);
ALTER TABLE lginvoice ADD PRIMARY KEY (inv_num);
ALTER TABLE lginvoice ADD FOREIGN KEY (cust_code) REFERENCES lgcustomer(cust_code);
ALTER TABLE lginvoice ADD FOREIGN KEY (employee_id) REFERENCES lgemployee(emp_num);
ALTER TABLE lgline ADD PRIMARY KEY (inv_num, line_num);
ALTER TABLE lgline ADD FOREIGN KEY (inv_num) REFERENCES lginvoice(inv_num);
ALTER TABLE lgline ADD FOREIGN KEY (prod_sku) REFERENCES lgproduct(prod_sku);
ALTER TABLE lgmanager ADD PRIMARY KEY (emp_num, dept_num);
ALTER TABLE lgmanager ADD FOREIGN KEY (emp_num) REFERENCES lgemployee(emp_num);
ALTER TABLE lgmanager ADD FOREIGN KEY (dept_num) REFERENCES lgdepartment(dept_num);
ALTER TABLE lgmanager ADD FOREIGN KEY (emp_num) REFERENCES lgemployee(emp_num);
ALTER TABLE lgmanager ADD FOREIGN KEY (dept_num) REFERENCES lgdepartment(dept_num);