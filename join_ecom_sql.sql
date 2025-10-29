select * from customer

select * from sales

select * from product 



--inner join --

select * from sales as s
inner join product as p
on s.product_id = p.product_id;

--subquery--
select * from sales as s where product_id in
(select product_id from product as p where s.product_id =p.product_id);



--left join --

select * from sales as s
left join product as p
on s.product_id = p.product_id
where p.category ='Furniture' and s.qty =4;


-- left join subquery --

select * from sales as s where product_id in (select product_id from product as p where s.product_id = p.product_id )and s.qty =4;




--right join--

select * from sales as s
right join product as p 
on s.product_id = p.product_id
order by qty
limit 150;

--right join subquery--
select * from sales as s
where product_id in 
(select product_id from product as p where s.product_id = p.product_id)
order by qty
limit 150;



--full join --

select * from sales as s
full join product as p
on s.product_id = p.product_id
where category ='Office Supplies'
and profit < 5;

--full join subquery --
select * from sales as s
where product_id in
(select product_id from product where category ='Office Supplies')
and profit <5;

--aggree --
select sum(qty) , ship_mode from sales as s
inner join product as p 
on s.product_id = p.product_id
group by ship_mode
order by sum(qty);


select sum(qty) , ship_mode from sales as s
where product_id in (select product_id  from product as p )
group by ship_mode order by sum(qty);


select avg(qty), category from sales as s
left join product as p
on s.product_id = p.product_id
right join customer as c
on s.cust_id = c.cust_id
group by category
order by avg(qty) ;
-- Subquery to get total quantity per category
select category, total_qty
from (
    select category, sum(qty) as total_qty
    from sales as s
    left join product as p
    on s.product_id = p.product_id
    group by category
) as sub
order by total_qty desc;



select min(qty), category from sales as s
left join product as p
on s.product_id = p.product_id
right join customer as c
on s.cust_id = c.cust_id
group by category
order by min(qty) ;

-- Subquery: Minimum quantity per category
SELECT sub.category, sub.min_qty
FROM (
    SELECT p.category, MIN(s.qty) AS min_qty
    FROM sales AS s
    LEFT JOIN product AS p ON s.product_id = p.product_id
    GROUP BY p.category
) AS sub
ORDER BY sub.min_qty ASC;




SELECT MAX(s.sales) AS max_sales, s.ship_mode
FROM sales AS s
FULL JOIN product AS p ON s.product_id = p.product_id
GROUP BY s.ship_mode;

SELECT sub.category, sub.min_sales
FROM (
    SELECT p.category, MIN(s.sales) AS min_sales
    FROM sales AS s
    LEFT JOIN product AS p ON s.product_id = p.product_id
    GROUP BY p.category
) AS sub
ORDER BY sub.min_sales ASC;

select * from sales

select count(sales), ship_mode from sales as s
inner join product as p
on s.product_id = p.product_id
group by ship_mode
having count(sales)>200;

--subquery--

select count(sales),ship_mode from sales as s
where product_id in
(select product_id from product)
group by ship_mode 
having count(sales)>200;

 
 


'