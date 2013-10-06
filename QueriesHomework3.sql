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