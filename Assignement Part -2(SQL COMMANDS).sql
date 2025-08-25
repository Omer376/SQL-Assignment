##SQL COMMANDS##

##Q1)Identify the primary keys and foreign keys in maven movies db. Discuss the differences
## DONT HAVE THE MAVEN DATABASE PRESENT IN MY SQL

##Q2)List all details of actors
use sakila;
select * from actor;

##Q3)List all customer information from DB.
select * from customer;

##Q4)List different countries
use world;
select name from country;

##Q5)Display all active customers.
use sakila;
select customer_id,first_name,last_name from customer
where active=1;

#Q6)List of all rental IDs for customer with ID 1.
select rental_id,customer_id,rental_date
from rental 
where rental_id=1;

#Q7) Display all the films whose rental duration is greater than 5 
select film_id,title from film
where rental_duration>5;

#Q8)List the total number of films whose replacement cost is greater than $15 and less than $20
select count(replacement_cost) as total_movie 
from film
where replacement_cost  between 15 and 20;


#Q9)Display the count of unique first names of actors
select count(distinct first_name) as Unique_name
from actor;


#Q10)Display the first 10 records from the customer table .
select * from customer
limit 10;


#Q11) Display the first 3 records from the customer table whose first name starts with ‘b’
select first_name,customer_id from customer
where first_name like 'b%';


#Q12)Display the names of the first 5 movies which are rated as ‘G’.
select film_id,title,rating from film
where rating like 'g';

#Q13)Find all customers whose first name starts with "a".
select customer_id,first_name,active from customer
where first_name like 'a%';

#Q14)Find all customers whose first name ends with "a".
select customer_id,first_name,active from customer
where first_name like '%a';

#Q15) Display the list of first 4 cities which start and end with ‘a’ .
select city_id,city from city
where city like '%a'
limit 4;

#Q16)Find all customers whose first name have "NI" in any position.
select customer_id,first_name from customer
where first_name like '%ni%';


#Q17)Find all customers whose first name have "r" in the second position .
select customer_id,first_name from customer
where first_name like '_r%';

#Q18) Find all customers whose first name starts with "a" and are at least 5 characters in length.
select customer_id,first_name from customer
where first_name like 'a____%';

#Q19) Find all customers whose first name starts with "a" and ends with "o".
select customer_id,first_name from customer
where first_name like 'a%o';

#Q20)Get the films with pg and pg-13 rating using IN operator.
select film_id,title,rating from film
where rating like '%pg%' or '%pg-13%';


#Q21)Get the films with length between 50 to 100 using between operator.
select film_id,title,rating,length from film
where length between 50 and 100;

#Q22)Get the top 50 actors using limit operator.
select actor_id,first_name,last_name from actor
limit 50;

#Q23)Get the distinct film ids from inventory table.
select distinct film_id,inventory_id from inventory;















