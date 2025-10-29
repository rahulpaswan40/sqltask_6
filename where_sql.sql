select * from sales

select * from product

select * from customer

-- where query

select * from sales where sales > 700

select * from sales where ship_mode = 'Second Class'

select * from sales where ship_mode  != 'Second Class'

select * from sales where cust_id = 'BH-11710' and discount > 0.2

select * from sales where ship_mode = 'Standard Class' or ship_mode = 'First Class'

select * from sales where not profit between 1000 and 2000

select * from sales where order_date between '2015-01-01' and '2016-12-31'

select * from sales where ship_mode in ('Second Class','Standard Class')

select * from sales where id in (1,2,3,4,5)

select id,product_id,sales from sales where id <= 5

select * from sales where sales <= 5 order by id limit 5

select * from sales where order_date between '2015-01-01' and '2016-12-31' order by id limit 10