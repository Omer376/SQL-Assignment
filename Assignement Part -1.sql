create database assignment;
use assignment;
## NO DATASET REQUIRED QUESTIONS

##Q1)
create table employees(
emp_id int primary key,
emp_name varchar(25) not null,
age int check(age>=18),
email varchar(40) unique,
salary float default(30000));

##Q2) Explain the purpose of constraints and how they help maintain data integrity in a database. Provide
##examples of common types of constraints.
##ANS:- Contraints are very important feature of mysql.It helps create data integrity by providing rules to various columns which 
##will make it easy for creating columns and inserting data into them


##Q3)Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify
##your answer.
##ANS:- NOT NULL is a constraints in MySQl with which we can restrict a column to not contain any null values. It will throw an error
##if we try to insert any null values. A primary key is both unique and not null. A primary key is an important column in
##any table with which we can identify other columns and join them. And if the primary contains any null values, it won't
##remain a primary key anymore as it would violate the orimary key rules of having not null values.


##Q4) Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an
##example for both adding and removing a constraint.
##ANS:-It is basically consist of two steps and they are mentioned below:-
## 1--> We firstly identify the column in which we want to apply or drop the constraints.
## 2--> We then apply DDL command which is ALTER TABLE _________and then we either use ADD CONSTRAINTS( for adding constranits)
##      or we use DROP CONSTRAINTS NAME to drop constraints from any column OR modify.
##EG:-

## FOR ADDING CONTRAINTS
ALTER TABLE employees
MODIFY age INT NOT NULL;

##FOR DROPPING
ALTER TABLE employees
MODIFY age INT ;



##Q5)Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.
##Provide an example of an error message that might occur when violating a constraint.
##ANS:- If any constraints are violated during the data insertion in the table, it will throw an error and won't execute 
##Until all the contraints rules are fulfilled. Given below is an example of what happens, if we violate the rule in table employees

insert into employees values(1234,"Omer",12,"omer@gmail.com"); ##IT will throw an error as the value of age is lower than 18 which is defined in the constraints


##Q6)You created a products table without constraints as follows:
CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10, 2));
##Now, you realise that
-- The product_id should be a primary keyQ
-- The price should have a default value of 50.00

alter table products
modify product_id int primary key;

alter table products
modify price decimal(10,2) default(50);


##Q7)You have two tables: STUDENT and CLASSES(given in the question paper)
-- Write a query to fetch the student_name and class_name for each student using an INNER JOIN
-- select student_name,class_name from student
-- inner join classes on
-- student.class_id = classes.class_id;


##Q8)Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are
##listed even if they are not associated with an order 
## ORDERS, CUSTOMERS AND PRODUCTS
##Hint: (use INNER JOIN and LEFT JOIN)

##ANS:-

-- select orders.order_id,customers.customer_name, products.product_name
-- from orders inner join customers
-- on orders.customer_id=customers.customer_id
-- left join products on orders.order_id=products.order_id
-- group by orders.order_id;


##Q9)Given the following tables:( Sales and Products)
## Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.
##ANS:- select sales.product_id, sum(sales.amount) as total sales
--       from sales inner join products on
--       sales.product_id=products.product_id
--       group by sales.product_id;

##Q10)You are given three tables:(orders,customers and order_details)
##Write a query to display the order_id, customer_name, and the quantity of products ordered by each
##customer using an INNER JOIN between all three tables.
##ANS:-
-- select orders.order_id, customers.customer_id,order_deatils.quantity
-- from orders inner join customers on
-- orders.customer_id= customers.customer_id
-- inner join order_details on
-- orders.order_id=order_details.order_id
-- order by order_details.quantity;

