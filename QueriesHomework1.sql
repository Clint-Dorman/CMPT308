/*
Clint Dorman
9/16/2013
Queries Homework 1
*/


/*Question #1 List All Data for All Customers.*/

SELECT 
  customers.cid, 
  customers.name, 
  customers.city, 
  customers.discount
FROM 
  public.customers;
  
/*Question #2 List the name and city of agents named Smith.*/

SELECT 
  agents.name, 
  agents.city
FROM 
  public.agents
WHERE 
  agents.name = 'Smith';

/*Question #3 List pid, name, and quantity of products costing more than US$1.25.*/

SELECT 
  products.pid, 
  products.name, 
  products.quantity
FROM 
  public.products
WHERE 
  products.priceusd > 1.25;
  
 /* Question #4 List the ordno and aid of all orders.*/
 
 SELECT 
  orders.ordno, 
  orders.aid
FROM 
  public.orders;
 
 /* Question #5 List the name and cities of customers not in Dallas.*/
 
 SELECT 
  customers.name, 
  customers.city
FROM 
  public.customers
WHERE 
  customers.city != 'Dallas';
 
 /* Question #6 List the names of agents in New York or Newark.*/
 
 SELECT 
  agents.name
FROM 
  public.agents
WHERE 
  agents.city = 'New York' OR 
  agents.city = 'Newark';
  
 /* Question #7 List all data for products not in New York or Newark that cost US$1 or less.*/
 
 SELECT 
  products.pid, 
  products.name, 
  products.city, 
  products.quantity, 
  products.priceusd
FROM 
  public.products
WHERE 
  city != 'New York' AND 
  city != 'Newark' AND 
  priceusd <= 1.00;
  
 /* Question #8 List all data for orders in January or March.*/
 
 SELECT 
  orders.ordno, 
  orders.mon, 
  orders.cid, 
  orders.aid, 
  orders.pid, 
  orders.qty, 
  orders.dollars
FROM 
  public.orders
WHERE 
  orders.mon = 'jan' OR 
  orders.mon = 'mar';

 /* Question #9 List all data for orders in February less than US$100.*/
 
 SELECT 
  orders.ordno, 
  orders.mon, 
  orders.cid, 
  orders.aid, 
  orders.pid, 
  orders.qty, 
  orders.dollars
FROM 
  public.orders
WHERE 
  orders.mon = 'feb' AND 
  orders.dollars < 100;
  
 /* Question #10 List all orders from the customer whose cid is C005.*/

 SELECT 
  orders.ordno, 
  orders.mon, 
  orders.cid, 
  orders.aid, 
  orders.pid, 
  orders.qty, 
  orders.dollars
FROM 
  public.orders
WHERE 
  orders.cid = 'c005';
  