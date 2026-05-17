
DROP TABLE IF exists walmart;
create table walmart 
(
invoice_id int not null primary key,
Branch varchar(15),
City varchar(20),
category varchar(50),
unit_price decimal(10,2),
quantity int ,
sale_date date ,
sale_time time, 
payment_method varchar(50),
rating decimal(10,2),
profit_margin decimal(10,2),
total decimal(10,2)
)



select * from walmart;

select count(*) from walmart;

select 
	payment_method, count(*)
from walmart
group by payment_method ;

select count(distinct branch) as total_store from walmart;

-- Business Problems
-- What are the different payment methods, and how many transactions and
-- items were sold with each method?
select 
	payment_method , 
	count(*) as no_payment,
	sum(quantity) as total_qty_sold
	from walmart
group by payment_method;


-- 2.identify the highest rated category in each branch, displaying the branch,
-- category, avg rating
select * from(select 
	branch,
	category,
	round(avg(rating),2) as highest_rating ,
	branch,
	rank() over(partition by branch order by avg(rating)) as rank
	from walmart
group by branch, category)
where rank = 1

-- 3.Identify the busiest day in each branch based on the number of transaction.
select * from(
	select 
		branch, 
		to_char(sale_date, 'Day') as day_name,
		count(*) as no_transaction,
		rank() over(partition by branch order by count(*) desc ) as rank
		from walmart
		group by 1,2)
where rank = 1

-- 4.calculate the total quantity of item sold per payment_method .list payment_method and quantity.
select 
	payment_method,
	count(quantity) as total_transaction
	from walmart
	group by payment_method;

-- 5. Determine the average, minimun, and maximnu rating of category for each city
-- list the city, average rating, minimum, and maximum rating.

select
	city,
	category,
	round(avg(rating),2) as average_rating,
	max(rating) as maximum_rating,
	min(rating) as minimum_rating
	from walmart
	group by city, category;

-- 6. calacuate the total profit for each category by considering total_profit
-- as (unit_price*quantity*profit_margin) .list category and total_profit,
-- ordered from highest to lowest profit. 

select 
	category, 
	sum(total) as total_revenue,
	sum(total * profit_margin) as profit
	from walmart
	group by category;

-- 7. Determine the most common payment method for each branch. 
-- display branch and the preffered payment_method.

with cte as
(select 
	branch,
	payment_method,
	count(*) as total_transaction
	,rank() over(partition by branch order by count(*) desc) as rank
	from walmart
	group  by 1,2)
select * from cte 
where rank =1


-- 8.Categorizes sales into 3 group moring, afternoon, and evening
-- find out which of the shift and number of invoice.
select branch,
case
when extract(hour from sale_time ) < 12 then 'morning'
when extract(hour from sale_time) between 12 and 17 then 'afternoon'
else 'evening'
end as shift,
count(*)
from walmart
group by  1,2
order by count(*) desc;


-- 9. identify 5 branch with highest decrease ratio in revenue compare
-- to last year(current 2023 and last year 2022)

with revenue_2022 as(
	select
	branch,
	sum(total) as revenue
	from walmart
	where extract(year from sale_date) = 2022
	group by 1
),
revenue_2023 as(
	select 
	branch,
	sum(total) as revenue
	from walmart
	where extract(year from sale_date) = 2023
	group by 1)

select 
	ls.branch
	,ls.revenue as last_year_revenue,
	cs.revenue as cr_year_revenue,
	round(
	((ls.revenue - cs.revenue)/ls.revenue) * 100 ,2) as rev_dec_ratio
from revenue_2022 as ls
join
revenue_2023  as cs
on ls.branch = cs.branch
where ls.revenue > cs.revenue
order by 4 desc
limit 5

















