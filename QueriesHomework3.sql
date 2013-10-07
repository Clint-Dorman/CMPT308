/* Clint Dorman */
/* Queries Homework 3 */
/*
Question 1

Get the cities of agents booking an order for customer c002.  Use a subquery.
*/

Select city
from agents
where aid in
   (select aid
    from orders
    where cid = 'c002'
   );
   
/*
Question 2

Get the cities of agents booking an order for customer c002.  This time use joins;
no subqueries.
*/

Select a.city
from agents a, orders o
where o.aid = a.aid 
and cid = 'c002';

/*
Question 3

Get the pids of products ordered through any agent who makes at least one order for
a customer in Kyoto.  Use subqueries.
*/

Select distinct pid
from orders
where aid in
   (select aid
    from orders
    where cid in
       (select cid
        from customers
        where city = 'Kyoto'
       )
   );
   
/*
Question 4

Get the pids of products ordered through any agent who makes at least one order for
a customer in Kyoto.  Use joins this time; no subqueries.
*/

Select distinct o2.pid
from orders o1, orders o2, customers c
where o1.cid = c.cid
and   o1.aid = o2.aid
and   c.city = 'Kyoto';

/*
Question 5

Get the names of customers who have never placed an order.  Use a subquery.
*/

Select name
from customers
where cid not in
   (select cid
    from orders
   );
   
 
/*
Question 6

Get the names of customers who have never placed an order.  Use an outer join.
*/

Select c.name
from orders o right outer join customers c
   on o.cid = c.cid
   where o.cid is null;
   
 /*
 Question 7
 
 Get the names of customers who placed at least one order through an agent 
 in their city, along with those agent(s) names.
 */
 
Select distinct c.name, a.name
from customers c, agents a, orders o
where c.cid = o.cid
and   o.aid = a.aid
and   c.city = a.city;

 /*
 Question 8
 
 Get the names of customers and agents in the same city, along with the 
 name of the city, regardless of whether or not the customer has ever 
 placed an order with that agent.
 */
 
 Select distinct c.name, a.name, c.city, a.city
 from customers c, agents a, orders o
 where c.cid = o.cid
 and   c.city = a.city;
 
 /*
 Question 9
 Get the name and city of customers who live in the city where the 
 least number of products are made.
 */
 
 Select c.name, c.city
 from customers c
 where city in
    (select city
     from products p
     group by (p.city)
     order by count(p.city) asc
     limit 1);
	 
	 
 /*
 Question 10
 
 Get the name and city of customers who live in a city where the 
 most number of products are made.
 */
 
Select c.name, c.city
 from customers c
 where city in
    (select city
     from products p
     group by (p.city)
     order by count(p.city) desc
     limit 1);
	 
/*
Question 11

Get the name and city of customers who live in any city where the most 
number of products are made.
*/

Select c.name, c.city
from customers c
where c.city in
   (select city
    from products p
    group by (p.city)
    having count(p.city) in
       (select count(p.city)
        from products p
        group by (p.city)
        order by count(p.city) desc
        limit 1
        )
    );

/*
Question 12

List the products whose priceUSD is above the average priceUSD.
*/

Select name
from products
group by name
having avg(priceUSD) > (select avg(priceUSD)
						from products);
						
/*
Question 13

Show the customer name, pid ordered, and the dollars for all 
customer orders, sorted by dollars from high to low.
*/

Select c.name, p.pid, o.dollars
from customers c, orders o, products p
where c.cid = o.cid
and   o.pid = p.pid
order by dollars desc;

/*
Question 14

Show all customer names (in order) and their total ordered, 
and nothing more.  Use coalesce to avoid showing NULLS.
*/

select c.name, coalesce (sum(o.dollars), 0)
from customers c left outer join orders o
   on c.cid = o.cid
   group by c.cid
   order by c.name asc;

/*
Question 15

Show the names of all customers who bought products from 
agents based in New York along with the names of the products 
they ordered, and the names of the agents who sold it to them.
*/

Select c.name, p.name, a.name
from customers c, orders o, products p, agents a
where a.city = 'New York'
and   c.cid  = o.cid
and   o.pid  = p.pid
and   o.aid  = a.aid;

/*
Question 16

Write a query to check the accuracy of the dollars column in the 
Orders table.  This means calculating Orders.dollars from other data 
in other tables and then comparing those values to the values in 
Orders.dollars.

*/

select o.ordno, o.dollars as "Incorrect",
   (p.priceUSD * o.qty) - ((p.priceUSD * o.qty) * (c.discount/100)) as "Correct"
   from orders o, products p, customers c
   where c.cid = o.cid
   and   o.pid = p.pid
   and   o.dollars <> (p.priceUSD * o.qty) - ((p.priceUSD * o.qty) * (c.discount/100));

/*
Question 17

Create an error in the dollars column of the Orders table so that 
you can verify your accuracy checking query.
*/

update orders
set    dollars = 2000
where  dollars = 180;

