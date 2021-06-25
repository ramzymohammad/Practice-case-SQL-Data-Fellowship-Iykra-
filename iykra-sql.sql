-- Nomer 1
-- select * from film
-- where fulltext 
-- @@ to_tsquery('astronaut|Astronaut')

-- Nomer 2
-- ada 52 film yang memiliki rating 'R' dan replacement_cost antara 5 dan 15
-- select count(film_id) from film
-- where rating='R'
-- and(replacement_cost Between 5 and 15)

--nomer 3
-- staff yang berhak mendapatkan bonus adalah John Stephens
select staff.first_name, staff.last_name, count(payment_id) as payments_did_each_staff_member_handle, sum(amount) as the_total_amount_processed_by_each_staff_member from staff
join payment 
on staff.staff_id = payment.staff_id
group by staff.staff_id
order by payments_did_each_staff_member_handle desc, the_total_amount_processed_by_each_staff_member desc 

--nomer 4
-- select AVG(replacement_cost) as average_replacement_cost, rating from film
-- group by rating
-- order by average_replacement_cost desc



--Nomer 5
-- 5 customer yang paling banyak menghabiskan uang adalah Eleanor, Karl, Marion, Rhonda, Clara
-- select  customer.first_name,customer.last_name,customer.email, sum(amount), customer.customer_id from customer
-- join payment
-- on customer.customer_id = payment.customer_id
-- group by customer.customer_id
-- order by sum(amount) desc
-- limit 5

-- Nomer 6
-- select inventory.store_id, title, count(title) as copies from inventory
-- join film on inventory.film_id = film.film_id
-- group by inventory.store_id, inventory.film_id, film.title order by inventory.store_id asc, count(inventory.film_id) desc

--nomer 7
-- Clara, Eleanor, dan Karl berhak mendapatkan platinum credit card
-- select customer.first_name, customer.last_name, customer.email from customer
-- where customer_id in (
-- select customer_id from payment
-- group by customer_id
-- having count(customer_id)>=40)