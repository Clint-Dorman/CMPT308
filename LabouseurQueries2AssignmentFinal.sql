/*
Clint Dorman
September 24th, 2013
Queries2 Assignment
*/

/* Question 1 - Get the cities of agents booking an order for customer c002. */

Select a.city
from agents a, orders o
where o.aid = a.aid 
and cid = 'c002';


/* Question 2 - Get the pids of products ordered through any agent who makes at least
one order for a customer in Kyoto. (This is not the same as asking for pids
of products ordered by a customer in Kyoto.) */

Select pid
from orders
where aid in
   (select aid
    from orders o, customers c
    where o.cid = c.cid
    and city = 'Kyoto');
                
/* Question 3 - Find the cids and names of customers who never placed an order through agent a03 */

Select c.cid, c.name
from customers c
where cid not in
   (select cid
    from orders
    where aid = 'a03');

/* Question 4 - Get the cids and names of customers who ordered both product p01 and p07 */

Select distinct c.cid, c.name
from customers c, orders o
where c.cid = o.cid 
and pid = 'p01'
and o.cid in
    (select cid
     from orders
     where pid = 'p07');
    
/* Question 5 - Get the pids of products ordered by any customers who ever placed an order through agent a03 */

Select pid
from orders
where cid in
   (select cid
    from orders
    where aid = 'a03');

/* Question 6 - Get the names and discounts of all customers who place orders through agents in Dallas or Duluth */

Select distinct c.name, c.discount
from customers c, orders o, agents a
where c.cid = o.cid
and o.aid = a.aid
and (a.city = 'Dallas'
or a.city = 'Duluth');

/* Question 7 - Find all customers who have the same discount as that of any customers in Dallas or Kyoto */

Select name
from customers
where discount in
   (select discount
    from customers
    where city = 'Dallas'
    or city = 'Kyoto');
