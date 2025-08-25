#Q9)Display the title of the movie, customer s first name, and last name who rented it.
select film.title,inventory.film_id,rental.inventory_id,customer.first_name,customer.last_name
from film join inventory on
film.film_id=inventory.film_id
join rental on
inventory.inventory_id=rental.inventory_id
join customer on
rental.customer_id=customer.customer_id
order by customer.customer_id;

#Q10)Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
select f.title,ac.first_name,ac.last_name
from film f join film_actor fa
on f.film_id=fa.film_id join
actor ac on
fa.actor_id=ac.actor_id
where f.title='Gone with the Wind';

#Q11)Retrieve the customer names along with the total amount they've spent on rentals.
select c.first_name,c.last_name,sum(p.amount) as Total_Amount
from customer c join payment p
on c.customer_id=p.customer_id
join rental r on
p.rental_id=r.rental_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_amount DESC;

#Q12)List the titles of movies rented by each customer in a particular city (e.g., 'London').

SELECT c.first_name, 
       c.last_name, 
       ci.city, 
       f.title AS film_title
FROM customer c
JOIN address a     ON c.address_id = a.address_id
JOIN city ci       ON a.city_id = ci.city_id
JOIN rental r      ON c.customer_id = r.customer_id
JOIN inventory i   ON r.inventory_id = i.inventory_id
JOIN film f        ON i.film_id = f.film_id
WHERE ci.city = 'London'
GROUP BY c.customer_id, f.title
ORDER BY c.last_name, f.title;

#Q13)Display the top 5 rented movies along with the number of times they've been rented.
use sakila;
select f.title,f.film_id,count(r.rental_id) as No_of_Times_rented
from film f join inventory i on
f.film_id=i.film_id join rental r
on i.inventory_id=r.inventory_id
group by f.film_id
order by No_of_Times_rented
limit 5;

#Q14)Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
SELECT DISTINCT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN rental r1 ON c.customer_id = r1.customer_id
JOIN inventory i1 ON r1.inventory_id = i1.inventory_id
JOIN rental r2 ON c.customer_id = r2.customer_id
JOIN inventory i2 ON r2.inventory_id = i2.inventory_id
WHERE i1.store_id = 1
  AND i2.store_id = 2;


